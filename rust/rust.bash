cargo() {
  podman run \
    --interactive \
    --tty \
    --rm \
    --volume cargo:/.cargo \
    --volume $PWD:/code \
    --workdir /code \
    --entrypoint cargo \
    docker.io/library/rust:latest \
    "$@"
}

rustc() {
  podman run \
    --interactive \
    --tty \
    --rm \
    --volume cargo:/.cargo \
    --volume $PWD:/code \
    --workdir /code \
    --entrypoint rustc \
    docker.io/library/rust:latest \
    "$@"
}

