
arch(){
  if [ "$1" = "run" ]; then
    podman run \
      --interactive \
      --tty \
      --name arch \
      --volume $PWD:/home/ruahman/code \
      --workdir /home/ruahman/code \
      --entrypoint /bin/zsh \
      arch:1.0.0 \
      "$@"
  elif [ "$1" = "start" ]; then
    echo "...arch start"
    podman container start arch
  elif [ "$1" = "stop" ]; then
    echo "...arch stop"
    podman container rm arch
  elif [ "$1" = "commit" ]; then
    echo "...arch commit"
  elif [ "$1" = "rm" ]; then
    podman container rm arch
  else
    command='podman run \
      --interactive \
      --tty \
      --rm \
      --name arch \
      --volume $PWD:/home/ruahman/code \
      --workdir /home/ruahman/code \
      --entrypoint /bin/zsh \
      arch:1.0.0 \
      "$@"'
  fi

  echo $command
  eval $command
}

prune_images(){
  podman rmi $(podman images --filter "dangling=true" -q --no-trunc)
}

prune_container(){
  podman container prune
}

build_arch(){
  buildah bud -t arch:1.0.0 .
}

