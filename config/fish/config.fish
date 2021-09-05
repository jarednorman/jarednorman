fish_vi_key_bindings

fish_add_path $HOME/.bin

set -gx CHRUBY_ROOT /opt/homebrew
set -gx EDITOR nvim
set -gx EDITOR vi

function fish_greeting
  # This disables the greeting message.
end

function fish_mode_prompt
  # This disables the default indicator.
end

if status is-interactive
  set -g hydro_symbol_prompt →
end

