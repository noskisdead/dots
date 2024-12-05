# Display a random pokemon when fish is started
function fish_greeting
    enable_transience
    fish_vi_key_bindings
    pokemon-colorscripts -r --no-title
end

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
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

# TheFuck Config
function fuck -d "Correct your previous console command"
    set -l fucked_up_command $history[1]
    env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
    if [ "$unfucked_command" != "" ]
        eval $unfucked_command
        builtin history delete --exact --case-sensitive -- $fucked_up_command
        builtin history merge
    end
end
