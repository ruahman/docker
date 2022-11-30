python() {
  podman run \
    --interactive \
    --tty \
    --rm \
    --volume $PWD:/code \
    --workdir /code \
    --entrypoint python \
    docker.io/library/python:latest \
    "$@"
}

