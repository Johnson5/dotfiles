# Disable default Fish greeting
set -g fish_greeting ""

# Set starship theme
starship init fish | source

# Use zoxide
zoxide init fish --cmd cd | source

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Call fastfetch to display system info
if status --is-interactive
    and type -q fastfetch
    fastfetch
end

function cpwd --description "Copy current working directory to clipboard"
    set current_path (pwd)
    echo $current_path | wl-copy
    echo "Path copied to clipboard: $current_path"
end
