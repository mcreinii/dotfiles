# Find file named icon.* (case-insensitive)
ICON_FILE="$HOME/terminal/icon.png"

# Get terminal size
TERM_HEIGHT=$(tput lines)

# Use 30% of terminal height
CHAF_SIZE=$((TERM_HEIGHT * 50 / 100))

# Display image if found
if [[ -f "$ICON_FILE" ]]; then
    chafa $ICON_FILE --scale .5 --symbols=block --format=ansi
else
    echo "❌ No icon image found in $ICON_DIR"
fi

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
alias screen-rec="~/.tools/screen-record.sh"
alias nvim-mcreinii='NVIM_APPNAME=nvim-mcreinii nvim'
alias nvim-lazy='NVIM_APPNAME=nvim-lazy nvim'
alias scratch='nvim-lazy ~/notes/daily/scratch/Scratch-$(date +%F).md'
alias diary='nvim-mcreinii ~/notes/daily/diary/Diary-$(date +%F).md'
alias idea='nvim-lazy ~/notes/daily/ideas/Idea-$0-$(date +%F).md'

# === MISC ===
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history

# === STARSHIP ===
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/reini/.bun/_bun" ] && source "/home/reini/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
