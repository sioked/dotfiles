if status is-interactive
  source $HOME/.aliases

  set -gx PATH "/usr/local/sbin" $PATH
  export GPG_KEY=(tty)

  export FZF_DEFAULT_COMMAND='rg --hidden --ignore .git -g ""'
end

source $HOME/.profile

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
