# colours and prompt formatting
export CLICOLOR=1
export LSCOLORS=ExFxDxCxegedabagacad
export PS1="\u@\h\$"
PS1="\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[34m\]\W\[\e[0m\]$ "

export PS1="$PS1\$(git-radar --bash --fetch)"

source /usr/local/etc/bash_completion.d/git-completion.bash

complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
    || complete -o default -o nospace -F _git g

# run bash completition script
source /usr/local/etc/bash_completion

shopt -s histappend ## append, no clearouts                                                               
shopt -s histverify ## edit a recalled history line before executing                                      
shopt -s histreedit ## reedit a history substitution line if it failed   
shopt -s checkwinsize ## Update window size after every command
shopt -s cmdhist ## Save multi-line commands as one command
#shopt -s autocd ## Prepend cd to directory names automatically #todo
shopt -s dirspell ## Correct spelling errors during tab-completion
shopt -s cdspell ## Correct spelling errors in arguments supplied to cd

# history settings
HISTCONTROL=ignoreboth:erasedups 
HISTIGNORE='ls:bg:fg:history:cd ..:adb logcat:adb logcat -c:git st:git pull:git log:pwd:git fo:g fo:cd ~:clear:ls -a'
HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

CDPATH=".:~:~/workspace" ## This defines where cd looks for targets
# add this configuration to ~/.bashrc
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh \C-j"'; fi

