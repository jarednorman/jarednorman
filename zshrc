# Because I never remember:
#
# .zshrc is only sourced for interactive shells.

# Enable completion engine.
autoload -Uz compinit && compinit

# Enable fnm and automatically use the correct node.js version when changing
# directories.
eval "$(fnm env --use-on-cd)"

# Initialize rbenv.
eval "$(rbenv init - zsh)"

# Set up history substring search.
source ~/.zsh/vendor/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=2,bg=11"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=9,bg=11"

# Set up fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
