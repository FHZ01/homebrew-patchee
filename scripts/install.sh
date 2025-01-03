#!/bin/bash

# Build binary
go build -o patchee cmd/patchee/main.go

# Move to /usr/local/bin
sudo mv patchee /usr/local/bin/

# Set permissions
sudo chmod +x /usr/local/bin/patchee

echo "patchee installed successfully!"
