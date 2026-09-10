source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting

# aliases
alias vi=nvim

# anaconda
source ~/anaconda3/etc/fish/conf.d/conda.fish

zoxide init fish | source
starship init fish | source
set -gx EDITOR nvim
set -gx EDITOR nvim
set -gx VISUAL nvim

# opencode
fish_add_path /home/sakthi/.opencode/bin

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
