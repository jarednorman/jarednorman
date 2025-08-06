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

# Catppuccin Mocha: fish syntax/pager colours
# https://github.com/catppuccin/fish
if status is-interactive
    set -g fish_color_normal cdd6f4
    set -g fish_color_command 89b4fa
    set -g fish_color_keyword f38ba8
    set -g fish_color_quote a6e3a1
    set -g fish_color_redirection f5c2e7
    set -g fish_color_end fab387
    set -g fish_color_error f38ba8
    set -g fish_color_param f2cdcd
    set -g fish_color_comment 7f849c
    set -g fish_color_selection --background=313244
    set -g fish_color_operator f5c2e7
    set -g fish_color_escape eba0ac
    set -g fish_color_autosuggestion 6c7086
    set -g fish_color_cancel f38ba8
    set -g fish_color_search_match --background=313244
    set -g fish_pager_color_progress 6c7086
    set -g fish_pager_color_prefix f5c2e7
    set -g fish_pager_color_completion cdd6f4
    set -g fish_pager_color_description 6c7086
    set -g fish_pager_color_selected_background --background=45475a
    set -g fish_pager_color_selected_prefix f5c2e7
    set -g fish_pager_color_selected_completion cdd6f4
    set -g fish_pager_color_selected_description cdd6f4
end

# fzf colors: Catppuccin Mocha
# https://github.com/catppuccin/fzf
set -gx FZF_DEFAULT_OPTS "\
--color=fg:#cdd6f4,bg:#1e1e2e,hl:#f38ba8 \
--color=fg+:#cdd6f4,bg+:#313244,hl+:#f38ba8 \
--color=border:#6c7086,header:#f38ba8,gutter:#1e1e2e \
--color=spinner:#f5e0dc,info:#cba6f7 \
--color=pointer:#f5e0dc,marker:#b4befe,prompt:#cba6f7 \
--color=selected-bg:#45475a,label:#cdd6f4"

# Claude Code clamps to 256 colors inside tmux unless this is set
# https://github.com/anthropics/claude-code/issues/60788
set -gx CLAUDE_CODE_TMUX_TRUECOLOR 1


# opam
test -r '/Users/jardo/.opam/opam-init/init.fish' && source '/Users/jardo/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true

# Podman API socket for Docker-compatible clients (docker-compose, DevPod)
set -gx DOCKER_HOST unix:///run/user/1000/podman/podman.sock
