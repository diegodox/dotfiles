function lazygit --wraps='lazygit'
    set -x LAZYGIT_ACTIVE
    command lazygit $argv
    set -e LAZYGIT_ACTIVE
end
