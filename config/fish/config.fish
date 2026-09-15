if status is-interactive
    fzf --fish | source
end

# fzf colors: Nightfox
set -gx FZF_DEFAULT_OPTS "\
--color=fg:#aeafb0,bg:#192330,hl:#dbc074 \
--color=fg+:#cdcecf,bg+:#212e3f,hl+:#dbc074 \
--color=border:#29394f,header:#719cd6,gutter:#192330 \
--color=spinner:#dbc074,info:#63cdcf \
--color=pointer:#d67ad2,marker:#c94f6d,prompt:#aeafb0"

# Claude Code clamps to 256 colors inside tmux unless this is set
# https://github.com/anthropics/claude-code/issues/60788
set -gx CLAUDE_CODE_TMUX_TRUECOLOR 1


# opam
test -r '/Users/jardo/.opam/opam-init/init.fish' && source '/Users/jardo/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
