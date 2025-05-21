FROM debian:stable AS neovim

WORKDIR /tmp

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

RUN git clone https://github.com/neovim/neovim  $HOME/src/neovim && \
  cd $HOME/src/neovim && \
  git checkout stable && \
  make CMAKE_BUILD_TYPE=Release && \
  make install && \
  rm -rf $HOME/src/neovim

FROM neovim AS terminal

RUN apt update && apt install -y \
  zsh \
  tmux \
  fzf \
  ripgrep

RUN chsh -s $(which zsh)

ENV TERM="xterm-256color"
# Fixes font display issues with tmux
# ENV LC_ALL=en_IN.UTF-8
ENV LANG=en_IN.UTF-8

FROM terminal AS code

# Download and install Go
RUN curl -L https://go.dev/dl/go1.24.3.linux-amd64.tar.gz -o go1.24.3.linux-amd64.tar.gz && \
    rm -rf /usr/local/go && \
    tar -C /usr/local -xzf go1.24.3.linux-amd64.tar.gz && \
    rm go1.24.3.linux-amd64.tar.gz

FROM code

COPY env /config/env
COPY dev-env /config

# Switch to working directory
WORKDIR /config

RUN ["/bin/bash", "-c", "./dev-env"]

# Set default command
CMD ["tail", "-f", "/dev/null"] 
