if status is-interactive

    # aliaces
    if command -v exa >/dev/null
        abbr -a ls 'exa --icons'
        abbr -a ll 'exa --icons --header --git --long'
        abbr -a la 'exa --icons --all'
        abbr -a lla 'exa --icons --header --git --long --all'
    else
        abbr -a ll 'ls -l'
        abbr -a la 'ls -a'
        abbr -a lla 'ls -la'
    end
    if command -v ranger >/dev/null
        abbr -a r ranger
    end
    if command -v lazygit >/dev/null
        abbr -a lg lazygit
    end
    if command -v bat >/dev/null
        abbr -a cat bat
    end

    if test -n "$NVIM_LISTEN_ADDRESS" -a -n "$LAZYGIT_ACTIVE"
        alias nvim "nvr -cc split --remote-wait +'set bufhidden=wipe'"
        set -x VISUAL "nvr -cc split --remote-wait +'set bufhidden=wipe'"
        set -x EDITOR "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    else
        set -x VISUAL nvim
        set -x EDITOR nvim
    end

    if command -v nvim >/dev/null
        abbr -a vim nvim
        abbr -a v nvim
    end

    if command -v direnv >/dev/null
        direnv hook fish | source
    end

end

set PATH ~/.cargo/bin $PATH
