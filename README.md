# dotfiles

## requirements
- arch linux (omarchy base)
- gnu stow
- hyprland, waybar, walker, fzf, fd, ripgrep

## setup
clone this repo to ~/dotfiles.

```bash
cd ~/dotfiles

# system configs
stow -v -t ~/.config/hypr hypr
stow -v -t ~/.config/waybar waybar
stow -v -t ~/.config/walker walker
stow -v -t ~/.config starship

# app configs
stow -v -t ~/.config nvim
stow -v -t ~/.config ghostty
stow -v -t ~/.config zsh
```

## details
- hyprland: 12px rounding. sharp if single window.
- walker: mocha theme, 12px rounded, keybind hints hidden.
- waybar: default sharp look.
- zsh: custom aliases (nf, ff, fo) for fzf + nvim workflow.
