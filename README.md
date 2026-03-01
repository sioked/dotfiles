# Dotfiles

Managed using a bare git repo strategy as described here: [https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Prerequisites

Starting assumption: fresh macOS install with nothing except the default Terminal.app and zsh.

You will need:
- A GitHub account
- An Anthropic account for Claude Code

---

## Setup

### 1. Xcode Command Line Tools

Required for `git`, compilers, and Homebrew.

```sh
xcode-select --install
```

### 2. Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

On Apple Silicon, add Homebrew to your PATH before continuing:

```sh
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### 3. Clone dotfiles

Clone via HTTPS (no SSH key required). GitHub will prompt for credentials, or you can authenticate with a [personal access token](https://github.com/settings/tokens).

```sh
git clone --bare https://github.com/<username>/<repo>.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
```

> If checkout fails due to conflicting files, back them up and retry:
> ```sh
> mkdir -p ~/.dotfiles-backup && \
>   config checkout 2>&1 | grep "^\s" | awk '{print $1}' | \
>   xargs -I{} mv {} ~/.dotfiles-backup/{}
> config checkout
> ```

### 4. Install Homebrew packages

Installs everything in the Brewfile: fish, neovim, tmux, iTerm2, FiraCode Nerd Font, efm-langserver, prettier, and more.

```sh
brew bundle
```

### 5. Set Fish as your default shell

```sh
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

Open a new terminal session to continue in Fish.

### 6. Configure iTerm2

- Open iTerm2 (installed via Brewfile)
- Go to **Preferences → Profiles → Text**
- Set font to **FiraCode Nerd Font Mono**

### 7. Set up GitHub SSH access (optional but recommended for pushing)

```sh
ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub  # copy this and add it to GitHub → Settings → SSH keys
ssh -T git@github.com      # verify it works
```

Then update your dotfiles remote to use SSH:
```sh
config remote set-url origin git@github.com:<username>/<repo>.git
```

### 8. Install Claude Code

Requires Node — use nvm (installed via Brewfile):

```sh
nvm install --lts
npm install -g @anthropic-ai/claude-code
```

### 9. Install Oh My Fish

```sh
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

### 10. Install fisher and fish plugins

```sh
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher update
```

### 11. Install packer.nvim

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### 12. Install nvim plugins

```sh
# Inside nvim
:PackerSync
```

### 13. Install tmux plugin manager

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 14. Install tmux plugins

Start a tmux session, then press `ctrl-a I`.
