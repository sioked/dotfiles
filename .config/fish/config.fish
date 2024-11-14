if status is-interactive
  source $HOME/.aliases

  set -gx PATH "/usr/local/sbin" $PATH
  export GPG_KEY=(tty)

  export FZF_DEFAULT_COMMAND='rg --hidden --ignore .git -g ""'
end

source $HOME/.profile
