dotnet() {
  podman run \
    --interactive \
    --tty \
    --rm \
    --volume $PWD:/code \
    --workdir /code \
    --entrypoint dotnet \
    mcr.microsoft.com/dotnet/sdk:7.0 \
    "$@"
}

