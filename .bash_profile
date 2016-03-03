export PATH="~/.virtualenvs/atticenv/bin:$PATH"


# history settings
HISTCONTROL=ignoreboth:erasedups 
HISTIGNORE='ls:bg:fg:history:cd ..:adb logcat:adb logcat -c:git st:git pull:git log:pwd:git fo:g fo:cd ~:clear:ls -a'
HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

CDPATH=".:~:~/workspace" ## This defines where cd looks for targets


shopt -s histappend ## append, no clearouts                                                               
shopt -s histverify ## edit a recalled history line before executing                                      
shopt -s histreedit ## reedit a history substitution line if it failed   
shopt -s checkwinsize ## Update window size after every command
shopt -s cmdhist ## Save multi-line commands as one command
#shopt -s autocd ## Prepend cd to directory names automatically todo
shopt -s dirspell ## Correct spelling errors during tab-completion
shopt -s cdspell ## Correct spelling errors in arguments supplied to cd
