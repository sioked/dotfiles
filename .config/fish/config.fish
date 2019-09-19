source $HOME/.aliases
source $HOME/.config/github/keys.config

set -gx PATH "/usr/local/sbin" $PATH
export NVM_DIR="$HOME/.nvm"
function nvm
  bass source ~/.nvm/nvm.sh ';' nvm $argv
end
# Set path for system wide tools to have access
nvm use default
export GPG_KEY=(tty)
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

fish_vi_key_bindings
set -gx PATH /usr/local/sbin /usr/local/opt/ruby/bin $HOME/Library/Python/3.7/bin $PATH

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
