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
