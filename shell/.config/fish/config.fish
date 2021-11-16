if status is-interactive

    # aliaces
    if command -v exa >/dev/null
        abbr -a ls 'exa --header --icons --git'
        abbr -a ll 'exa --header --icons --git --long'
        abbr -a la 'exa --header --icons --git --all'
        abbr -a lla 'exa --header --icons --git --long --all'
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

    if test "$NVIM_LISTEN_ADDRESS"
        alias nvim="nvr -cc split --remote-wait +'set bufhidden=wipe'"
        set -x VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
        set -x EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    end
    if command -v nvim >/dev/null
        abbr -a vim nvim
        abbr -a v nvim
    end

    set -x EDITOR nvim
end

set PATH ~/.cargo/bin $PATH
