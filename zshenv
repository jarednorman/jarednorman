# Because I never remember:
# .zshenv is always source, regardless of the type of shell.

# Setup Homebrew environment if it is present on the system.
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

# bun
export BUN_INSTALL="$HOME/.bun"

export path=(
  $HOME/.bin
  $BUN_INSTALL/bin
   $(brew --prefix)/opt/libpq/bin
  $path
)

# There's a weird issue with Puma and some other Ruby things and I don't really
# care to find out what the deal is. This fixes it.
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# No springs.
export DISABLE_SPRING=true

# Make fzf pretty.
export FZF_DEFAULT_OPTS=" -e --color fg:#a6adc8,bg:#1e1e2e,hl:#fab387,fg+:#cdd6f4,bg+:#313244,hl+:#fab387,info:#313244,prompt:#f5e0dc,spinner:#f5e0dc,pointer:#f5e0dc"

# Tell Neovim where it is.
export VIMRUNTIME=/opt/homebrew/share/nvim/runtime
