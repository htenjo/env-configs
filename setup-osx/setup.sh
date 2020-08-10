#!/bin/zsh

set -e

echo "######################################################################"
echo "::: Installing OSX Basics"
echo "######################################################################"
echo ""
echo ::: To install everything type your ADMIN password:
sudo -v
echo ""
echo "::: Updating your MacBookPro "
echo ::: If restart is required, run this script again!
echo ""
if read -q "?Would you like to update you OSX? (y/n): " ; then
    echo "::: Updating OSX ..."
	sudo softwareupdate -ia --verbose
fi;

if  read -q "?Would you like to install Xcode DevTools? (y/n): "  ; then
	echo ::: Installing Xcode Command Line Tools
	xcode-select --install
fi;

if  read -q "?Would you like to install CocoaPods DevTools? (y/n): "  ; then
	echo ::: Installing CocoaPods
	sudo gem install cocoapods
fi;

echo "::: Homebrew Devtools"
if  read -q "?Would you like to install homebrew dev tools? (y/n): "  ; then
	echo ::: Installing homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi;

echo ""
echo "######################################################################"
echo "::: Installing Java Tools"
echo "######################################################################"
echo ::: Checking Java...
echo ::: Checking JEnv
if  read -q "?Would you like to install JEnv? (y/n): "  ; then
	echo ::: Installing JEnv
	brew install jenv
	echo 'eval "$(jenv init -)"' >> /Users/hernan.tenjo/.zshrc
	jenv enable-plugin export
	jenv enable-plugin maven
	echo "::: JEnv OK - To add additional JDKs check:"
	echo "- https://github.com/jenv/jenv"
	echo "- http://139.117.146.31/blog/configuring-jenv-the-right-way/"
fi

if  read -q "?Would you like to install the Oracle JDK 14? (y/n): "  ; then
	brew cask install oracle-jdk
	echo "::: Oracle JDK OK"
	jenv add $(/usr/libexec/java_home)
	jenv versions
fi;

if  read -q "?Would you like to install OpenJDK 8? (y/n): "  ; then
	brew cask install adoptopenjdk8
	echo "::: OpenJDK 8 OK"
fi;

echo ::: Checking Maven
if  read -q "?Would you like to install Maven? (y/n): "  ; then
	echo "::: Installing Maven..."
	brew install maven
	echo "::: Maven OK"
fi

echo ::: Checking Gradle
if  read -q "?Would you like to install Gradle? (y/n): "  ; then
	echo ::: Installing Gradle
	brew install gradle
	echo ::: Gradle OK
fi

echo ::: Checking IntelliJ...
if  read -q "?Would you like to install IntelliJ? (y/n): "  ; then
    echo "::: Installing IntelliJ ..."
    brew cask install intellij-idea
	echo ::: IntelliJ OK
fi;

echo ""
echo "######################################################################"
echo "::: Installing Web Tools"
echo "######################################################################"
if  read -q "?Would you like to install NodeJS? (y/n): "  ; then
	echo ::: Installing NodeJS...
	brew install node
	echo ::: NodeJS OK
fi

if  read -q "?Would you like to install  Yarn? (y/n): "  ; then
    echo "::: Installing Yarn ..."
	brew install yarn
	echo ::: Yarn OK
fi;

if  read -q "?Would you like to install Gulp? (y/n): "  ; then
    echo "::: Installing Gulp ..."
	npm install -g gulp-cli
	echo ::: Gulp OK
fi;

if  read -q "?Would you like to install WGet? (y/n): "  ; then
    echo "::: Installing WGet ..."
	brew install wget
	echo ::: Wget OK
fi;

echo ""
echo "######################################################################"
echo "::: Installing Additional DevTools"
echo "######################################################################"

if  read -q "?Would you like to install iTerm2? (y/n): "  ; then
    echo "::: Installing iTerm2 ..."
	brew cask install iterm2
	echo "::: Downloading themes from https://iterm2colorschemes.com"
	# wget -O iterm2colorschemes https://github.com/mbadolato/iTerm2-Color-Schemes/zipball/master
	wget -O homebrewTheme.itermcolors https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Homebrew.itermcolors
	wget -O JetBrainsTheme.itermcolors https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/JetBrains%20Darcula.itermcolors
fi;

if  read -q "?Would you like to install VSCode? (y/n): "  ; then
    echo "::: Installing VSCode ..."
	brew cask install visual-studio-code
fi;

if  read -q "?Would you like to install VSCode Extensions? (y/n): "  ; then
    echo "::: Installing VSCode Extensions ..."
	code --install-extension 
	code --install-extension Dart-Code.flutter
	code --install-extension DotJoshJohnson.xml
	code --install-extension ms-python.python
	code --install-extension PKief.material-icon-theme
	code --install-extension yzhang.markdown-all-in-one
	code --install-extension redhat.java
	code --install-extension VisualStudioExptTeam.vscodeintellicode
	code --install-extension vscjava.vscode-java-debug
	code --install-extension vscjava.vscode-java-dependency
	code --install-extension vscjava.vscode-java-pack
	code --install-extension vscjava.vscode-java-test
	code --install-extension vscjava.vscode-maven
fi;

if  read -q "?Would you like to install Docker? (y/n): "  ; then
	echo "::: Installing Docker ..."
	brew cask install docker
fi;

if  read -q "?Would you like to install Flutter? (y/n): "  ; then
    echo "::: Downloading Flutter ..."
	wget https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_1.20.1-stable.zip
	mv flutter_macos_1.20.1-stable.zip flutter.zip
	unzip fluter.zip
	mv flutter  ~/DevTools/fluter
	echo "::: Configuring Flutter ..."
	export PATH=$PATH:~/DevTools/flutter/bin
	flutter precache
	flutter doctor
	echo "::: Flutter OK..."
fi;

echo ""
echo "######################################################################"
echo "::: Installing desktop Apps"
echo "######################################################################"

if  read -q "?Would you like to install Slack? (y/n): "  ; then
    echo "::: Installing Slack ..."
	brew cask install slack
fi;

if  read -q "?Would you like to install Chrome? (y/n): "  ; then
    echo "::: Installing Google Chrome ..."
	brew cask install google-chrome
fi;

if  read -q "?Would you like to install DBeaver? (y/n): "  ; then
	echo "::: Installing DBeaver ..."
	brew cask install dbeaver-community
fi;

echo ""
echo "######################################################################"
echo "::: Installing Other Apps"
echo "######################################################################"
if  read -q "?Would you like to install Spotify? (y/n): "  ; then
	echo "::: Installing Spotify ..."
	brew cask install spotify
fi;

if  read -q "?Would you like to install Unarchiver? (y/n): "  ; then
	echo "::: Installing Unarchiver ..."
	brew cask install the-unarchiver
fi;

if  read -q "?Would you like to install Postman? (y/n): "  ; then
	echo "::: Installing Postman ..."
	brew cask install postman
fi;

if  read -q "?Would you like to install VLC? (y/n): "  ; then
	echo "::: Installing VLC ..."
	brew cask install vlc
fi;

if  read -q "?Would you like to install PgAdmin4? (y/n): "  ; then
	echo "::: Installing PgAdmin4 ..."
	brew cask install pgAdmin4
fi;

if  read -q "?Would you like to install Whatsapp? (y/n): "  ; then
	echo "::: Installing Whatsapp ..."
	brew cask install whatsapp
fi;

if  read -q "?Would you like to install Webex? (y/n): "  ; then
	echo "::: Installing Webex ..."
	brew cask install webex-meetings
fi;

echo ""
echo "######################################################################"
echo "::: Environment Config 												"
echo "######################################################################"

if  read -q "?Would you like to install oh-my-zsh (y/n): "  ; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	compaudit | xargs chmod g-w,o-w
fi;

if  read -q "?Would you like to configure your ENV (.zshenv, .zshrc) (y/n): "  ; then
	chmod +x env_config.sh
	source ./env_config.sh
fi;

if  read -q "?Would you like to create SSH Keys (y/n): "  ; then
	echo "::: Type same filenames to be able to add the keys to the keymananger"
	echo "::: Generating SSH-KEY 1: id_rcc ]"
	ssh-keygen -t rsa -C "RCC"
	echo "::: Generating SSH-KEY 2: id_glb"
	ssh-keygen -t rsa -C "GLB"
	ssh-add -K ~/.ssh/id_rcc && ssh-add -K ~/.ssh/id_glb
fi;

if  read -q "?Would you like to install TLDR (Simple MAN info) (y/n): "  ; then
	echo "::: Installing TLDR ... "
	npm install -g tldr
fi;

echo ""
echo "######################################################################"
echo "::: Apps to Install Manually"
echo "######################################################################"
echo "Android Studio (Go to: https://developer.android.com/studio#downloads)"
echo "AnyDesk (Remote desktop)"
echo "Google Backup & Sync"
echo "Cannon Utilities (To configure printer)"
echo "Cyberduck.app (Transfer files)"
echo "GIMP-2.10.app (Photo Editor)"
echo "MS OFFICE"
echo "Todoist.app (TODOs Application)"
echo "TuneIn.app (Music)"

echo "######################################################################"
echo "::: CONGRATULATIONS SETUP FINISHED !!!"
echo "######################################################################"