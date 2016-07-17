FROM quay.io/deis/base:0.3.0

RUN apt-get update && apt-get install -y --no-install-recommends emacs24-nox tmux git ssh

RUN adduser --uid 1001 --disabled-password --gecos '' spacemacs
WORKDIR /home/spacemacs

COPY spacemacs /home/spacemacs/.emacs.d
COPY dotfiles/.spacemacs /home/spacemacs/
COPY dotfiles/.tmux.conf /home/spacemacs/
COPY dotfiles/.bash* /home/spacemacs/

RUN chown spacemacs.spacemacs -R .
USER spacemacs

ENV LANG C.UTF-8
RUN emacs -nw -batch -u "${UNAME}" -q -kill
CMD ["tmux","new","emacs"]
