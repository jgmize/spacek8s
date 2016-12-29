FROM quay.io/deis/base:v0.3.5

RUN apt-get update && apt-get install -y --no-install-recommends emacs24-nox tmux git ssh

RUN adduser --uid 1001 --disabled-password --gecos '' spacemacs

WORKDIR /home/spacemacs
COPY spacemacs .emacs.d
COPY dotfiles dotfiles
RUN for f in .bashrc .profile .spacemacs .tmux.conf; do ln -sf dotfiles/$f; done

RUN chown spacemacs.spacemacs -R .
USER spacemacs

ENV LANG C.UTF-8
ENV TERM screen-256color
RUN emacs -nw -batch -u "${UNAME}" -q -kill
CMD ["tmux", "new", "-n", "emacs", "bash", "-ic", "et"]
