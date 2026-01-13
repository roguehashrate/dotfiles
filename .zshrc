# Run fastfetch on shell start
fastfetch

# Source global definitions (if present)
if [[ -f /etc/zshrc ]]; then
  source /etc/zshrc
elif [[ -f /etc/bashrc ]]; then
  source /etc/bashrc
fi

# SSH
[ -f ~/.ssh/agent.env ] && source ~/.ssh/agent.env

# User-specific PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:$HOME/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Source user rc fragments
if [[ -d ~/.bashrc.d ]]; then
  for rc in ~/.bashrc.d/*; do
    [[ -f "$rc" ]] && source "$rc"
  done
fi
unset rc

# History
HISTFILE="$HOME/.config/zsh/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY

# Environment
export PAGER='bat'
export BAT_PAGER='less'

# Vim mode
bindkey -v
export KEYTIMEOUT=1

# Normal mode movements
bindkey -a 'n' vi-backward-char
bindkey -a 'e' vi-down-line-or-history
bindkey -a 'i' vi-up-line-or-history
bindkey -a 'o' vi-forward-char

# Enter insert mode
bindkey -a 'gi' vi-insert

# Enter visual mode
bindkey -a 'v' visual-mode

# Visual mode movements
bindkey -M visual 'n' vi-backward-char
bindkey -M visual 'e' down-line-or-history
bindkey -M visual 'i' up-line-or-history
bindkey -M visual 'o' vi-forward-char

# Visual mode operations
bindkey -M visual 'y' vi-yank
bindkey -M visual 'd' vi-delete
bindkey -M visual 'c' vi-change

# Aliases
alias vim="nvim"
alias cat="bat"
alias ls="exa --icons --group-directories-first"
alias ll="exa -lh --icons --git"
alias la="exa -lha --icons --git"
alias cl="clear && fastfetch"
alias sudo="echo Please try again, we use 'doas' around here"

# Cargo
. "$HOME/.cargo/env"

# Consolidated PATH setup
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin"

#OpenCode
export PATH="$HOME/.opencode/bin:$PATH"

# Prompt
eval "$(starship init zsh)"

# Directory jumping
eval "$(zoxide init zsh)"

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
