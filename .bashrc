#######################################################
#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|
#                                 
# Leela Pakanati 
# This is a living document of my bashrc configuration
#######################################################

################# Bash setup ###########################
PS1="\[\e[36m\]\w\[\e[m\]\[\e[34m\]\\$\[\e[m\] "
shopt -s autocd #give directory to automatically cd into it

#auto start terminals in tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux
fi

export PATH=$PATH:"'python -m site --user-base' /bin"

############ Useful commands ###########################
alias startdocker='systemctl start docker'
alias stopdocker='systemctl stop docker'
alias fxp='xdg-open .'
alias chrome='google-chrome-stable'
alias ka="killall"

function gaytime {
                    watch -ct -n1 "date '+%T' | figlet | toilet -f term --gay"
                    }
alias showtime='tty-clock -csBbtC 6'

##################### Overwrite regular commands #####################
alias apt="sudo apt"
alias please="sudo"
alias pacman="sudo pacman"
#alias python="python3"
#alias pip="pip3"
alias grep="grep --color=auto"
alias ls="ls -hN --color=auto --group-directories-first"
alias ccat="highlight --out-format=ansi"

###################Git commands#######################################
function gpush {
		currbranch=$(git name-rev --name-only HEAD)
		git push origin $currbranch
		}
function gpushf {
                currbranch=$(git name-rev --name-only HEAD)
                git push origin -f $currbranch
                }
alias gco="git checkout"
alias gadd="git add ."
alias gcom="git commit -m"
alias gundo="git reset HEAD~1"
alias gstat="git status"
alias glog="git log"
alias greset1="git reset HEAD~1"
alias gdiff="git diff"
alias gpull="git pull"

################## MEMES ####################################
alias yeet="figlet This Bitch Empty"
alias ah_shit="figlet here we go again"
alias think="jp2a ~/think.jpg --grayscale" 
alias stonks="jp2a ~/stonks.jpg"

##########TMUX and VIM Stuff#################################
export VISUAL=vim
export EDITOR="$VISUAL" 

# useful functions/aliases
alias ll="ls -la"
repeat(){
    while true; do "$@"; done
}

bell() {
    echo "$@"
    "$@"; echo -e "\a"
}

ring() {
    echo -e "\a"
}

alias grep='grep --color=always'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lee/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lee/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lee/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lee/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

