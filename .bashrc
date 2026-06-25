# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
  # Remove /usr/local/bin added to front of path by /etc/profile.d/custom-path.sh
  export PATH=$(echo $PATH | sed s_/usr/local/bin:__)
fi

# if [ "$HOSTNAME" = "ssds-rt-js-148" ]; then
#   REPO_DIR=/ssds/workarea/dgreenbaum/cp5-repos
# fi

if [ -e /ssds/home/ssds/.bashrc_shared ]; then
  source /ssds/home/ssds/.bashrc_shared
fi

umask 022

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias cdtar="cd /ssds/images/$(echo $(whoami) | cut -d "\\" -f 2)/tarpit"
# alias git="/usr/bin/git"
if alias git >/dev/null 2>&1; then
  unalias git
fi
alias cdddg="cd $REPO_DIR/ssds-data-dictionary-generator"
alias cddr="cd $REPO_DIR/ssds-data-recording"
alias cdrepo="cd $REPO_DIR"
alias cdtar="cd /ssds/images/$username/tarpit"
alias cdusrc="cd $REPO_DIR/ssds-u_src"
alias env-conda="bash --rcfile ~/.bashrc-anaconda"
alias gl="git log --oneline --graph"
alias gnat="gnatstudio &"
alias gs="git status"
alias ll="ls -ltrh --color=auto"
alias postman="/sw/ssds/PostmanApp/Postman/app/Postman"
# alias runtime='echo start $(date) >> ~/runtime8.log; ssh -X -o ServerAliveInterval=60 dgreenbaum@asrcfh.local@ssds-rt-r8-1; echo end $(date) >> ~/runtime8.log'
alias runtime='ssh -X -o ServerAliveInterval=60 dgreenbaum@asrcfh.local@ssds-rt-r8-1'
alias runtime7="ssh -X ssds-rt-js-148"
alias venv="bash --rcfile ~/.bashrc-gcc-4.9.2"

# Source additional local aliases
if [ -f $HOME/.bash_aliases ]; then
  . $HOME/.bash_aliases
fi

# Custom terminal prompt colors
if [[ -v REPO_DIR ]]; then
  REPO_DIR_BASENAME=$(basename $REPO_DIR)
else
  REPO_DIR_BASENAME="NO REPO"
fi

SCREEN_NUMBER=$(echo $DISPLAY | cut -d: -f2 | cut -d. -s -f2)
if [[ -z "$SCREEN_NUMBER" ]]; then
  export DISPLAY=${DISPLAY}.0
fi

PS1="\[\e[34m\][\[\A \e[32m\]$(echo $(whoami) | cut -d "\\" -f 2)\[\e(B\e[m\]@\[\e[36m\]\h \[\e[33m\]$REPO_DIR_BASENAME \W\[\e[34m\]]\[\e[32m\]$\[\e(B\e[m\] "

# User-specific envs
# export ENV_NAME="ENV_VALUE"

# User-specific aliases
# alias alias_name="alias_value"
alias xjc=/home/jenkins-master/tools/hudson.model.JDK/JDK8u202/bin/xjc

cd $REPO_DIR

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
. "$HOME/.cargo/env"

[[ $(type -P fzf) ]] && eval "$(fzf --bash)"
