# === BASIC SETTINGS ===
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt AUTO_CD

# === AUTO COMPLETE ===
autoload -Uz compinit
compinit

# === PLUGINS ===
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# === ALIASES ===
alias ll='ls -lah --color=auto'
alias gs='git status'
alias ..='cd ..'
alias ...='cd ../..'

# === MISC ===
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history

# === STARSHIP ===
eval "$(starship init zsh)"
