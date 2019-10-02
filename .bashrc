#######################################################
# Leela Pakanati 
# Dotfiles: Bashrc
# This is a living document of my bashrc configuration
#######################################################


PS1="\[\e[36m\]\w\[\e[m\]\[\e[34m\]\\$\[\e[m\] "
alias chrome='google-chrome-stable'
alias apt="sudo apt"
alias please="sudo"
alias pacman="sudo pacman"
alias python="python3"
alias pip="pip3"
export PATH=$PATH:"'python -m site --user-base' /bin"

function showtime {
                    watch -ct -n1 "date '+%T' | figlet | toilet -f term --gay"
                    }

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

