FROM debian:stable AS neovim

# install neovim dependencies
RUN apt update && apt install -y \
  git \
  ninja-build \
  gettext \
  cmake \
  unzip \
  curl

# clean up
RUN apt clean

# build and install Neovim
RUN git clone https://github.com/neovim/neovim  neovim && \
  cd neovim && \
  git checkout stable && \
  make CMAKE_BUILD_TYPE=Release && \
  make install && \
  rm -rf ../neovim

FROM neovim AS terminal

# install terminal packages
RUN apt update && apt install -y \
  zsh \
  tmux \
  fzf \
  ripgrep \
  jq

# clean up
RUN apt clean

# change shell to zsh
RUN chsh -s $(which zsh)

FROM terminal AS code

# Download and install Go
RUN curl -L https://go.dev/dl/go1.24.3.linux-amd64.tar.gz -o go1.24.3.linux-amd64.tar.gz && \
    rm -rf /usr/local/go && \
    tar -C /usr/local -xzf go1.24.3.linux-amd64.tar.gz && \
    rm go1.24.3.linux-amd64.tar.gz

# install development tools
RUN apt update && apt install -y \
  postgresql-client 

# clean up
RUN apt clean

FROM code

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Fixes font display issues with tmux
# ENV LC_ALL=en_IN.UTF-8
ENV LANG=en_IN.UTF-8
# set terminal colors
ENV TERM="xterm-256color"

# create a new (non root) user
RUN mkdir -p /home/neodev \
    && useradd -d /home/neodev -s /bin/zsh neodev \
    && chown neodev /home/neodev

COPY env home/neodev/config/env
COPY dev-env home/neodev/config

RUN chown -R neodev /home/neodev/config 

# switch to non root user
USER neodev

RUN cd /home/neodev/config \
    && ./dev-env \
    && rm -rf /home/neodev/config

# switch to working directory
WORKDIR /workspace

# Set default command
ENTRYPOINT ["/entrypoint"]

CMD ["/bin/bash", "-c", "tail -f /dev/null"]
