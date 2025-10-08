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

alias v='nvim'
alias nf='fzf -m --preview="bat --color=always {}" --bind "enter:become(nvim {+})"'
alias ff='fzf --preview '\''bat --style=numbers --color=always {}'\'''
alias sz='source "$ZDOTDIR/.zshrc"'
alias nz='nvim "$ZDOTDIR/.zshrc"'
alias cr='cd ~'
alias co='cd ~/Downloads'

alias unzip='tar -xzf'

# 1. llm --system $"You are an expert on Arch linux, ghostty, command line, TUI, zsh, etc. Respond as a power user. Hard cap: 10-11 lines. Nice formatting, to the point, commands in code syntax when useful; no fluff." --save ask
# 2. llm templates edit ask [for adding the model name]

ask() {
  command llm -t ask "$@" | glow
}
