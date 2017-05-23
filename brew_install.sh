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

echo "Installing some brew packages"
brew install wget automake autoconf libevent openssl libmemcached ossp-uuid xz libpng pkg-config icoutils libtool qt libtiff pstree ack curl imagemagick libxml2 readline dialog jpeg memcached redis freetype lftp node tmux autojump gawk git bash-completion git-flow hub colordiff android-sdk pidcat
echo "done."

echo "updating brew; cleaning up"
brew update && brew upgrade && brew cleanup
echo "done"

exit 0