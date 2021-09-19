if status is-interactive
    if command -v exa > /dev/null
        alias ls='exa --header --icons --git'
    end
    #abbr -a ll 'ls -l'
    #abbr -a la 'ls -a'
    #abbr -a lla 'ls -la'
    if command -v bat > /dev/null
        alias cat='bat'
    end
    if command -v fd > /dev/null
        alias find='fd'
    end
    if command -v nvim > /dev/null
        alias vim='nvim'
    end
end

set PATH ~/.cargo/bin $PATH
