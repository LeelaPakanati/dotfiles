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
alias jp2a='~/jp2a/src/jp2a'
alias think="jp2a ~/think.jpg --grayscale" 
alias stonks="jp2a ~/stonks.jpg"
##############from devin#####################################################

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
################################################################################



###################### Git Prompt #############################################################
## we pass 2 parameters to __git_ps1 as pre and post which are strings.
export PROMPT_COMMAND='__git_ps1 "\[\e[36m\]\w\[\e[m\]" "\\\$ "'
#
## if .git-prompt.sh exists, set options and execute it
if [ -f ~/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  . ~/.git-prompt.sh
fi
