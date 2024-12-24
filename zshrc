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
alias z="eza -G --git"
alias za="eza -G --git -a"
alias zl="eza -l --git "
alias zla="eza -l --git -a"
alias zt="eza -T --git"
alias zta="eza -T --git -a"

# Enable fnm and automatically use the correct node.js version when changing
# directories.
# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

export PATH=$HOME/.local/bin:$PATH

# Initialize rbenv.
eval "$(rbenv init - zsh)"

# Set up fzf.
[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

# Set up history substring search.
source ~/.zsh/vendor/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=3,underline"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=1,underline"

autoload -U colors && colors

autoload -U promptinit; promptinit
prompt pure

# Search for files quickly by path
function f() { ag --nocolor -l -g "$1" "${2:-.}"  }

function tgem() {
  GEM_NAME="$(bundle list --name-only | fzf)"
  tmux new-window -c "$(bundle info --path $GEM_NAME)" -n "$GEM_NAME"
}

function zgem() {
  GEM_NAME="$(bundle list --name-only | fzf)"
  zed "$(bundle info --path $GEM_NAME)"
}

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/jardo/.opam/opam-init/init.zsh' ]] || source '/Users/jardo/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
