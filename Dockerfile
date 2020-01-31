FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends emacs tmux git ssh

RUN adduser --uid 1001 --disabled-password --gecos '' spacek8s

WORKDIR /home/spacek8s
COPY spacemacs .emacs.d
COPY dotfiles dotfiles
RUN for f in .bashrc .profile .spacemacs .tmux.conf; do ln -sf dotfiles/$f; done

RUN chown spacek8s.spacek8s -R .
USER spacek8s

ENV LANG C.UTF-8
ENV TERM screen-256color
#RUN emacs -nw -batch -u "${UNAME}" -q -kill
# Error while contacting melpa repository!
# error in process filter: Could not create connection to orgmode.org:443
CMD ["tmux", "new", "-n", "emacs", "bash", "-ic", "et"]
