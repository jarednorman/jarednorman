# Desktop: give the claude pane a fixed width, rest goes to the other pane.
function resize_claude_pane
    set -q TMUX_PANE; or return 0
    tmux resize-pane -t $TMUX_PANE -x 142
end
