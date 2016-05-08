Run [spacemacs](https://github.com/syl20bnr/spacemacs) within [tmux](http://tmux.github.io/) within a [Docker](https://www.docker.com/) container.
The [tmux config](https://github.com/jgmize/dotfiles/blob/master/.tmux.conf) has been customized to be closer to screen and vim. The bind key is ctrl+a.

# Usage Examples
## map the current directory to ~/src in the container
`docker run -itv $(pwd):/home/spacemacs/src quay.io/jgmize/spacemacs-tmux`

## map the current directory to ~/src in the container and use the host .ssh and .gitconfig
```sh
docker run -it \
    -v $(pwd):/home/spacemacs/src \
    -v $HOME/.ssh:/home/spacemacs/.ssh \
    -v $HOME/.gitconfig:/home/spacemacs/.gitconfig \
    quay.io/jgmize/spacemacs-tmux
```

# Caveats and Workarounds
* Attempting to detach with the tmux keybinding `ctrl+a d` will kill the container, but you can detach via the docker keybinding `ctrl+p ctrl+q`
* Attempting to attach to the running tmux session with `docker exec` and `tmux attach` will fail with `open terminal failed: not a terminal`, but `docker attach` works

# Related projects

* Eugene Yaramenko's dockerized gui spacemacs on [github](https://github.com/JAremko/spacemacs) and [Docker hub](https://hub.docker.com/r/jare/spacemacs/)
* Gregory Nisbit's [spacemacs-docker](https://github.com/gregory-nisbit/spacemacs-docker) (Non-functional as of this writing)
