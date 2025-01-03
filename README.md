```markdown
# Patchee

A CLI tool for AWS EC2 instance management and SSH connections.

## Features

- Search EC2 instances using wildcards
- Quick SSH connections to instances using instance names

## Installation

### Using Homebrew
```bash
brew tap yourusername/patchee
brew install patchee
```

### From Source
```bash
git clone https://github.com/yourusername/patchee.git
cd patchee
make install
```

## Usage

### Search for instances
```bash
patchee search web-server*
```

### Connect to instance
```bash
patchee conn PR4325
```

## Requirements

- AWS CLI configured with proper credentials
- SSH key pair configured for EC2 instances
- Go 1.19 or later (for building from source)

## License

MIT
```
