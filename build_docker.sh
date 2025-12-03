GOOS=linux GOARCH=amd64 go build -o ./bin/a11/gateway.a11 ./services/gateway/main.go &
GOOS=linux GOARCH=amd64 go build -o ./bin/a11/home.a11 ./services/home/main.go &
GOOS=linux GOARCH=amd64 go build -o ./bin/a11/ai.a11 ./services/ai/main.go