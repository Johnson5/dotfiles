# Disable defailt Fish greeting
set -g fish_greeting ""

# Set starship theme
starship init fish | source

# Use zoxide
zoxide init fish --cmd cd | source

# Use fzf
fzf --fish | source

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
