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
  make install

FROM neovim AS terminal

RUN apt update && apt install -y \
  zsh \
  tmux \
  fzf

RUN chsh -s $(which zsh)

ENV TERM="xterm-256color"
# Fixes font display issues with tmux
ENV LC_ALL=en_IN.UTF-8
ENV LANG=en_IN.UTF-8

FROM terminal

COPY env /config/env
COPY dev-env /config

# Switch to working directory
WORKDIR /config

RUN ["/bin/bash", "-c", "./dev-env"]

# Set default command
CMD ["/bin/zsh"] 
