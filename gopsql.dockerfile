ARG BASE_IMAGE="dimwittedmonkey/dev-env"
FROM $BASE_IMAGE AS base

# Download and install Go
RUN curl -L https://go.dev/dl/go1.24.3.linux-amd64.tar.gz -o go1.24.3.linux-amd64.tar.gz && \
    rm -rf /usr/local/go && \
    tar -C /usr/local -xzf go1.24.3.linux-amd64.tar.gz && \
    rm go1.24.3.linux-amd64.tar.gz

# Make sure Goose is installed
RUN /usr/local/go/bin/go install github.com/pressly/goose/v3/cmd/goose@latest

# install development tools
RUN apt update && apt install -y \
  postgresql-client && \
  rm -rf /var/lib/apt/lists/*

FROM base

# install user tools
RUN apt update && apt install -y \
  gosu && \
  rm -rf /var/lib/apt/lists/*

# Entry script to modify UID/GID for Linux systems
COPY entrypoint /entrypoint
# Make sure entrypoint script is executable
RUN chmod +x /entrypoint

# Fixes font display issues with tmux
ENV LANG=en_IN.UTF-8
# Set terminal colors
ENV TERM="xterm-256color"

# Create home directory for user
RUN mkdir -p /home/neodev

# Copy Go install files
RUN cp -r $HOME/go /home/neodev

# Copy config settings and scripts for user
COPY env/.config /home/neodev/.config
COPY env/.local  /home/neodev/.local
COPY env/.zshrc home/neodev/

# switch to working directory
WORKDIR /workspace

# Set default command
ENTRYPOINT ["/entrypoint"]

CMD ["/bin/bash", "-c", "tail -f /dev/null"]
