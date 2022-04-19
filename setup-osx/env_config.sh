#!/bin/zsh

echo ''
echo "######################################################################"
echo "::: Configuring your MacBookPro ENV Development"
echo "######################################################################"
cat ~/.oh-my-zsh/templates/zshrc.zsh-template > ~/.zshrc
echo '' >> ~/.zshrc && echo '' >> ~/.zshrc
echo "######################################################################" >> ~/.zshrc
echo "# My Environment configuration                                       " >> ~/.zshrc
echo "######################################################################" >> ~/.zshrc
echo '::: Configuring aliases ...'
echo '' >> ~/.zshrc && echo '# Aliases' >> ~/.zshrc
# echo 'alias ll="ls -la"' >> ~/.zshrc
echo 'alias show_dots="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"' >> ~/.zshrc
echo 'alias hide_dots="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"' >> ~/.zshrc

echo '::: Configuring VIM ...'
echo 'syntax on' > ~/.vimrc

##### Enable these ones if no oh-my-zsh installed and you want colorful terminal
echo "::: Configuring CLI Colors (https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/)"
echo '' >> ~/.zshrc && echo '# CLI Config' >> ~/.zshrc
#echo 'export PS1="::: %~ %# > "' >> ~/.zshrc
#echo 'export CLICOLOR=1' >> ~/.zshrc
echo 'export LSCOLORS=ExFxBxDxCxegedabagacad' >> ~/.zshrc

echo "::: Configuring ZSH Themes & Plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i '' 's/robbyrussell/af-magic/' ~/.zshrc
sed -i '' 's/plugins=(git)/plugins=(git docker docker-compose zsh-syntax-highlighting)/' ~/.zshrc


echo "######################################################################" > ~/.zshenv
echo "# My Environment configuration                                        " >> ~/.zshenv
echo "######################################################################" >> ~/.zshenv
echo '::: Configuring flutter ...'
echo '' >> ~/.zshenv && echo '# DevTools' >> ~/.zshenv
echo 'export PATH=$PATH:~/DevTools/flutter/bin' >> ~/.zshenv

echo ::: Setting OSX Defaults
defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder
echo ::: Displaying hidden files OK
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
echo ::: Avoid .DS_Store files in network Volumes OK
echo ::: Resizing LaunchPad icons
defaults write com.apple.dock springboard-rows -int 8
defaults write com.apple.dock springboard-columns -int 9
killall Dock
source ~/.zshenv
source ~/.zshrc

echo ::: Environment config LOADED OK