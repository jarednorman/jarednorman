fish_vi_key_bindings

# Do the brew.
if test -f /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
end

set -gx CHRUBY_ROOT /opt/homebrew
set -gx EDITOR nvim
set -gx EDITOR vi

if status is-interactive
  # Commands to run in interactive sessions can go here
end

