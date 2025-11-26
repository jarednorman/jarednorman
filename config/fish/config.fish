if status is-interactive
    fzf --fish | source

    function fish_prompt
        # Capture the exit status of each command in the last pipeline
        set -l last_pipestatus $pipestatus

        # Export the last status for use by __fish_print_pipestatus helper
        set -lx __fish_last_status $status

        # Store the normal/reset color escape sequence for later use
        set -l normal (set_color normal)

        # Set default status color to red if not already configured
        set -q fish_color_status
        or set -g fish_color_status red

        # Current working directory color is always magenta
        set -l color_cwd magenta

        # Default prompt suffix (arrow) and color for normal user (blue)
        set -l suffix ' ->'
        set -l color_suffix blue

        # Check if we're running as root user
        if functions -q fish_is_root_user; and fish_is_root_user
            # Use red arrow and different symbol for root to indicate elevated privileges
            set color_suffix red
            set suffix ' =>'
        end

        # Write pipestatus

        # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
        # Start with bold flag enabled for fresh command status
        set -l bold_flag --bold

        # Initialize status generation tracker if not set (tracks whether a new command was run)
        set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation

        # If status_generation hasn't changed, no new command was run, so don't bold
        if test $__fish_prompt_status_generation = $status_generation
            set bold_flag
        end

        # Update generation tracker for next prompt
        set __fish_prompt_status_generation $status_generation

        # Get color for status display (non-bold)
        set -l status_color (set_color $fish_color_status)

        # Get color for status display (potentially bold, based on whether command was run)
        set -l statusb_color (set_color $bold_flag $fish_color_status)

        # Format the pipestatus output with brackets and pipe separators
        set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

        # Assemble and print the prompt: colored cwd, git status, exit status, colored suffix
        echo -n -s (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status (set_color $color_suffix) $suffix $normal " "
    end
end
