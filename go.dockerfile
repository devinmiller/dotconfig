ARG BASE_IMAGE="dimwittedmonkey/dev-env"
FROM $BASE_IMAGE AS base

# Download and install Go
RUN curl -L https://go.dev/dl/go1.24.3.linux-amd64.tar.gz -o go1.24.3.linux-amd64.tar.gz && \
    rm -rf /usr/local/go && \
    tar -C /usr/local -xzf go1.24.3.linux-amd64.tar.gz && \
    rm go1.24.3.linux-amd64.tar.gz

# Make sure Goose is installed
RUN /usr/local/go/bin/go install github.com/pressly/goose/v3/cmd/goose@latest
# Make sure Air is installed
RUN /usr/local/go/bin/go install github.com/air-verse/air@latest

# Install development tools
RUN apt update && apt install -y \
  postgresql-client && \
  rm -rf /var/lib/apt/lists/*

# Download and install NVM and NodeJS
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && \
    . ~/.bashrc && nvm install 22

FROM base

# Fixes font display issues with tmux
ENV LANG=en_IN.UTF-8
# Set terminal colors
ENV TERM="xterm-256color"

# Create home directory for user
RUN mkdir -p /home/neodev/.config && \
    useradd -d /home/neodev -s /bin/zsh neodev

# Copy Go install files
RUN cp -r $HOME/go /home/neodev

# Copy NVM install files
RUN cp -r $HOME/.nvm /home/neodev/.config/nvm

# Copy config settings and scripts for user
COPY env/.config /home/neodev/.config
COPY env/.local  /home/neodev/.local
COPY env/.zshrc home/neodev/

RUN chown -R neodev:neodev /home/neodev

# switch to working directory
WORKDIR /workspace

# switch to neodev user
USER neodev

CMD ["/bin/bash", "-c", "tail -f /dev/null"]
