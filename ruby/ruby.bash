ruby() {
  podman run \
    --interactive \
    --tty \
    --rm \
    --volume $PWD:/code \
    --workdir /code \
    --entrypoint ruby \
    docker.io/library/ruby:latest \
    "$@"
}

irb() {
  podman run \
    --interactive \
    --tty \
    --rm \
    --volume $PWD:/code \
    --workdir /code \
    --entrypoint irb \
    docker.io/library/ruby:latest \
    "$@"
}
