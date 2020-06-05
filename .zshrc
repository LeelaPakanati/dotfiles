HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
bindkey -v
zstyle :compinstall filename '/home/lee/.zshrc'

autoload -U colors && colors
PS1="%{$fg[cyan]%}%~%{$fg[blue]%}$%b "

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

############ Useful commands ###########################
alias startdocker='systemctl start docker'
alias stopdocker='systemctl stop docker'
alias fxp='xdg-open .'                      # Open GUI file explorer
alias chrome='google-chrome-stable'
alias ka='killall'
alias ll='ls -al'

whosmans(){
    man -k . | dmenu -l 30 -p 'select man page' -c | awk '{print $1}' | xargs -r man -Tpdf | zathura -
}


gaytime() {
	watch -ct -n1 "date '+%T' | figlet | toilet -f term --gay"
}

alias showtime='tty-clock -csBbtC 6'

# repeat a command over and over
rerun() {
    while true; do "$@"; done
}

# Run command and then ring bell (can run just 'bell' after cmd already running)
bell() {
    echo "$@"
    "$@"; echo -e "\a"
}

# Run command and then ring bell (can run just 'bell' after cmd already running)
notify() {
	if [ $# -eq 0 ];
	then
		fc -W
		notify-send "`tail -n2 ~/.histfile | head -n1` Finished Running"
	else
		echo "$@"
		"$@";
		notify-send "$@ Finished Running"
	fi
}

################### General shortcuts #################################
alias v="vim"
alias vi="vim"
alias r="ranger"

############### Overwrite regular commands w/ options#################555~C~#
alias apt="sudo apt"
alias please="sudo"
#alias python="python3"
#alias pip="pip3"
alias grep="grep --color=auto"
alias ls="ls -hN --color=auto --group-directories-first"
alias sl="ls -hN --color=auto --group-directories-first"
alias ccat="highlight --out-format=ansi"
alias tree="tree -CF"
alias pdflatex="pdflatex -halt-on-error"

################## Git aliases #########################################
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
alias lc="ls | figlet | toilet --gay -f term"
alias llc="ll | figlet | toilet --gay -f term"

##########TMUX and VIM Stuff#################################
export VISUAL=vim
export EDITOR="$VISUAL" 

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


# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
