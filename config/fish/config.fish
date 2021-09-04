# Do the brew.
if test -f /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
end

if status is-interactive
  # Commands to run in interactive sessions can go here
end

