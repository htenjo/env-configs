### Git Configurations
#### Install git
    brew install git
#### Enable git colors
    git config --global color.ui true
#### Adding completion feature
    brew install bash-completion


#### Git commands
	Rename current branch:	$ git branch -m new-name
	Rename other branch:	$ git branch -m old-name new-name
	Push renamed branch:	$ git push origin :old-name new-name

	Delete local branch:	$ git branch -d [-D to force] <branch_name>
	Delete remote branch: 	$ git push -d [-D to force] <remote_name> <branch_name>