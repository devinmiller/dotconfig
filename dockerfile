FROM debian:stable AS neovim

# install neovim dependencies
RUN apt update && apt install -y \
  git \
  ninja-build \
  gettext \
  cmake \
  unzip \
  curl && \
  rm -rf /var/lib/apt/lists/*

# build and install Neovim
RUN git clone https://github.com/neovim/neovim  neovim && \
  cd neovim && \
  git checkout stable && \
  make CMAKE_BUILD_TYPE=Release && \
  make install && \
  rm -rf ../neovim

FROM neovim

# install terminal packages
RUN apt update && apt install -y \
  zsh \
  tmux \
  fzf \
  ripgrep \
  jq && \
  rm -rf /var/lib/apt/lists/*
