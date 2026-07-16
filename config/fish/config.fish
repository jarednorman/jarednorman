if status is-interactive
    fzf --fish | source
end

# Claude Code clamps to 256 colors inside tmux unless this is set
# https://github.com/anthropics/claude-code/issues/60788
set -gx CLAUDE_CODE_TMUX_TRUECOLOR 1


# opam
test -r '/Users/jardo/.opam/opam-init/init.fish' && source '/Users/jardo/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
