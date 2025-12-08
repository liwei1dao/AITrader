package agent

import "context"

type (
	ISys interface {
		// ChatCompletion 执行一次非流式的 OpenAI Chat Completions 请求
		ChatCompletion(ctx context.Context, req *ChatRequest) (*ChatResponse, error)
		// ChatCompletionStream 执行一次流式请求，逐段返回
		ChatCompletionStream(ctx context.Context, req *ChatRequest, onChunk func(*ChatChunk) error) error
	}
	// OpenAI Chat Completions request/response types (v1)
	ChatMessage struct {
		Role    string `json:"role"`
		Content string `json:"content"`
	}

	ChatRequest struct {
		Model            string                 `json:"model"`
		Messages         []ChatMessage          `json:"messages"`
		Temperature      *float64               `json:"temperature,omitempty"`
		TopP             *float64               `json:"top_p,omitempty"`
		MaxTokens        *int                   `json:"max_tokens,omitempty"`
		N                *int                   `json:"n,omitempty"`
		Stream           bool                   `json:"stream,omitempty"`
		Stop             []string               `json:"stop,omitempty"`
		PresencePenalty  *float64               `json:"presence_penalty,omitempty"`
		FrequencyPenalty *float64               `json:"frequency_penalty,omitempty"`
		LogitBias        map[string]int         `json:"logit_bias,omitempty"`
		User             *string                `json:"user,omitempty"`
		ResponseFormat   map[string]interface{} `json:"response_format,omitempty"`
	}
	ChatChoice struct {
		Index        int         `json:"index"`
		Message      ChatMessage `json:"message"`
		FinishReason string      `json:"finish_reason"`
	}

	ChatUsage struct {
		PromptTokens     int `json:"prompt_tokens"`
		CompletionTokens int `json:"completion_tokens"`
		TotalTokens      int `json:"total_tokens"`
	}
	ChatResponse struct {
		ID      string       `json:"id"`
		Object  string       `json:"object"`
		Created int64        `json:"created"`
		Model   string       `json:"model"`
		Choices []ChatChoice `json:"choices"`
		Usage   *ChatUsage   `json:"usage,omitempty"`
	}
	// Streaming chunk types
	ChatStreamDelta struct {
		Role    string `json:"role,omitempty"`
		Content string `json:"content,omitempty"`
	}

	ChatStreamChoice struct {
		Index        int             `json:"index"`
		Delta        ChatStreamDelta `json:"delta"`
		FinishReason *string         `json:"finish_reason,omitempty"`
	}

	ChatChunk struct {
		ID      string             `json:"id"`
		Object  string             `json:"object"`
		Created int64              `json:"created"`
		Model   string             `json:"model"`
		Choices []ChatStreamChoice `json:"choices"`
	}
)

var defsys *Agent

func OnInit(config map[string]interface{}, opt ...Option) (err error) {
	var option *Options
	if option, err = newOptions(config, opt...); err != nil {
		return
	}
	defsys, err = newSys(option)
	return
}
func NewSys(opt ...Option) (sys ISys, err error) {
	var option *Options
	if option, err = newOptionsByOption(opt...); err != nil {
		return
	}
	sys, err = newSys(option)
	return
}
