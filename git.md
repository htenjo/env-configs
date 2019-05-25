# Git Useful commands

## Git command cheat sheet

Command | Description
------- | -----------
`$ git branch -m new-name` | Rename current branch
`$ git branch -m old-name new-name`| Rename other branch
`$ git push origin :old-name new-name` | Push renamed branch
`$ git branch -d [-D to force] <branch_name>` | Delete local branch
`$ git push -d [-D to force] <remote_name> <branch_name>`| Delete remote branch
`$ git remote -v` | Display remotes in verbose mode
`$ git remote get-url origin` | Display url of `origin` remote
`$ git remote add <remote-reference-name> <remote-url>` | Add a remote reference to our repo
`$ git remote remove <remote-reference-name>` | Delete a remote reference from our repo
`$ git remote rename <old-name> <new-name>` | Rename a remote reference


## General/Additional configurations
#### Enable git colors
    $ git config --global color.ui true

#### Adding completion feature
    $ brew install bash-completion


