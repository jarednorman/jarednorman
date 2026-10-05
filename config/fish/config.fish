# Homebrew's mise auto-activates via vendor_conf.d; other installs don't
if not functions -q __mise_env_eval
    if status is-interactive
        mise activate fish | source
    else
        mise activate fish --shims | source
    end
end

if status is-interactive
    fzf --fish | source
end

# Rosé Pine Dawn: fish syntax/pager colours
# https://github.com/rose-pine/fish
if status is-interactive
    set -g fish_color_normal 575279
    set -g fish_color_command 907aa9
    set -g fish_color_keyword 56949f
    set -g fish_color_quote ea9d34
    set -g fish_color_redirection 286983
    set -g fish_color_end 797593
    set -g fish_color_error b4637a
    set -g fish_color_param d7827e
    set -g fish_color_comment 797593
    set -g fish_color_selection --reverse
    set -g fish_color_operator 575279
    set -g fish_color_escape 286983
    set -g fish_color_autosuggestion 797593
    set -g fish_color_cancel 575279
    set -g fish_color_search_match --background=f2e9e1
    set -g fish_pager_color_progress d7827e
    set -g fish_pager_color_prefix 56949f
    set -g fish_pager_color_completion 797593
    set -g fish_pager_color_description 797593
    set -g fish_pager_color_selected_background --background=f2e9e1
    set -g fish_pager_color_selected_prefix 56949f
    set -g fish_pager_color_selected_completion 575279
    set -g fish_pager_color_selected_description 575279
end

# fzf colors: Rosé Pine Dawn
set -gx FZF_DEFAULT_OPTS "\
--color=fg:#797593,bg:#faf4ed,hl:#d7827e \
--color=fg+:#575279,bg+:#f2e9e1,hl+:#d7827e \
--color=border:#dfdad9,header:#286983,gutter:#faf4ed \
--color=spinner:#ea9d34,info:#56949f \
--color=pointer:#907aa9,marker:#b4637a,prompt:#797593"

# Claude Code clamps to 256 colors inside tmux unless this is set
# https://github.com/anthropics/claude-code/issues/60788
set -gx CLAUDE_CODE_TMUX_TRUECOLOR 1


# opam
test -r '/Users/jardo/.opam/opam-init/init.fish' && source '/Users/jardo/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
