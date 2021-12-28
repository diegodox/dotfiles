function fish_prompt
    set exit_status $status

    if test "$exit_status" -eq 0
        set exit_status_color green
    else
        set exit_status_color red
    end

    set usr_bg_color blue
    set usr_tx_color brwhite

    set pwd_bg_color yellow
    set pwd_tx_color red

    set git_tx_color brblack

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

    set_color $git_tx_color
    echo -ns (__fish_git_prompt)

    set_color red
    echo -n '|'
    set_color normal
end
