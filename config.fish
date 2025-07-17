# Disable defailt Fish greeting
set -g fish_greeting ""

# Set starship theme
starship init fish | source

# Call fastfetch to display system info
if status --is-interactive
    and type -q fastfetch
    fastfetch
end
