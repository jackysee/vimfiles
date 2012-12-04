my vimfiles
===========
These are my vimfiles and settings.

INSTALL
-------
1. Check out from github

		cd c:\Program Files\Vim (or location of your vim install)
		rmdir /s vimfiles 
		git clone https://github.com/jackysee/vimfiles.git vimfiles
		git submodule update --init

2. Link source file. Add this line to C:\Users\[username]\_vimrc

	    source $VIM/vimfiles/vimrc

INSTALL & UPDATE PLUGIN
--------------
Install new plugin inside `bundle` directory. Pathogen will handle.

    git submodule add [GIT-REPOSITORY-URL] bundle/[PLUGIN-NAME]

Update is an easy `git pull`

    cd [VIM-INSTALL]/vimfiles/bundle/[PLUGIN-NAME]
    git pull

RESOURCE
--------
* http://amix.dk/vim/vimrc.html
* http://spf13.com/post/perfect-vimrc-vim-config-file
* http://people.csail.mit.edu/vgod/vim/vim-cheat-sheet-en.png 
