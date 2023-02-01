function tmuxpopup --description "toggle tmux popup window"
    set --function width '80%'
    set --function height '80%'
    set --function session (tmux display-message -p -F "#{session_name}")
    if contains popup $session
        tmux detach-client
    else
        tmux popup -d '#{pane_current_path}' -w$width -h$height \
            -E "tmux attach -t popup || tmux new -s popup $argv"
    end
end
