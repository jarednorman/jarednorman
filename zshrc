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

# Set up fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set up syntax highlighting.
source ~/.zsh/vendor/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Information on controlling the highlight styles can be found here:
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=9'
ZSH_HIGHLIGHT_STYLES[path]='fg=3'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=5'

# Set up history substring search.
source ~/.zsh/vendor/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=2,bg=11"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=9,bg=11"

# Set custom prompt.
autoload -U colors && colors
autoload -Uz add-zsh-hook vcs_info
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%{%F{red}%}•'
zstyle ':vcs_info:*' stagedstr '%{%F{green}%}•'

zstyle ':vcs_info:git:*' formats '%{%F{11}%}%b%c%u'
zstyle ':vcs_info:git:*' actionformats '%{%F{11}%}%b%c%u %{%F{yellow}%}%a'

setopt prompt_subst
PROMPT='%2~ %# '
RPROMPT='${vcs_info_msg_0_}'
