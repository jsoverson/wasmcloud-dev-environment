FROM ubuntu:latest
MAINTAINER jsoverson <jsoverson@gmail.com>
 
ENV TZ=America/New_York

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update and upgrade before everything
RUN apt-get update && \
apt-get upgrade -y

# Install base dev environment
RUN apt-get install gcc pkg-config libssl-dev llvm clang build-essential -y

# Install dev tools
RUN apt-get install curl git tmux -y

# Install node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get install nodejs -y

# Install rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Export the cargo bin path
ENV PATH="/root/.cargo/bin:/cargo/bin:${PATH}"

ENV CARGO_HOME="/cargo"

# Install cargo tools
RUN cargo install cargo-make cargo-expand cargo-edit cargo-generate

# Add the root user to $USER so cargo can find it for cargo generate
ENV USER=root

# Copy the entrypoint file over
COPY docker-entrypoint.sh /usr/local/bin

# Fix script permissions
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh && \
ln -s /usr/local/bin/docker-entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
