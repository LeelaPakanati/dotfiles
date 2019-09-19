alias apt="sudo apt"
alias python="python3"
alias pip="pip3"
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
alias ut="python -m unittest -v"
alias gdiff="git diff"
alias gpull="git pull"
alias please="sudo"
alias yeet="echo 'This Bitch Empty'"
alias ah_shit="echo 'here we go again'"
alias think="jp2a ~/think.jpg --grayscale" 
alias stonks="jp2a ~/stonks.jpg"

export PATH=$PATH:"'python -m site --user-base' /bin"
#############f#rom devin#####################################################
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

PS1="\[\e[36m\]\w\[\e[m\]\[\e[34m\]\\$\[\e[m\] "
