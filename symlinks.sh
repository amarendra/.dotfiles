#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles

## RUN LIKE THIS (or execute this from some other script):
##
## 		cd ~/dotfiles
## 		chmod +x symlinks.sh
## 		./symlinks.sh
############################

########## Variables
dir=~/.dotfiles                    # dotfiles directory
old_dir=~/.dotfiles_old             # old dotfiles backup directory

# list of files/folders to symlink in homedir
files=".bashrc .vimrc .gvimrc .bash_profile .bash_aliases .gitconfig .inputrc .profile .vimperatorrc"

##########

# create .dotfiles_old in homedir
echo "Creating $old_dir for backup of any existing dotfiles in ~"
mkdir -p $old_dir
echo "...done"

# change to the .dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing .dotfiles in home directory to .dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing .dotfiles from ~ to $old_dir"
    mv ~/$file $old_dir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

## make some other symlinks

#Firefox RES

ln -s ~/Dropbox/Config/Firefox/RES/current/store.json ~/Library/Application\ Support/Firefox/Profiles/*.default/jetpack/jid1-xUfzOsOFlzSOXg@jetpack/simple-storage/store.json