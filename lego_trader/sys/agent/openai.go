package agent

import (
	"bufio"
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"strings"
)

func newSys(options *Options) (sys *Agent, err error) {
	sys = &Agent{options: options}
	return
}

type Agent struct {
	options *Options
}

// ChatCompletion performs a non-streaming OpenAI chat completion request.
func (a *Agent) ChatCompletion(ctx context.Context, req *ChatRequest) (*ChatResponse, error) {
	if a == nil || a.options == nil {
		return nil, fmt.Errorf("agent not initialized")
	}
	base := strings.TrimRight(a.options.BaseUrl, "/")
	if base == "" {
		base = "https://api.openai.com"
	}
	url := base + "/v1/chat/completions"

	payload, err := json.Marshal(req)
	if err != nil {
		return nil, err
	}
	httpReq, err := http.NewRequestWithContext(ctx, http.MethodPost, url, bytes.NewReader(payload))
	if err != nil {
		return nil, err
	}
	httpReq.Header.Set("Content-Type", "application/json")
	if a.options.Key != "" {
		httpReq.Header.Set("Authorization", "Bearer "+a.options.Key)
	}
	resp, err := http.DefaultClient.Do(httpReq)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	if resp.StatusCode < 200 || resp.StatusCode >= 300 {
		b, _ := io.ReadAll(resp.Body)
		return nil, fmt.Errorf("openai http %d: %s", resp.StatusCode, string(b))
	}
	var out ChatResponse
	dec := json.NewDecoder(resp.Body)
	if err := dec.Decode(&out); err != nil {
		return nil, err
	}
	return &out, nil
}

// ChatCompletionStream performs a streaming chat completion and calls onChunk for each SSE data chunk.
func (a *Agent) ChatCompletionStream(ctx context.Context, req *ChatRequest, onChunk func(*ChatChunk) error) error {
	if a == nil || a.options == nil {
		return fmt.Errorf("agent not initialized")
	}
	base := strings.TrimRight(a.options.BaseUrl, "/")
	if base == "" {
		base = "https://api.openai.com"
	}
	url := base + "/v1/chat/completions"
	req.Stream = true
	payload, err := json.Marshal(req)
	if err != nil {
		return err
	}
	httpReq, err := http.NewRequestWithContext(ctx, http.MethodPost, url, bytes.NewReader(payload))
	if err != nil {
		return err
	}
	httpReq.Header.Set("Content-Type", "application/json")
	httpReq.Header.Set("Accept", "text/event-stream")
	if a.options.Key != "" {
		httpReq.Header.Set("Authorization", "Bearer "+a.options.Key)
	}
	resp, err := http.DefaultClient.Do(httpReq)
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	if resp.StatusCode < 200 || resp.StatusCode >= 300 {
		b, _ := io.ReadAll(resp.Body)
		return fmt.Errorf("openai http %d: %s", resp.StatusCode, string(b))
	}
	// Read SSE: lines prefixed with "data: "
	reader := bufio.NewReader(resp.Body)
	for {
		select {
		case <-ctx.Done():
			return ctx.Err()
		default:
		}
		line, err := reader.ReadString('\n')
		if err != nil {
			if err == io.EOF {
				return nil
			}
			return err
		}
		line = strings.TrimSpace(line)
		if line == "" {
			continue
		}
		if !strings.HasPrefix(line, "data: ") {
			continue
		}
		data := strings.TrimSpace(strings.TrimPrefix(line, "data: "))
		if data == "[DONE]" {
			return nil
		}
		var chunk ChatChunk
		if err := json.Unmarshal([]byte(data), &chunk); err != nil {
			// swallow malformed chunk but continue
			if a.options.Log != nil {
				a.options.Log.Error("agent.openai stream.unmarshal")
			}
			continue
		}
		if onChunk != nil {
			if err := onChunk(&chunk); err != nil {
				return err
			}
		}
	}
}
