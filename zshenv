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
export FZF_DEFAULT_OPTS=" -e --no-bold --color fg:#654735,bg:#f2e5bc,hl:2,fg+:#654735,bg+:#ebdbb2,hl+:2,info:#dac9a5,prompt:#c35e0a,spinner:#45707a,pointer:#654735"

# Tell Neovim where it is.
export VIMRUNTIME=/opt/homebrew/share/nvim/runtime
