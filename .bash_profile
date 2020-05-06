# Python environment (version 3.6)
export PATH="/Users/vijaypappu/anaconda/bin:$PATH"
source activate python36
echo "$(conda info -e)"

# Java environment (version 1.8)
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Scala environment (version 2.12)
export PATH="/usr/local/opt/scala@2.12/bin:$PATH"

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]:\$(date)$ "

##ALIAS
## Colorize the grep command output for ease of use (good for log files) ##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias mkdir='mkdir -pv'
alias jupyter="jupyter notebook"
alias ls="ls -alGFh"
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'
alias diff='colordiff'

#if [ -r ~/.bashrc ]; then
#   source ~/.bashrc
#fi
