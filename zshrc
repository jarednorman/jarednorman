# Because I never remember:
#
# .zshrc is only sourced for interactive shells.

# Misc.
setopt AUTOCD

# We vim.
bindkey -v
export EDITOR=nvim

# Do GPG
export GPG_TTY=$(tty)

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
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

# Automatically expand aliases.
function expand-alias() {
  zle _expand_alias
  zle self-insert
}
zle -N expand-alias
bindkey -M main ' ' expand-alias

# Aliases
alias be="bundle exec"
alias ber="bundle exec rspec"
alias g="git"
alias x="eza -G"
alias xl="eza -l --git "
alias xt="eza -T"

# Enable fnm and automatically use the correct node.js version when changing
# directories.
eval "$(fnm env --use-on-cd)"

# Initialize rbenv.
eval "$(rbenv init - zsh)"

# Set up fzf.
[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

# Set up history substring search.
source ~/.zsh/vendor/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=2,fg=#fffaf3"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=1,fg=#fffaf3"

# Set custom prompt.
autoload -U colors && colors
autoload -Uz add-zsh-hook vcs_info
add-zsh-hook precmd vcs_info

setopt prompt_subst
ZLE_RPROMPT_INDENT=0

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%{%F{1}%}•'
zstyle ':vcs_info:*' stagedstr '%{%F{#286983}%}•'

zstyle ':vcs_info:git:*' formats ' %{%F{#9893a5}%}[%{%F{#575279}%}%b%{%%b%}%c%u%{%F{#9893a5}%}]'
zstyle ':vcs_info:git:*' actionformats ' %{%F{#9893a5}%}[%{%F{#575279}%}%b%{%%b%}%c%u%{%F{#9893a5}%}]|%{%F{#ea9d34}%}%a%{%F{#9893a5}%}]'

PROMPT='%{%F{#908caa}%}%3~${vcs_info_msg_0_} %(1j.%{%F{11}%}(%{%F{3}%}%j%{%F{11}%}).)
%(?.%{%F{2}%}.%{%F{1}%})%(!.#.$) %f'
RPROMPT=''

# Search for files quickly by path
function f() { ag --nocolor -l -g "$1" "${2:-.}"  }

function zgem() {
  GEM_NAME="$(bundle list --name-only | fzf)"
  zed "$(bundle info --path $GEM_NAME)"
}

# bun completions
[ -s "/Users/jardo/.bun/_bun" ] && source "/Users/jardo/.bun/_bun"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
