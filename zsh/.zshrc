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

if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi

eval "$(starship init zsh)"
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
source "$ZDOTDIR/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh"

MODE_CURSOR_VIINS="#a6e3a1 bar"
MODE_CURSOR_VICMD="#89b4fa block"
MODE_CURSOR_VISUAL="#f9e2af underline"

eval "$(atuin init zsh)"

# completion system
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select

# aliases
[ -f ~/.config/zsh/aliases.sh ] && source ~/.config/zsh/aliases.sh

# Created by `pipx` on 2025-10-08 13:03:13
export PATH="$PATH:/home/efaz/.local/bin"
export VOLTA_HOME="$HOME/.volta"
export VOLTA_FEATURE_PNPM=1
export PATH="$VOLTA_HOME/bin:$PATH"
export OLLAMA_ORIGINS="chrome-extension://*"
export OLLAMA_HOST="127.0.0.1:11434"
