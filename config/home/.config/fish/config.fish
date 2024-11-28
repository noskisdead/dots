# Funtion Definitions
function fish_greeting
    pokemon-colorscripts -r 1-7 --no-title
end

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias grep rg
alias cat bat
alias emacs 'emacs -nw'
alias vim nvim
abbr mkdir 'mkdir -p'
abbr sl ls
abbr pdw pwd
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

abbr mkdir 'mkdir -p'
abbr mv 'mv -i'
abbr shred 'shred -vzu -n5'
abbr wipe 'wipe -r'
abbr htop btop
abbr top btop

abbr n nvim
abbr ranger yazi
abbr ssh 'kitten ssh'

# Initialize Starship Prompt if Interactive
if status is-interactive
    starship init fish | source
end
