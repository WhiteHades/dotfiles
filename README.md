# dotfiles

Linux dotfiles for zsh, neovim/lazyvim, tmux, and other CLI tools. Designed to be **non-destructive** and modular.

<br>

## setup

This repo uses the **bare Git repo** strategy to avoid polluting the `$HOME` and allow safe dotfile tracking.

### 1. backup existing dotfiles

```sh
mkdir -p ~/.dotfiles_backup
cp ~/.zshrc ~/.tmux.conf ~/.gitconfig ~/.config/nvim/init.lua ~/.dotfiles_backup 2>/dev/null
```

### 2. clone as bare git repo

```sh
git clone --bare https://github.com/WhiteHades/dotfiles.git $HOME/.cfg
```

### 3. define alias to manage dotfiles

```sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

And add to `.zshrc` or `.bashrc`:

```sh
echo "alias config='/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME'" >> ~/.zshrc
source ~/.zshrc
```

### 4. checkout the dotfiles

```sh
config checkout
```

> If there are conflicts:
> ```sh
> config checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} ~/.dotfiles_backup/
> config checkout
> ```

### 5. hide untracked files

```sh
config config --local status.showUntrackedFiles no
```
<br>

## to update or push

```sh
config add .
config status
config commit -m "commit message"
config push origin main
```
<br>

## notes

- files are tracked selectively via `.gitignore` to avoid leaking system- or sensitive files.
- can customize what's tracked in `.gitignore`.

