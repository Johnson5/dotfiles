set -g fish_greeting

function fish_greeting
    set_color blue
    echo "System Information:"
    set_color normal

    # Hostname and User
    set_color cyan
    printf "\uf007"
    printf "%-20s" " User:"
    echo (set_color white)(whoami)@(hostname)

    set_color cyan
    printf "\ue7d9"
    # Operating System (using lsb_release if available, otherwise uname)
    if type -q lsb_release
        printf "%-20s" " OS:"
        echo (set_color white)(lsb_release -ds)
    else
        printf "%-20s" " Kernel:"
        echo (set_color white)(uname -sr)
    end

    set_color cyan
    # Uptime
    printf "\UF051F"
    printf "%-20s" " Uptime:"
    echo (set_color white)(uptime -p | sed 's/up //')

    set_color cyan
    # IP Address (for eth0, IPv4 - adjust interface if needed, e.g., wlan0)
    # This command tries to get the IPv4 address for the 'eth0' interface.
    # If 'eth0' is not present or you're on Wi-Fi, you might need to change 'eth0'
    # to your primary network interface (e.g., 'wlan0', 'enpXsY').
    printf "\UF0C9D"
    printf "%-20s" " IP Address:"
    set ip_address (ip -4 addr show (ip route | grep default | awk '{print $5}' | head -n 1) | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1)
    if test -n "$ip_address"
        echo (set_color white)$ip_address
    else
        echo (set_color red)"Not found (check interface)"
    end

    set_color cyan
    # Disk Usage for Root Partition
    printf "\UF02CA"
    printf "%-20s" " Disk Usage (/):"
    echo (set_color white)(df -h / | tail -n 1 | awk '{print $5 " used of " $2}')

    set_color cyan
    # Memory Usage
    printf "\UF035B"
    printf "%-20s" " Memory:"
    echo (set_color white)(free -h | awk '/Mem:/ {print $3 " used of " $2}')
    set_color normal # Reset color to default
end

starship init fish | source
