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
             nodejs \
             npm \
             ruby \
             python \
             python-pip \
             luarocks \
             neovim \
             tmux \
             zsh \
             ripgrep \
             fd \
             openssh \
             wget \
             unzip \
             lldb \
             --noconfirm

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

WORKDIR /home/ruahman/.oh-my-zsh/custom/plugins

RUN git clone https://github.com/zsh-users/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

COPY .zshrc /home/ruahman/

SHELL ["/bin/zsh","-c"]

RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN pip install debugpy
RUN pip install neovim
RUN sudo npm install -g neovim
RUN sudo gem install neovim

WORKDIR /home/ruahman/.config/

ENV TERM xterm-256color

WORKDIR /home/ruahman/.ssh/
COPY id_ed25519 .
COPY id_ed25519.pub .
COPY known_hosts .
RUN sudo chown ruahman:ruahman id_ed25519
RUN sudo chown ruahman:ruahman known_hosts

WORKDIR /home/ruahman/.config/
RUN git config --global user.email "dego_vila@yahoo.com" && \
    git config --global user.name "Diego Vila" && \
    git config --global core.editor "nvim" && \
    git clone git@github.com:ruahman/neovim.git nvim 

WORKDIR /home/ruahman

ENTRYPOINT ["/bin/zsh","-c"]
