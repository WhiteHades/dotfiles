# fastfetch

export SHELL=/usr/bin/zsh
eval "$(starship init zsh)"
setopt extended_glob

# fzf + fd setup
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"

# optional: enable history search
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey -r "^V"

alias ll="ls -lah --color=auto"
alias c="clear"
alias cls="clear"
alias cat="bat"
alias ls="eza -l --icons"
alias syu="sudo dnf upgrade"
unalias llm 2>/dev/null
llm() {
  local tmpfile=$(mktemp --suffix=.md)
  local context="I'm using Fedora 42 Gnome DE, Ghostty terminal, Zsh"
  local prompt="$context $* in max 5 lines"
  command llm -m gemini-2.0-flash-lite "$prompt" > "$tmpfile"
  glow "$tmpfile"
  rm "$tmpfile"
}
alias grep="rg"
alias codes="cd ~/Documents/PKM/01_Projects/Codes && ls"
alias config="/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME"
alias lgdot="GIT_DIR=$HOME/.cfg GIT_WORK_TREE=$HOME lazygit"
alias vim="nvim"
alias nv="nvim"
alias cdnvim="nvim ~/.config/nvim/"
alias cdd="cd ~/Downloads"
alias updateall='flatpak update -y && sudo dnf upgrade --refresh -y && echo "All updates complete. Reboot now? (y/n)" && read ans && [ "$ans" = "y" ] && sudo reboot'
alias cleanall='sudo dnf autoremove -y && sudo dnf clean all'
alias updategrub='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'

export PATH=/usr/local/cuda-11.8/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.8/lib64:$LD_LIBRARY_PATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

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

export PATH="$HOME/.npm-global/bin:$PATH"
