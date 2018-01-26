# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="pure"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow rails rake brew heroku textmate ruby osx rvm node npm jira tmux z)

source $ZSH/oh-my-zsh.sh

# Import aliases if we have them
source $HOME/.aliases

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/Applications

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

DEFAULT_USER="eds"

### Added to support local bin dir
export PATH="$HOME/bin:$PATH"

### Set the path system wide for tools like sublime to have access to them
launchctl setenv PATH $PATH

. `brew --prefix`/etc/profile.d/z.sh

nvm use default

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export TERM=xterm-256color

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/sioked/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/sioked/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/sioked/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/sioked/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

export GPG_KEY=$(tty)
