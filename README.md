# Dotfiles

Managed using a bare git repo strategy as described here: [https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Docs

- [Fish shell & fzf keybindings](.config/fish/README.md)
- [Neovim keybindings & plugins](.config/nvim/README.md)

---

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

### 3. Authenticate with GitHub and clone dotfiles

Install the GitHub CLI and log in — this handles all git authentication over HTTPS without needing a personal access token or SSH key at this stage.

```sh
brew install gh
gh auth login
```

Then clone and check out the dotfiles:

```sh
gh auth setup-git
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

Installs core tools: fish, neovim, tmux, iTerm2, FiraCode Nerd Font, efm-langserver, prettier, and more.

```sh
brew bundle
```

Optionally install extra dev tools (httpie, htop, yarn, etc.):

```sh
brew bundle --file Brewfile.extras
```

### 5. Set Fish as your default shell

```sh
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
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

---

## Remote Access

### Enable SSH and set local hostname

1. Go to **System Settings → General → Sharing**
2. Turn on **Remote Login**
3. Under **Local Hostname**, set the name you want to use on your network (e.g. `mycomputer`)

You can then SSH into this machine from any computer on the same network:

```sh
ssh sioked@mycomputer.local
```

### Add a public key to authorized_keys

To allow a specific key to authenticate, add its public key to this machine.

**Using the 1Password CLI (recommended):**

```sh
# List SSH keys stored in 1Password to find the right name
op item list --categories "SSH Key"

# Add the public key directly to authorized_keys
mkdir -p ~/.ssh
op item get "YOUR KEY NAME" --fields "public key" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

**Manually:**

```sh
mkdir -p ~/.ssh
echo "ssh-ed25519 AAAA... your-key-comment" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

The public key can be copied from **1Password → the SSH key item → Public Key** field. Public keys are not sensitive and safe to copy.

### Configure the 1Password SSH agent (on the connecting machine)

The 1Password SSH agent lets you use keys stored in 1Password without ever writing the private key to disk.

1. In 1Password, go to **Settings → Developer**
2. Enable **Use the SSH agent**
3. Add the following to `~/.ssh/config` on the connecting machine:

```
Host *
  IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
```

Then SSH as normal — 1Password will prompt for biometric approval when the key is used:

```sh
ssh sioked@mycomputer.local
```
