go() {
  podman run \
    --interactive \
    --tty \
    --rm \
    --volume go:/go \
    --volume $PWD:/code \
    --workdir /code \
    --entrypoint go \
    docker.io/library/golang:latest \
    "$@"
}

