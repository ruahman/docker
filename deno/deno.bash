deno () {
  podman run \
    --interactive \
    --tty \
    --rm \
    --volume $PWD:/code \
    --volume deno:/deno-dir \
    --workdir /code \
    docker.io/denoland/deno:latest \
    "$@"
}

