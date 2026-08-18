if status is-interactive
    fzf --fish | source
end

# fzf colors: Gruvbox Material light soft
set -gx FZF_DEFAULT_OPTS "\
--color=fg:#7c6f64,bg:#f2e5bc,hl:#b47109 \
--color=fg+:#654735,bg+:#ebdbb2,hl+:#b47109 \
--color=border:#d5c4a1,header:#45707a,gutter:#f2e5bc \
--color=spinner:#b47109,info:#4c7a5d \
--color=pointer:#945e80,marker:#c14a4a,prompt:#7c6f64"

# Claude Code clamps to 256 colors inside tmux unless this is set
# https://github.com/anthropics/claude-code/issues/60788
set -gx CLAUDE_CODE_TMUX_TRUECOLOR 1


# opam
test -r '/Users/jardo/.opam/opam-init/init.fish' && source '/Users/jardo/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
