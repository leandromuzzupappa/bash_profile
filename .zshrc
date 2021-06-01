HOST_NAME=leandromuzzupappa

emojis=("🌵" "🛌" "🌎" "🍄" "👾")
EMOJI=${emojis[$RANDOM % ${#emojis[@]}]}

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

export PATH=$PATH:$HOME/bin

export HISTSIZE=5000
export HISTFILESIZE=10000

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold green
bldpur='\e[1;35m' # Bold purple
txtrst='\e[0m'    # Text reset

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir"
}

PROMPT_COMMAND=print_before_the_prompt

PS1="$EMOJI >"
precmd() { eval "$PROMPT_COMMAND" }

## Aliases
alias o="open ."
alias cls="clear"
alias ll="ls -al"

alias gs='git status'
alias gss='git status -s'
alias gaa='git add .'
alias gcm='git commit -m'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gcd='git checkout -d'
alias gd='git diff'
alias gl='git log'
alias gpll='git pull'
alias gpsh='git push'
gpshb() { git push origin $(__git_ps1 | sed -r 's/[()]+//g'); }