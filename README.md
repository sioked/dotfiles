# Dotfiles

These are my dotfiles. Currently just checking in the files directly in my home directory using the strategy defined here: [https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Installation

To install on a new machine do:
1. Set up github ssh access (create new key, add to github)

1. Set up the alias for 'config' in the current shell scope
  `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

1. Clone the repo:
  `git clone --bare <git-repo-url> $HOME/.cfg`

1. Checkout the dotfiles
  `config checkout`


## Other installs to finish setup for computer

1. [https://brew.sh/](homebrew)

1. Homebrew packages
  `brew install cask hub postgresql vim wget ruby yarn zsh z`

1. Casks
  `brew cask install iterm2 atom`

1. Fonts
  ```
    brew tap caskroom/fonts
    brew cask install font-fira-code
  ```

1. Install NVM from here: [https://github.com/creationix/nvm](https://github.com/creationix/nvm)

1. Install oh-my-zsh from here: [https://github.com/robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

1. Install vim-plug from here: [https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)

1. Install all vim plugins
  ```
  # Inside vim
  :PlugInstall
  ```
