if status is-interactive
    fzf --fish | source
end

# fzf colors: Gruvbox Material dark medium
set -gx FZF_DEFAULT_OPTS "\
--color=fg:#a89984,bg:#282828,hl:#d8a657 \
--color=fg+:#d4be98,bg+:#32302f,hl+:#d8a657 \
--color=border:#45403d,header:#7daea3,gutter:#282828 \
--color=spinner:#d8a657,info:#89b482 \
--color=pointer:#d3869b,marker:#ea6962,prompt:#a89984"

# Claude Code clamps to 256 colors inside tmux unless this is set
# https://github.com/anthropics/claude-code/issues/60788
set -gx CLAUDE_CODE_TMUX_TRUECOLOR 1


# opam
test -r '/Users/jardo/.opam/opam-init/init.fish' && source '/Users/jardo/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
