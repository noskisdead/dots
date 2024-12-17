# Display a random pokemon when fish is started
function fish_greeting
    enable_transience
    fish_hybrid_key_bindings
    pokemon-colorscripts -r --no-title
end

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

alias vencord 'sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias pyenv 'source env/bin/activate.fish'
alias grep rg
alias cat bat
alias emacs 'emacs -nw'
abbr vim nvim
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

abbr v nvim
abbr n nvim
abbr ranger yazi
abbr ssh 'kitten ssh'

# Initialize Starship Prompt if Interactive
if status is-interactive
    starship init fish | source
end

# Initialize Zoxide
zoxide init fish --cmd cd | source
