function zgem
    set -l gem_name (bundle list --name-only | fzf)
    and zed (bundle info --path $gem_name)
end
