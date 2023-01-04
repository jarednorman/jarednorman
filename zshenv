# Because I never remember:
# .zshenv is always source, regardless of the type of shell.

# Setup Homebrew environment if it is present on the system.
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

export path=(
  $HOME/.bin
  $path
)

# There's a weird issue with Puma and some other Ruby things and I don't really
# care to find out what the deal is. This fixes it.
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# No springs.
export DISABLE_SPRING=true

# Make fzf pretty.
export FZF_DEFAULT_OPTS=" -e --color fg:12,bg:0,hl:9,fg+:7,bg+:10,hl+:9,info:8,prompt:12,spinner:8,pointer:9"

# Make bat pretty.
export BAT_THEME="base16"

# Tell Neovim where it is.
export VIMRUNTIME=/usr/local/share/nvim/runtime
