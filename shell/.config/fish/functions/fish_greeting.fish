function fish_greeting
    if test -z $NVIM
        set -q MEMO_FILE || set -f MEMO_FILE ~/memo.md
        if test -e $MEMO_FILE
            bat -P $MEMO_FILE 2>/dev/null
        end
    end
end
