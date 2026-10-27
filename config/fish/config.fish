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

# Catppuccin Latte: fish syntax/pager colours
# https://github.com/catppuccin/fish
if status is-interactive
    set -g fish_color_normal 4c4f69
    set -g fish_color_command 1e66f5
    set -g fish_color_keyword d20f39
    set -g fish_color_quote 40a02b
    set -g fish_color_redirection ea76cb
    set -g fish_color_end fe640b
    set -g fish_color_error d20f39
    set -g fish_color_param dd7878
    set -g fish_color_comment 8c8fa1
    set -g fish_color_selection --background=ccd0da
    set -g fish_color_operator ea76cb
    set -g fish_color_escape e64553
    set -g fish_color_autosuggestion 9ca0b0
    set -g fish_color_cancel d20f39
    set -g fish_color_search_match --background=ccd0da
    set -g fish_pager_color_progress 9ca0b0
    set -g fish_pager_color_prefix ea76cb
    set -g fish_pager_color_completion 4c4f69
    set -g fish_pager_color_description 9ca0b0
    set -g fish_pager_color_selected_background --background=bcc0cc
    set -g fish_pager_color_selected_prefix ea76cb
    set -g fish_pager_color_selected_completion 4c4f69
    set -g fish_pager_color_selected_description 4c4f69
end

# fzf colors: Catppuccin Latte
# https://github.com/catppuccin/fzf
set -gx FZF_DEFAULT_OPTS "\
--color=fg:#4c4f69,bg:#eff1f5,hl:#d20f39 \
--color=fg+:#4c4f69,bg+:#ccd0da,hl+:#d20f39 \
--color=border:#9ca0b0,header:#d20f39,gutter:#eff1f5 \
--color=spinner:#dc8a78,info:#8839ef \
--color=pointer:#dc8a78,marker:#7287fd,prompt:#8839ef \
--color=selected-bg:#bcc0cc,label:#4c4f69"

# Claude Code clamps to 256 colors inside tmux unless this is set
# https://github.com/anthropics/claude-code/issues/60788
set -gx CLAUDE_CODE_TMUX_TRUECOLOR 1


# opam
test -r '/Users/jardo/.opam/opam-init/init.fish' && source '/Users/jardo/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true

# Podman API socket for Docker-compatible clients (docker-compose, DevPod)
set -gx DOCKER_HOST unix:///run/user/1000/podman/podman.sock
