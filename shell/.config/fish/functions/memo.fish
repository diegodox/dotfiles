function memo
    if not set -q EDITOR
        set -f EDITOR nvim
    end

    if not set -q MEMO_FILE
        set -f MEMO_FILE ~/memo.md
    end

    $EDITOR $MEMO_FILE
end
