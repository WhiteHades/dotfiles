# fastfetch
# shell config
export SHELL=/usr/bin/zsh
export STARSHIP_CACHE="$HOME/.cache/starship"
export STARSHIP_VI_MODE=true
eval "$(starship init zsh)"

# plugins
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh #must be last plugin to source

# fix recursion error when using zsh-vi-mode + starship
# reset zle-keymap-select to avoid infinite wrapping
zle-keymap-select() { true }
zle -N zle-keymap-select

# history
HISTSIZE=110000
SAVEHIST=100000
HISTFILE=~/.histfile

setopt extendedglob
setopt nocaseglob
setopt rcexpandparam
setopt numericglobsort
setopt nobeep
setopt share_history
setopt histignorealldups
setopt autocd
setopt histignorespace
setopt hist_reduce_blanks

# env: path config
export PATH=/usr/local/cuda-11.8/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.8/lib64:$LD_LIBRARY_PATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# colour man pages
export LESS_TERMCAP_mb=$'\e[01;32m'
export LESS_TERMCAP_md=$'\e[01;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;47;34m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;36m'
export LESS=-R

# completion system
autoload -U compinit && compinit

# tab completion enhancements
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# fzf config
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"
source <(fzf --zsh)

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# history substring search keybinds for vi(m) mode
for mode in vicmd viins; do
  bindkey -M $mode '^[[A' history-substring-search-up
  bindkey -M $mode '^[[B' history-substring-search-down
  bindkey -M $mode '^OA'  history-substring-search-up
  bindkey -M $mode '^OB'  history-substring-search-down
done

# enable fzf key bindings for zsh
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
[ -f /usr/share/fzf/shell/completion.zsh ] && source /usr/share/fzf/shell/completion.zsh

# alias: navigation/nvim (11)
alias nn="cd ~/.config/nvim && nvim"
alias ns="nvim ~/.config/starship.toml"
alias ng="nvim ~/.config/ghostty/config"
alias nz="nvim ~/.zshrc && source ~/.zshrc"
alias nf='fzf -m --preview="bat --color=always {}" --bind "enter:become(nvim {+})"'
alias co="clear && cd ~/Downloads && ls"
alias cr="clear && cd ~"
alias cc="clear && cd ~/.config"
alias sz="source ~/.zshrc"
alias catzs="cat ~/.zshrc"
alias codes="clear && cd ~/Documents/PKM/01_Projects/Codes && ls"

# alias: system utils (6)
alias c="clear"
alias cls="clear"
alias syu="sudo dnf upgrade"
alias updateall='flatpak update -y && sudo dnf upgrade --refresh -y && echo "All updates complete. Reboot now? (y/n)" && read ans && [ "$ans" = "y" ] && sudo reboot'  # 8
alias cleanall='sudo dnf autoremove -y && sudo dnf clean all'
alias updategrub='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'

# alias: file/view tools (8)
alias cat="bat"
alias ls="eza -l --icons"
alias ll="ls -lah --color=auto"
alias grep="rg"
alias copy="wl-copy"
alias paste="wl-paste"
alias ctar="echo *.tar.gz | copy"
alias cpwd="pwd | copy"

# alias: git dotfiles (2)
alias config="/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME"
alias lgdot="GIT_DIR=$HOME/.cfg GIT_WORK_TREE=$HOME lazygit"

# alias: apps (7)
alias tn="tmux new-session -s"
alias tl="tmux list-sessions"
alias ta="tmux attach-session"
alias vim="nvim"
alias nv="nvim"
alias anki="flatpak run net.ankiweb.Anki"
alias qtdebug="QTWEBENGINE_REMOTE_DEBUGGING=8080"

# alias: llm (1)
unalias llm 2>/dev/null
llm() {
  local tmpfile=$(mktemp --suffix=.md)
  local context="I'm using Fedora 42 Gnome DE, Ghostty terminal, Zsh"
  local prompt="$context $*. Give answer in max 5 lines"
  command llm -m gemini-2.0-flash-lite "$prompt" > "$tmpfile"
  glow "$tmpfile"
  rm "$tmpfile"
}

# function: download wrapper using aria2c
dl() {
  setopt localoptions noglob
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
    --check-certificate=false
  )

  if [[ -f "$INPUT" ]]; then
    aria2c "${ARIA_OPTS[@]}" --input-file="$INPUT"
  else
    aria2c "${ARIA_OPTS[@]}" "$INPUT"
  fi
}
