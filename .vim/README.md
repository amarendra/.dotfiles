Installation:
=============


Install .vim for your own custom .vimrc, .gvimrc, tmp and this README file: 

    git clone https://github.com/amarendra/.vim.git ~/.vim    

Create symlinks to get .vimrc and .gvimrc symlinked into ~/ from ~/.vim for Vim to read it :
	
	ln -s ~/.vim/.vimrc ~/.vimrc
	ln -s ~/.vim/.gvimrc ~/.gvimrc 

Install Vundle inside .vim/bundle directory:

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Install Vim plugins, listed in .vimrc, using Vundle:

    :BundleInstall

More on Vundle:

    :h vundle

