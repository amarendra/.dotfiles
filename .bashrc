# colours and prompt formatting
export CLICOLOR=1
export LSCOLORS=ExFxDxCxegedabagacad
export PS1="\u@\h\$"
PS1="\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[34m\]\W\[\e[0m\]$ "

export PS1="$PS1\$(git-radar --bash --fetch)"

# aliases
alias ls="ls -hGFp"
alias p="pwd"
alias stfu="osascript -e 'set volume output muted true'"
alias reload="exec $SHELL -l" #reload shell
# cd
alias ..="cd .."
alias ...="cd .. ; cd .."
#alias \-="cd -"
alias work="cd ~/workspace"

# away from keyboard
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# top
alias topm='top -o vsize'
alias topc='top -o cpu'
alias ltop='top -F -R -o cpu'

# git aliase
alias g='git'

# subtitles
alias sub='subliminal download -l en'

source /usr/local/etc/bash_completion.d/git-completion.bash

complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
    || complete -o default -o nospace -F _git g

# homebrew
alias bcup="brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup"

# export
export WORKON_HOME=~/.virtualenvs
export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_74.jdk
export ANDROID_HOME=/usr/local/opt/android-sdk

# run bash completition script
source /usr/local/etc/bash_completion