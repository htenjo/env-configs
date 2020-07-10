# MAC Configurations
Almost all following commands implies copy and paste in Terminal.

## General Mac configs 
| Description                                              | Command                                          |
| -------------------------------------------------------- | ------------------------------------------------ |
| Increase the magic mouse speed (higher number is faster) | `defaults write -g com.apple.mouse.scaling 30.0` |
| http tool (like curl but easier)                         | `$ brew install httpie`                            |
| Install git                                              | `$ brew install git`                                 |
| Adding completion feature                                | `$ brew install bash-completion`                     |
Avoid folder background| `$ echo "export LS_COLORS='$LS_COLORS:ow=1;34:tw=1;34:'" >> ~/.bash_profile && source ~/.bash_profile`

## Other useful configurations 
- .bash_profile
```bash
    ## ====================================================================
    ## Git completion config START            
    ## ====================================================================
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        source $(brew --prefix)/etc/bash_completion
    fi

    source $(brew --prefix)/git/contrib/completion/git-prompt.sh
    PS1="\$(__git_ps1 \"(%s)\")\$  "
    ## ====================================================================
    ## Git completion config END  
    ## ====================================================================

    ## Enable colors for files and folders in terminal
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
```
- "Burning" ISO files to make bootable USB's  -> Download [UNetbootin](https://unetbootin.github.io)s