# Because I never remember:
#
# .zshrc is only sourced for interactive shells.

# Misc.
setopt AUTOCD

# IYKYK
bindkey -v

# Auto-escape URLs.
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Delete past the position entering insert mode.
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# Enable completion engine.
autoload -Uz compinit && compinit
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Doomed to relive it.
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

# Change cursor to line in insert mode.
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

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

setopt prompt_subst
ZLE_RPROMPT_INDENT=0

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%{%F{red}%}•'
zstyle ':vcs_info:*' stagedstr '%{%F{green}%}•'

zstyle ':vcs_info:git:*' formats '%{%F{11}%}%b(%c%u%{%F{11}%})'
zstyle ':vcs_info:git:*' actionformats '%{%F{11}%}%b[%{%F{11}%}%c%u%{%F{11}%}](%{%F{yellow}%}%a%F{11}%})'

PROMPT='%{%F{2}%}%3~ %(1j.%{%F{5}%}%j .)%(?.%F{3}.%F{9})%(!.%{%F{9}%}$.→) '
RPROMPT='${vcs_info_msg_0_}'

# Search for files quickly by path
function f() { ag --nocolor -l -g "$1" "${2:-.}"  }
