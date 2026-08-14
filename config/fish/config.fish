if status is-interactive
    fzf --fish | source
end

# fzf colors: Edge light
set -gx FZF_DEFAULT_OPTS "\
--color=fg:#8790a0,bg:#fafafa,hl:#be7e05 \
--color=fg+:#4b505b,bg+:#eef1f4,hl+:#be7e05 \
--color=border:#dde2e7,header:#5079be,gutter:#fafafa \
--color=spinner:#be7e05,info:#3a8b84 \
--color=pointer:#b05ccc,marker:#d05858,prompt:#8790a0"

# Claude Code clamps to 256 colors inside tmux unless this is set
# https://github.com/anthropics/claude-code/issues/60788
set -gx CLAUDE_CODE_TMUX_TRUECOLOR 1


# opam
test -r '/Users/jardo/.opam/opam-init/init.fish' && source '/Users/jardo/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
