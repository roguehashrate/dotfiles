# .zshrc

# Run fastfetch on shell start
fastfetch

# Source global definitions (if present)
if [[ -f /etc/zshrc ]]; then
  source /etc/zshrc
elif [[ -f /etc/bashrc ]]; then
  source /etc/bashrc
fi

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

# Environment
export PAGER='bat'
export BAT_PAGER='less'

# Aliases
alias vim="nvim"
alias cat="bat"
alias ls="exa --icons --group-directories-first"
alias ll="exa -lh --icons --git"
alias la="exa -lha --icons --git"
alias cl="clear && fastfetch"
alias sudo="echo Please try again, we use 'doas' around here"

# Rust
if [[ -f "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
fi

# Additional PATH entries
export PATH="$PATH:/usr/local/bin"
export PATH="$HOME/.scripts:$PATH"

# Prompt
eval "$(starship init zsh)"

# Directory jumping
eval "$(zoxide init zsh)"

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
