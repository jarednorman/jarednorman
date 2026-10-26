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

# Gruvbox Material dark hard: fish syntax/pager colours, mapped from the
# colorscheme's group assignments (Function/String green, Keyword red, ...)
# https://github.com/sainnhe/gruvbox-material
if status is-interactive
    set -g fish_color_normal d4be98
    set -g fish_color_command a9b665
    set -g fish_color_keyword ea6962
    set -g fish_color_quote a9b665
    set -g fish_color_redirection e78a4e
    set -g fish_color_end d4be98
    set -g fish_color_error ea6962
    set -g fish_color_param 7daea3
    set -g fish_color_comment 928374
    set -g fish_color_selection --background=3c3836
    set -g fish_color_operator e78a4e
    set -g fish_color_escape d8a657
    set -g fish_color_autosuggestion 7c6f64
    set -g fish_color_cancel ea6962
    set -g fish_color_search_match --background=3c3836
    set -g fish_pager_color_progress 928374
    set -g fish_pager_color_prefix d8a657
    set -g fish_pager_color_completion d4be98
    set -g fish_pager_color_description 928374
    set -g fish_pager_color_selected_background --background=504945
    set -g fish_pager_color_selected_prefix d8a657
    set -g fish_pager_color_selected_completion ddc7a1
    set -g fish_pager_color_selected_description d4be98
end

# fzf colors: Gruvbox Material dark hard
set -gx FZF_DEFAULT_OPTS "\
--color=fg:#a89984,bg:#1d2021,hl:#d8a657 \
--color=fg+:#d4be98,bg+:#282828,hl+:#d8a657 \
--color=border:#3c3836,header:#7daea3,gutter:#1d2021 \
--color=spinner:#d8a657,info:#89b482 \
--color=pointer:#d3869b,marker:#ea6962,prompt:#a89984 \
--color=selected-bg:#3c3836,label:#d4be98"

# Claude Code clamps to 256 colors inside tmux unless this is set
# https://github.com/anthropics/claude-code/issues/60788
set -gx CLAUDE_CODE_TMUX_TRUECOLOR 1


# opam
test -r '/Users/jardo/.opam/opam-init/init.fish' && source '/Users/jardo/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true

# Podman API socket for Docker-compatible clients (docker-compose, DevPod)
set -gx DOCKER_HOST unix:///run/user/1000/podman/podman.sock
