export ARCH_TAG="1.0.0"

arch(){
  if [ -z "$2" ]; then
    tag=$ARCH_TAG
  else
    tag=$2
  fi

  SOURCE_DIR=$(dirname $BASH_SOURCE)
 
  if [ "$1" = "build" ]; then
    command='buildah bud -t arch:$tag $SOURCE_DIR'
  elif [ "$1" = "run" ]; then
    command='podman run -it --name arch -v cargo:/home/ruahman/.cargo -v $PWD:/code --workdir /code arch:$tag /bin/zsh'
  elif [ "$1" = "start" ]; then
    command='podman start arch'
  elif [ "$1" = "stop" ]; then
    command='podman stop arch'
  elif [ "$1" = "commit" ]; then
    command='podman commit arch arch:$tag'
  elif [ "$1" = "rm" ]; then
    command='podman rm arch'
  else
    command='podman run -it --rm -v cargo:/home/ruahman/.cargo -v $PWD:/code --workdir /code arch:$tag /bin/zsh'
  fi

  echo $command
  eval $command
}

refresh(){
  source ~/.bashrc
}

prune_images(){
  podman rmi $(podman images --filter "dangling=true" -q --no-trunc)
}

prune_container(){
  podman container prune
}

