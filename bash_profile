# Custom bash settings by Bain

export HISTSIZE=40000
export HISTFILESIZE=${HISTSIZE}
export HISTTIMEFORMAT='%F %T '
export TMOUT=0
export PAGER=less
export EDITOR=vim

###
export HISTCONTROL=ignoredups

# Do not delete your precious history file before writing the new one
shopt -s histappend

# Correct minor spelling errors in cd commands
shopt -s cdspell

# Do *not* append the following to our history: consecutive duplicate
# commands, ls, bg and fg, and exit
# Don't keep useless history commands. Note the last pattern is to not
# keep dangerous commands in the history file.  Who really needs to
# repeat the shutdown(8) command accidentally from your command
# history?

HISTIGNORE='\&:fg:bg:ls:pwd:cd ..:cd ~-:cd -:cd: cd *:jobs:set -x:ls -l:ls -la:l: PROMPT_COMMAND'

HISTIGNORE=${HISTIGNORE}':%1:%2:popd:top:pine:mutt:shutdown*'
export HISTIGNORE

if [ "$USER" = "root" ]; then
        USRCOL="\[\033[0;31m\]"
        USRPROMPTSIGN="\[\033[0;31m\]#"
else
        USRCOL="\[\033[0;32m\]"
        USRPROMPTSIGN="\[\033[0;32m\]>"
fi


if [ "$USER" = "root" ]; then
    USRCOL="\[\033[0;31m\]"
    USRPROMPTSIGN="\[\033[0;31m\]#"
else
    # Green
    USRCOL="\[\033[0;32m\]"
    USRPROMPTSIGN="\[\033[0;32m\]>"
    # Grey
    #USRCOL="\[\033[0;90m\]"
    #USRPROMPTSIGN="\[\033[0;90m\]$"
fi

# Green
PROMPT_COMMAND='prompt_command; RES=$?; [[ ${RES} -eq 0 ]] && RCCOL=32 || RCCOL=31 ;PS1=`echo -ne "${status_style}${fill} \t\n${USRCOL}\u\[\033[0m\]@\[\033[0;32m\]\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\][\[\033[0;${RCCOL}m\]${RES}\[\033[0m\]]${USRPROMPTSIGN} \[\033[0m\]"`'

# Grey
#PROMPT_COMMAND='RES=$?; [[ ${RES} -eq 0 ]] && RCCOL=32 || RCCOL=31 ;PS1=`echo -ne "${USRCOL}\u\[\033[0m\]@\[\033[0;90m\]\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\][\[\033[0;${RCCOL}m\]${RES}\[\033[0m\]]${USRPROMPTSIGN} \[\033[0m\]"`'

# You may uncomment the following lines if you want `ls\' to be
# colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias ssh='ssh -A'
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
