#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "done."
fi

# Install homebrew packages
echo "Installing git..."
brew install git
echo "...done."


# cask
echo "tapping caskroom"
brew tap caskroom/cask
brew install brew-cask
echo "installed cask"

echo "Installing some brew packages"
brew install wget automake autoconf libevent openssl libmemcached ossp-uuid xz libpng pkg-config icoutils libtool qt libtiff pstree ack curl imagemagick libxml2 readline dialog jpeg memcached redis freetype lftp node tmux autojump gawk git bash-completion git-flow hub colordiff android-sdk
echo "done."

echo "installing quicklook cask plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
echo "done."

# use "brew cask audit <package_name>" to check installability of caks
echo "Installing cask apps"
brew cask install adium google-chrome macvim superduper android-studio hexchat monolingual tagger anvil intel-haxm noizio the-unarchiver apptrap iterm2-borderless onyx transmission atom java picasa tunnelblick awareness kdiff3 qlvideo vienna battery-guardian keepingyouawake recordit vimr cakebrew launchrocket rowanj-gitx vlc cheatsheet loading shuttle xld flash-player mac2imgur sourcetree flashlight macpass subtitles dropbox sequel-pro skype cloudapp rdio disk-inventory-x slack
echo "done."


echo "updating brew; brew-cask; cleaning up"
brew update && brew upgrade brew-cask && brew cleanup
echo "done"

exit 0