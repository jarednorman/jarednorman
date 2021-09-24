fish_vi_key_bindings

fish_add_path $HOME/.bin

set -gx CHRUBY_ROOT /opt/homebrew
set -gx EDITOR nvim

set --erase fish_greeting

function f
  ag --nocolor -l -g $argv
end

function fish_mode_prompt
  # This disables the default indicator.
end

function tgem
  set GEM_NAME (bundle list --name-only | fzf)
  tmux new-window -c (bundle info --path $GEM_NAME) -n $GEM_NAME
end

if status is-interactive
  set -g pure_show_jobs true
end

