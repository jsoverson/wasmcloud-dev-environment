# WASMCloud Development Environment

Docker setup for developing on wasmcloud

## Environment

* git
* curl
* tmux
* gcc, libssl-dev, llvm, clang, build-essential
* nodejs LTS (w/ npm)
* rustup
* cargo
* * cargo-generate
* * cargo-make
* * cargo-expand
* * cargo-edit

## Scripts

`$ ./bin/devenv-start`

Start/restart the development container

`$ ./bin/devenv-shell`

Open a shell in the container

`$ ./bin/devenv-stop`

Stop the container

`$ ./bin/docker-build-latest`

Build and tag the latest docker image

## NATS + redis

You can use docker compose to start NATS and redis alongside the dev container.

$ docker-compose up --no-start

$ docker-compose start

$ docker-compose stop

### Using the wash REPL with docker-compose

Specify the rpc host via the service name from the docker compose config, i.e. `wash up --host nats`

## iTerm2 + tmux integration with remote host

If you...

* Use a mac
* Are developing on a remote server
* And use iTerm2

...you can use iTerm's tmux integration to open a terminal in your development container by using a command like:

`$ ssh -t [YOUR SERVER] "docker exec -it wasmcloud-dev tmux -u -CC new -A -s default"`



