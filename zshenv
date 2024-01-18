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
export FZF_DEFAULT_OPTS=" -e --no-bold --color fg:#d4be98,bg:#1d2021,hl:2,fg+:#d4be98,bg+:#32361a,hl+:2,info:#504945,prompt:#e78a4e,spinner:#7daea3,pointer:#d4be98"

# Tell Neovim where it is.
export VIMRUNTIME=/opt/homebrew/share/nvim/runtime
