
deno(){
  podman run \
    --interactive \
    --tty \
    --rm \
    --volume deno:/deno-dir \
    --volume $PWD:/code \
    --workdir /code \
    --entrypoint deno \
    docker.io/denoland/deno:latest \
    "$@"
}

cargo(){
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

go(){
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

