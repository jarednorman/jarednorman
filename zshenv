# Because I never remember:
# .zshenv is always source, regardless of the type of shell.

# Setup Homebrew environment if it is present on the system.
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

export path=(
  $HOME/.bin
   $(brew --prefix)/opt/libpq/bin
  $path
)

# There's a weird issue with Puma and some other Ruby things and I don't really
# care to find out what the deal is. This fixes it.
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# No springs.
export DISABLE_SPRING=true

# Make fzf pretty.
export FZF_DEFAULT_OPTS=" -e --color fg:8,bg:0,hl:5,fg+:7,bg+:8,hl+:5,info:5,prompt:5,spinner:5,pointer:5"

# Tell Neovim where it is.
export VIMRUNTIME=/opt/homebrew/share/nvim/runtime
