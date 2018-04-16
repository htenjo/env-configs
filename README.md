# MAC Configurations

Almost all following commands implies copy and paste in Terminal.

###### Increase the magic mouse speed (higher number is faster)
    defaults write -g com.apple.mouse.scaling 30.0

###### http tool (like curl but easier)
    brew install httpie

###### .bash_profile
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



### Git Configurations
#### Install git
    brew install git
#### Enable git colors
    git config --global color.ui true
#### Adding completion feature
    brew install bash-completion
