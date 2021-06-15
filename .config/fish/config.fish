if status is-interactive
  source $HOME/.aliases
  source $HOME/.config/github/keys.config

  set -gx PATH "/usr/local/sbin" $PATH
  export NVM_DIR="$HOME/.nvm"
  nvm use default
  export GPG_KEY=(tty)

  fish_vi_key_bindings

  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
end
status --is-interactive; and source (rbenv init -|psub)
