fastfetch

export SHELL=/usr/bin/zsh
eval "$(starship init zsh)"
setopt extended_glob

# fzf + fd setup
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"

# optional: enable history search
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

alias ll="ls -lah --color=auto"
alias c="clear"
alias cls="clear"
alias cat="bat"
alias ls="eza -l --icons"
alias syu="sudo dnf upgrade"
alias llm="llm -m gemini-2.0-flash-lite"
alias grep="rg"
alias codes="cd ~/Documents/PKM/01_Projects/Codes && ls"
alias config="/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME"

export PATH=/usr/local/cuda-11.8/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.8/lib64:$LD_LIBRARY_PATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
