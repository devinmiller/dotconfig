FROM debian:stable

ENV TERM="xterm-256colors"

# Switch to working directory
WORKDIR /workspace

# Set default command
CMD ["/bin/bash"] 
