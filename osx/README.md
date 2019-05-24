# MAC Useful commands

#### Increase the magic mouse speed (higher number is faster)
    defaults write -g com.apple.mouse.scaling 30.0

#### http tool (like curl but easier)
    brew install httpie

#### .bash_profile
    ## ================================================================
    ## Git completion config START  
    ## ================================================================
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      source $(brew --prefix)/etc/bash_completion
    fi
    
    source $(brew --prefix)/git/contrib/completion/git-prompt.sh
    PS1="\$(__git_ps1 \"(%s)\")\$  "
    ## =================================================================
    ## Git completion config END  
    ## =================================================================



#### "Burning" ISO files to make bootable USB's   
- List the current volumes, then copy the identifier of the usb volumen (e.g. /dev/disk2s1) to copy the iso info.

        $ diskutil list
- Unmount the usb volumen

		$ sudo umount /dev/disk2s1
- Copy the ISO info to the USB volumen:

		$ sudo dd if=/${pathToIsoFile}/ubuntu-17.10.1-desktop-amd64.iso of=/dev/rdisk2s1 bs=1m

- Wait until the command finishes (no progress bar or anything). If everything was ok, something like this will be displayed:

		$ 1502576640 bytes transferred in 344.126562 secs (4366349 bytes/sec)
- Finally eject the USB:

		$ diskutil eject /dev/disk2s