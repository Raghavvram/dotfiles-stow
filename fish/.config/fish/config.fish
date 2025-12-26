# Set a custom greeting message for new shells
set -g fish_greeting

# Initialize starship prompt if the shell is interactive
if status is-interactive
    starship init fish | source
end

# Aliases for listing directories with eza (a modern replacement for ls)
alias l='eza -lh  --icons=auto' # long list with icons
alias ls='eza -1   --icons=auto' # single column list with icons
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all with sorting and grouping
alias ld='eza -lhD --icons=auto' # long list directories only with icons
alias lt='eza --icons=auto --tree' # list directory tree with icons

# Handy change directory shortcuts with abbreviations
abbr .. 'cd ..' # go up one directory
abbr ... 'cd ../..' # go up two directories
abbr .3 'cd ../../..' # go up three directories
abbr .4 'cd ../../../..' # go up four directories
abbr .5 'cd ../../../../..' # go up five directories

# Always create the full path when using mkdir
abbr mkdir 'mkdir -p' # -p flag ensures that parent directories are created as needed

# Ensure tmux uses UTF-8 mode
abbr tmux 'tmux -u'

# Custom keybindings
# Ctrl+t: Create a new tmux session
bind \ct 'tmux new-session -A -s main'

# Ctrl+s: Save and close the current file (for use with nano or other editors)
bind \cs 'commandline -f save-buffer; commandline -f kill-line; commandline -f accept-autosuggestion'

# Ctrl+q: Quit the terminal
bind \cq 'exit'

# Ctrl+r: Reverse search through command history
bind \cr 'history search'

# Ctrl+l: Clear the screen
bind \cl 'clear'

# Ctrl+p: Open fzf (fuzzy finder) for quick file search
bind \cp 'fzf'

# Define custom functions
function extract
    set -l file $argv[1]
    switch (string match -r '\.([^.]+)$' $file)
        case "tar.gz" "tgz"
            tar xzf $file
        case "tar.bz2" "tbz"
            tar xjf $file
        case "tar.xz" "txz"
            tar xJf $file
        case "tar"
            tar xf $file
        case "gz"
            gunzip $file
        case "bz2"
            bunzip2 $file
        case "xz"
            unxz $file
        case "zip"
            unzip $file
        case "rar"
            unrar x $file
        case "*"
            echo "Unknown file extension: $file"
    end
end

#############################################################################

# Custom Keybindings:
# Ctrl+t: Create a new tmux session.
# Ctrl+s: Save and close the current file (useful for text editors like nano).
# Ctrl+q: Quit the terminal.
# Ctrl+r: Reverse search through command history.
# Ctrl+l: Clear the screen.
# Ctrl+p: Open fzf (fuzzy finder) for quick file search.

# Custom Functions:
# extract function: Automatically extract files based on their extensions (supports tar.gz, tgz, tar.bz2, tbz, tar.xz, txz, tar, gz, bz2, xz, zip, rar, and others).


alias update='sudo nala update && sudo nala full-upgrade -y'
alias install='sudo nala install'
alias purge='sudo nala purge'

# abbr
abbr ls 'lsd -a'
abbr cp 'cp -r'

export PATH="$PATH:~/projects/OpenSK/elf2tab/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f ~/miniconda3/bin/conda
    eval ~/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "~/miniconda3/etc/fish/conf.d/conda.fish"
        . "~/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "~/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

fastfetch



