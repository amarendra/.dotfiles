source ~/Dropbox/code/git-ignored/aliases

alias pi='ssh pi@192.168.1.101'

# git log pretty 
alias gl='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

# git log pretty and details
alias gld='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

alias gfo='git fetch origin'
alias gpo='git push origin'
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -m'
alias co='git checkout'
alias gs='git status -s'
alias gst='git status'	
alias gd='git diff'
alias gdc='git diff --cached'

# lock system
alias lock='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'

# every profile gets reloaded
alias refresh='source ~/.bash_profile'

c='clear'

alias ls="ls -hGFp"
alias p="pwd"
alias stfu="osascript -e 'set volume output muted true'"
alias reload="exec $SHELL -l" #reload shell
# cd
alias ..="cd .."
alias ...="cd .. ; cd .."
#alias \-="cd -"
alias work="cd ~/workspace"
alias ola="cd ~/workspace/ola"

# top
alias topm='top -o vsize'
alias topc='top -o cpu'
alias ltop='top -F -R -o cpu'

# subtitles
alias sub='subliminal download -l en'

# git aliase
alias g='git'

# homebrew
alias bcup="brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup"

#editors
alias st='open -a "Sublime Text"'
alias tw='open -a "TextWrangler"'

#file
alias show="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder"