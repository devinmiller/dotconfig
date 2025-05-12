FROM alpine:3.18 AS build

# Install dependencies required for building Neovim
RUN apk add --no-cache bash

# Switch to working directory
WORKDIR /workspace

# Set default command
CMD ["/bin/bash"] 