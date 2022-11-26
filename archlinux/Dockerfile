FROM docker.io/library/archlinux:base-devel
LABEL maintainer="ruahman <dego_vila@yahoo.com>"

RUN pacman -Syu --needed --noconfirm git

# ruahman user and workdir
ARG user=ruahman
RUN useradd --system --create-home $user \
  && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
USER $user
WORKDIR /home/$user

# Install yay
RUN git clone https://aur.archlinux.org/yay.git \
  && cd yay \
  && makepkg -sri --needed --noconfirm \
  && cd \
  # Clean up
  && rm -rf .cache yay

RUN yay -Syu rust \
             go \
             clang \
             deno \
             python \
             python-pip \
             neovim \
             tmux \
             zsh \
             --noconfirm

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY .zshrc /home/ruahman/

ENTRYPOINT ["/bin/zsh","-c"]
