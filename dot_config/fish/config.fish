source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth

zoxide init fish | source
starship init fish | source
set -gx EDITOR nvim
set -gx EDITOR nvim
set -gx VISUAL nvim

# opencode
fish_add_path /home/sakthi/.opencode/bin
