source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting

# aliases
alias vi=nvim

# Initialize Conda and activate its base environment on startup.
if test -x "$HOME/miniconda3/bin/conda"
    "$HOME/miniconda3/bin/conda" shell.fish hook | source
    if not set -q CONDA_PREFIX
        conda activate base
    end
end

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

chezmoi update --no-tty --force
