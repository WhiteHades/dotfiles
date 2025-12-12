alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cat='bat'
alias grep='rg'
alias ls='eza -lh --group-directories-first --icons=auto'
alias la='eza -lah --group-directories-first --icons=auto'
alias lt='eza -lh --group-directories-first --icons=auto --tree --level=2'
alias lta='eza -lah --group-directories-first --icons=auto --tree --level=2'
alias lgt='eza -lh --group-directories-first --icons=auto --git --tree --level=2'

alias c='clear'
alias cl='clear'
alias cls='clear'
alias v='nvim'
alias nf='fzf -m --preview="$HOME/.local/bin/fzf-preview {}" --bind "enter:become(nvim {+})"'
alias sz='source "$ZDOTDIR/.zshrc"'
alias nz='nvim "$ZDOTDIR/.zshrc"'
alias cr='cd ~'
alias co='cd ~/Downloads'

alias unzip='tar -xzf'
alias yt-dlp='noglob yt-dlp'

# 1. llm --system $"You are an expert on Arch linux, ghostty, command line, TUI, zsh, etc. Respond as a power user. Hard cap: 10-11 lines. Nice formatting, to the point, commands in code syntax when useful; no fluff." --save ask
# 2. llm templates edit ask [for adding the model name]

ask() {
  command llm -t ask "$@" | glow
}

unalias ff 2>/dev/null
unalias fo 2>/dev/null

__pick_root() {
  # Usage:
  #   __pick_root            -> git root if in repo else $HOME
  #   __pick_root .          -> current dir
  #   __pick_root /path      -> that path
  #   __pick_root -z [terms] -> zoxide interactive directory pick (fuzzy)
  if [[ "${1:-}" == "-z" ]]; then
    shift
    zoxide query -i "$@" 2>/dev/null || return 1   # interactive selector [web:150]
    return 0
  fi

  if [[ -n "${1:-}" ]]; then
    print -r -- "$1"
    return 0
  fi

  git rev-parse --show-toplevel 2>/dev/null || print -r -- "$HOME"  # repo root default [web:98]
}

__fd_list() {
  local root; root="$(__pick_root "$@")" || return 1
  if [[ "$root" == "/" ]]; then
    fd -HI -t f . / -E proc -E sys -E dev -E run -E tmp -E var/cache -E var/lib -E .git 2>/dev/null
  else
    fd -HI -t f . "$root" --exclude .git 2>/dev/null  # fd takes a search path arg [web:95]
  fi
}

ff() {
  __fd_list "$@" \
  | fzf --preview "$HOME/.local/bin/fzf-preview {}" --preview-window=right:60%:wrap
}

fo() {
  __fd_list "$@" \
  | fzf --preview "$HOME/.local/bin/fzf-preview {}" --preview-window=right:60%:wrap \
        --bind 'enter:execute-silent(nohup xdg-open {} >/dev/null 2>&1 &)+abort' \
        --bind 'ctrl-e:become(nvim {})'
}
