# Disable default Fish greeting
set -g fish_greeting ""

set -x JAVA_HOME "/Users/jan.lobee/Applications/Android Studio.app/Contents/jbr/Contents/Home"

# Set starship theme
starship init fish | source

# Use zoxide
zoxide init fish --cmd cd | source

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
