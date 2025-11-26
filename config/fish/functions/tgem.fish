function tgem
    set -l gem_name (bundle list --name-only | fzf)
    and tmux new-window -c (bundle info --path $gem_name) -n $gem_name
end
