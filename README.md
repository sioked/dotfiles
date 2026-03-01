# Dotfiles

These are my dotfiles. Managed using a bare git repo strategy as described here: [https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Installation

1. Set up GitHub SSH access (create new key, add to GitHub)

1. Set up the `config` alias in the current shell scope:
   ```sh
   alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
   ```

1. Clone the repo:
   ```sh
   git clone --bare <git-repo-url> $HOME/.cfg
   ```

1. Checkout the dotfiles:
   ```sh
   config checkout
   ```

## Other installs to finish setup

1. Install [Homebrew](https://brew.sh/)

1. Install Homebrew packages:
   ```sh
   brew bundle
   ```

1. Install [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish):
   ```sh
   curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
   ```

1. Install [fisher](https://github.com/jorgebucaran/fisher) and fish plugins:
   ```sh
   curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
   fisher update
   ```

1. Install [packer.nvim](https://github.com/wbthomason/packer.nvim):
   ```sh
   git clone --depth 1 https://github.com/wbthomason/packer.nvim \
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```

1. Install nvim plugins:
   ```
   # Inside nvim
   :PackerSync
   ```

1. Install [tmux plugin manager](https://github.com/tmux-plugins/tpm):
   ```sh
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

1. Install tmux plugins — inside tmux, press: `ctrl-a I`

1. Set iTerm2 font to **FiraCode Nerd Font Mono** in Preferences → Profiles → Text
