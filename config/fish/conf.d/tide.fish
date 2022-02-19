set -U tide_left_prompt_items pwd git newline jobs character
set -U tide_right_prompt_items cmd_duration status context

# Git
set -U tide_git_color_branch magenta
set -U tide_git_color_conflicted brred
set -U tide_git_color_dirty yellow
set -U tide_git_color_operation cyan
set -U tide_git_color_staged green
set -U tide_git_color_stash brblack
set -U tide_git_color_untracked cyan
set -U tide_git_color_upstream blue

# Jobs
set -U tide_jobs_icon "\u001b[32m⋯"

# Status
set -U tide_status_icon_failure "✗"

# Command Duration
set -U tide_cmd_duration_color brblue

# PWD
set -U tide_pwd_color_anchors white
set -U tide_pwd_color_dirs brblack
set -U tide_pwd_color_truncated_dirs yellow

# Character
set -U tide_character_color blue
set -U tide_character_icon "\$"
set -U tide_character_vi_icon_default "N"
set -U tide_character_vi_icon_replace "R"
set -U tide_character_vi_icon_visaul "V"
