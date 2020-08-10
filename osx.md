# MAC Configurations
Almost all following commands implies copy and paste in Terminal.

## General Mac configs 
| Description                                              | Command                                                                                                |
| -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| Increase the magic mouse speed (higher number is faster) | `$ defaults write -g com.apple.mouse.scaling 30.0`                                                       |
| http tool (like curl but easier)                         | `$ brew install httpie`                                                                                |
| Install git                                              | `$ brew install git`                                                                                   |
| Adding completion feature                                | `$ brew install bash-completion`                                                                       |
| Avoid folder background                                  | `$ echo "export LS_COLORS='$LS_COLORS:ow=1;34:tw=1;34:'" >> ~/.bash_profile && source ~/.bash_profile` |
| Display hidden files (.***)                              | `-> cmd + shift + .`                                                                                      |

## Other useful configurations 
- .bash_profile (DEPRECATED - Use the new zsh plugins instead)
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
- "Burning" ISO files to make bootable USB's  -> Download [UNetbootin](https://unetbootin.github.io)

## General procedures:

- Takes a txt file and transform it to an html document, once the html file is ready converts it in a pdf file (all native in OSX).  
  `$ textutil -font 'courier' -fontsize 7 -convert html Tickets.txt | cupsfilter -i text/html -m application/pdf Tickets.html > Tickets.pdf`

-  "Burning" ISO files to make bootable USB's   
   - List the current volumes, then copy the identifier of the usb volumen (e.g. /dev/disk2s1) to copy the iso info.  
     `$ diskutil list`
   - Unmount the usb volumen  
     `$ sudo umount /dev/disk2s1`
   - Copy the ISO info to the USB volumen  
   	`$ sudo dd if=/${pathToIsoFile}/ubuntu-17.10.1-desktop-amd64.iso of=/dev/rdisk2s1 bs=1m`
   - Wait until the command finishes (no progress bar or anything). If everything was ok, something like this will be displayed  
   	`$ 1502576640 bytes transferred in 344.126562 secs (4366349 bytes/sec)`
   - Finally eject the USB  
   	`$ diskutil eject /dev/disk2s`

- Change your MAC (Unlimited WiFi?): 
  ``` bash
  function changeMac() {
    local mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
    sudo ifconfig en0 ether $mac
    sudo ifconfig en0 down
    sudo ifconfig en0 up
    echo "Your new physical address is $mac"
  }
  ```