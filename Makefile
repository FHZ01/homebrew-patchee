.PHONY: build install test clean

build:
	go build -o bin/patchee cmd/patchee/main.go

install:
	./scripts/install.sh

test:
	go test ./...

clean:
	rm -rf bin/
