FROM docker.io/library/archlinux:base-devel
LABEL maintainer="ruahman <dego_vila@yahoo.com>"

# term color
ENV TERM xterm-256color

# set ruby gem path
ENV PATH="$PATH:/home/ruahman/.local/share/gem/ruby/3.0.0/bin"

# ruahman user and workdir
ARG user=ruahman
RUN useradd --system --create-home $user \
  && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user

USER $user
WORKDIR /home/$user

### add ssh
COPY id_ed25519 /home/$user/.ssh/
COPY id_ed25519.pub /home/ruahman/.ssh/
COPY known_hosts /home/ruahman/.ssh/
RUN sudo chown ruahman:ruahman /home/ruahman/.ssh/id_ed25519
RUN sudo chown ruahman:ruahman /home/ruahman/.ssh/id_ed25519.pub
RUN sudo chown ruahman:ruahman /home/ruahman/.ssh/known_hosts

COPY neovim /home/ruahman/.config/nvim

### Install yay

RUN sudo pacman -Syu --needed --noconfirm git

RUN git config --global user.email "dego_vila@yahoo.com" && \
    git config --global user.name "Diego Vila" && \
    git config --global core.editor "nvim" && \
    git config --global --add safe.directory /code


# Install yay
RUN git clone https://aur.archlinux.org/yay.git \
  && cd yay \
  && makepkg -sri --needed --noconfirm \
  && cd \
  # Clean up
  && rm -rf .cache yay


RUN yay -Syu rustup \
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
             emacs \
             zsh \
             ripgrep \
             fd \
             openssh \
             wget \
             unzip \
             lldb \
             --noconfirm

SHELL ["/bin/zsh","-c"]

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY zsh-autosuggestions /home/ruahman/.oh-my-zsh/custom/plugins/zsh-autosuggestions
COPY zsh-syntax-hightlighting /home/ruahman/.oh-my-zsh/custom/plugins/zsh-syntax-hightlighting

COPY .zshrc /home/ruahman/

#RUN rustup default stable
#RUN go install github.com/go-delve/delve/cmd/dlv@latest
#RUN pip install debugpy
#RUN pip install neovim
#RUN sudo npm install -g neovim
#RUN gem install neovim

ENTRYPOINT ["/bin/zsh","-c"]
