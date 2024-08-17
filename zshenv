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
export FZF_DEFAULT_OPTS="
  --color=fg:#665c54,bg:#1d2021,hl:#d79921
  --color=fg+:#ebdbb2,bg+:#504945,hl+:#fabd2f
  --color=border:#ff00ff,header:#ff00ff,gutter:#504945
  --color=spinner:#689d6a,info:#8ec07c,separator:#3c3836
  --color=pointer:#fabd2f,marker:#ff00ff,prompt:#83a598"

# Tell Neovim where it is.
export VIMRUNTIME=/opt/homebrew/share/nvim/runtime
