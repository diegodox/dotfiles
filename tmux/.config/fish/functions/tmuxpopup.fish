function tmuxpopup --description "toggle tmux popup window"
    set --function width '80%'
    set --function height '80%'
    set --function current_session (tmux display-message -p -F "#{session_name}")
    set --function main_session (echo $current_session | sed 's/^popup_//')
    set --function popup_session "popup_"$main_session
    if contains $current_session $popup_session
        tmux detach-client
    else
        tmux popup -d '#{pane_current_path}' -w$width -h$height \
            -E "tmux attach -t $popup_session || tmux new -s $popup_session $argv"
    end
end
