source /arm/pd/setup/bash
module load arm/cluster 
module load swdev 
module load git/git/v2.0.0
module unload python/python/3.4.4
module load python/python/3.6.1
module loat util
module load jonas/tig/2.0.3
module load python/jsonschema_py3.6.1/2.6.0
module load vim/vim/8.1
module load gnu/tmux/3.0
export LANG=en_US.utf8
export LC_ALL=en_US.utf8
export PATH=$PATH:/home/leepak01/Sublime\ Text\ 2
export PATH=$PATH:/home/leepak01/.local/bin
alias subl=sublime_text
alias work="/projects/pd/performance/work/leepak01"
alias BL="bsub -Jdebm-pd-run -qinter -Is -W 360:00 -M 15000000 -PPJ02519A"
alias BS="bsub -Jdebm-pd-run -qinter -Is -W 60:00 -M 150000 -PPJ02519A"
alias Bshell="bsub -Jdebm-pd-run -qinter -Is -M 150000 -PPJ02519A bash"
alias cdwork="cd /projects/pd/performance/work/leepak01/"
alias ebmveconf="-c /projects/pd/performance/work/leepak01/apt/regress/configs/zeus_ebm/ve.cfg"
alias zeus_ebm="cd work/ebm/build/x86_64/opt/bin/zeus_sim"
alias py=python
alias cdarchive="cd /projects/pd/pj03221_cpu_perf/"
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
