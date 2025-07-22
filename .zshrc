# fastfetch
# shell config
export SHELL=/usr/bin/zsh
setopt extended_glob
eval "$(starship init zsh)"

# env: path config
export PATH=/usr/local/cuda-11.8/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.8/lib64:$LD_LIBRARY_PATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# fzf config
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"

# keybinds
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey -r "^V"

# alias: navigation (4)
alias cdv="nvim ~/.config/nvim/"
alias cdd="cd ~/Downloads"
alias cdr="cd ~"
alias codes="clear && cd ~/Documents/PKM/01_Projects/Codes && ls"

# alias: system utils (6)
alias c="clear"
alias cls="clear"
alias syu="sudo dnf upgrade"
alias updateall='flatpak update -y && sudo dnf upgrade --refresh -y && echo "All updates complete. Reboot now? (y/n)" && read ans && [ "$ans" = "y" ] && sudo reboot'  # 8
alias cleanall='sudo dnf autoremove -y && sudo dnf clean all'
alias updategrub='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'

# alias: file/view tools (5)
alias cat="bat"
alias ls="eza -l --icons"
alias ll="ls -lah --color=auto"
alias grep="rg"
alias copy="wl-copy"
alias paste="wl-paste"

# alias: git dotfiles (2)
alias config="/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME"
alias lgdot="GIT_DIR=$HOME/.cfg GIT_WORK_TREE=$HOME lazygit"

# alias: apps (3)
alias vim="nvim"
alias nv="nvim"
alias anki="flatpak run net.ankiweb.Anki"
alias qtdebug="QTWEBENGINE_REMOTE_DEBUGGING=8080"

# alias: llm (1)
unalias llm 2>/dev/null
llm() {
  local tmpfile=$(mktemp --suffix=.md)
  local context="I'm using Fedora 42 Gnome DE, Ghostty terminal, Zsh"
  local prompt="$context $* in max 5 lines"
  command llm -m gemini-2.0-flash-lite "$prompt" > "$tmpfile"
  glow "$tmpfile"
  rm "$tmpfile"
}

# function: download wrapper using aria2c
dl() {
  if [[ -z "$1" ]]; then
    echo "Usage: dl <url|file> [destination_folder]"
    return 1
  fi

  INPUT="$1"
  DEST="${2:-.}"  # default to current folder if not given

  mkdir -p "$DEST"

  ARIA_OPTS=(
    --continue=true
    --max-connection-per-server=16
    --split=16
    --dir="$DEST"
    --auto-file-renaming=false
    --max-concurrent-downloads=1
    --force-sequential=true
    --quiet=false
    --console-log-level=warn
    --summary-interval=0
    --enable-color=true
  )

  if [[ -f "$INPUT" ]]; then
    aria2c "${ARIA_OPTS[@]}" --input-file="$INPUT"
  else
    aria2c "${ARIA_OPTS[@]}" "$INPUT"
  fi
}

