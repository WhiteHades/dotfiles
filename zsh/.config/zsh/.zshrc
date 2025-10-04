setopt extendedglob
setopt nocaseglob
setopt rcexpandparam
setopt numericglobsort
setopt nobeep
setopt autocd
setopt interactivecomments
setopt share_history
setopt histignorealldups
setopt histignorespace
setopt hist_reduce_blanks
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

bindkey -v
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# fzf: keybindings + completion
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"
source <(fzf --zsh)

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ]   && source /usr/share/fzf/completion.zsh

# autosuggestions & syntax highlighting
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# completion system
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select

# aliases
[ -f ~/.config/zsh/aliases.sh ] && source ~/.config/zsh/aliases.sh
