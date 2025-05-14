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

alias snmpcheck snmpcheck-nothink
alias snmp-check snmpcheck-nothink
alias pyenv 'source env/bin/activate.fish'
alias cat bat
alias emacs 'emacs -nw'
alias gcl 'git clone (wl-paste)'
alias vencord 'sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias wordlists " clear && echo 'Installing Kali Wordlists' && sudo git clone https://github.com/00xBAD/kali-wordlists.git /usr/share/wordlists && clear && echo 'Installing SecLists' && sudo git clone https://github.com/danielmiessler/SecLists.git /usr/share/wordlists/seclists/ && clear && echo 'Unzipping rockyou.txt' && sudo gunzip /usr/share/wordlists/rockyou.txt.gz && clear && echo 'Wordlists Installed' "

abbr ani-cli "ani-cli --skip"
abbr g git
abbr push "git add . && git commit -m 'idk fr' && git push"
abbr n nvim
abbr cls clear
abbr g git
abbr grep rg
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
abbr copy wl-copy
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
