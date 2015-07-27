# colours and prompt formatting
export CLICOLOR=1
export LSCOLORS=ExFxDxCxegedabagacad
export PS1="\u@\h\$"
PS1="\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[34m\]\W\[\e[0m\]$ "

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

# git aliases 
# alias g='git'
# alias gst='git status'
# alias gs='git status -s'
# alias ga='git add'
# alias gaa='git add --all'
# alias gapa='git add --patch'
# alias gb='git branch'
# alias gba='git branch -a' # git branch --all
# alias gbr='git branch --remote'
# alias gc='git checkout'
# alias gc!='git commit -v --amend'
# alias gcl='git clone'
# alias gm="git merge"
# alias grh='git reset HEAD'
# alias gpr='git pull --rebase'
# alias gpo='git push origin'
# alias gfo='git fetch origin'
# alias gcm="git commit -m"
# alias gci="git commit --interactive"
# alias gco='git checkout'
# alias gdel='git branch -D'
# alias gl="git log"
# alias glog="git log --graph --pretty=oneline --abbrev-commit"
# alias gr="git remote -v"
# alias gui='git gui citool'

# homebrew
alias bcup="brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup"

# export
export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk
export ANDROID_HOME=/usr/local/opt/android-sdk

# run bash completition script
source /usr/local/etc/bash_completion
