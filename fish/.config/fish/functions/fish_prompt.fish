function fish_prompt
    set -f exit_status $status

    # -----------------------------
    # define color
    # -----------------------------
    if test "$exit_status" -eq 0
        set -f exit_status_color green
    else
        set -f exit_status_color red
    end

    set -f usr_bg_color blue
    set -f usr_tx_color brwhite

    set -f pwd_bg_color yellow
    set -f pwd_tx_color red

    set -f git_tx_color brblack

    # -----------------------------
    # configure git prompt
    # -----------------------------
    set -g __fish_git_prompt_char_upstream_ahead ""
    set -g __fish_git_prompt_char_upstream_behind ""
    set -g __fish_git_prompt_char_upstream_prefix ""

    set -g __fish_git_prompt_char_stagedstate "●"
    set -g __fish_git_prompt_char_dirtystate "✚"
    set -g __fish_git_prompt_char_untrackedfiles "…"
    set -g __fish_git_prompt_char_conflictedstate "✖"
    set -g __fish_git_prompt_char_cleanstate "✔"

    set -g __fish_git_prompt_color_dirtystate blue
    set -g __fish_git_prompt_color_stagedstate yellow
    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal

    # -----------------------------
    # draw prompt
    # -----------------------------
    set_color brblack
    echo -n "["(date "+%H:%M")"]"

    set_color normal
    set_color $exit_status_color
    echo -ne \uE0B6

    set_color -b $exit_status_color
    set_color brwhite
    echo -ns $exit_status

    set_color $exit_status_color
    set_color -b $usr_bg_color
    echo -ne \uE0B4

    set_color $usr_tx_color
    echo -ns (whoami)
    if [ -n "$SSH_CLIENT" ]
        echo -ns "@" (prompt_hostname)
    end

    set_color $usr_bg_color
    set_color -b $pwd_bg_color
    echo -ne \uE0B4

    set_color $pwd_tx_color
    set_color -b $pwd_bg_color
    echo -ns (prompt_pwd)

    set_color normal
    set_color $pwd_bg_color
    echo -ne \uE0B4

    set_color brblack
    if test -n "$IN_NIX_SHELL"
        if test -z "$NERDFONT"
            echo -n " (nix)"
        else
            set_color blue
            echo -n " "
            set_color brblack
        end
    end
    if test -n "$VIRTUAL_ENV"
        if test -z "$NERDFONT"
            echo -n " (venv)"
        else
            set_color yellow
            echo -n " "
            set_color brblack
        end
    end

    set_color $git_tx_color
    echo -ns (__fish_git_prompt)

    set_color red
    echo -n '|'
    set_color normal
end
