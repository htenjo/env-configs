#!/bin/zsh

set -e

ENV_FILE=$HOME/.zshrc

requestPrivileges() {
  echo "::: To install everything type your ADMIN password:"
  sudo -v
  echo "::: Updating your MacBookPro -> If restart is required, RUN THIS SCRIPT AGAIN!"
}

setupOsxUpdates() {
  if read -q "?Would you like to update you OSX? (y/n): " ; then
    echo
    echo "::: Updating OSX ..."
  	sudo softwareupdate -ia --verbose
  else
    echo
  fi;
}

setupXCode() {
  if  read -q "?Would you like to install Xcode DevTools? (y/n): "  ; then
    echo
    echo "::: Installing Xcode Command Line Tools"
    xcode-select --install
  else
    echo
  fi;
}

setupCocoaPods() {
  if  read -q "?Would you like to install CocoaPods DevTools? (y/n): "  ; then
    echo
  	echo "::: Installing CocoaPods"
  	sudo gem install cocoapods
  else
    echo
  fi;
}

setupHomebrew() {
  if  read -q "?Would you like to install homebrew dev tools? (y/n): "  ; then
    echo
  	echo "::: Installing homebrew"
  	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  else
    echo
  fi;
}

setupJEnv() {
  if  read -q "?Would you like to install JEnv? (y/n): "  ; then
    echo
  	echo "::: Installing JEnv"
  	brew install jenv
  	echo 'eval "$(jenv init -)"' >> $ENV_FILE
  	source $ENV_FILE
  	jenv enable-plugin export
  	jenv enable-plugin maven
  	echo "::: JEnv OK - To add additional JDKs check: $ jenv add JDK-HOME"
  	echo "- https://github.com/jenv/jenv"
  	echo "- http://139.117.146.31/blog/configuring-jenv-the-right-way/"
  else
    echo
  fi
}

setupOracleJDK() {
  if  read -q "?Would you like to install the Oracle JDK? (y/n): "  ; then
    echo
  	brew install --cask oracle-jdk
  	echo "::: Oracle JDK OK"
  	jenv add $(/usr/libexec/java_home)
  	jenv versions
  else
    echo
  fi;
}

setupOpenJDK() {
  if  read -q "?Would you like to install OpenJDK 8? (y/n): "  ; then
    echo
  	brew tap adoptopenjdk/openjdk
  	brew install --cask adoptopenjdk8
  	echo "::: OpenJDK 8 OK"
  else
    echo
  fi;
}

setupMaven() {
  if  read -q "?Would you like to install Maven? (y/n): "  ; then
    echo
  	echo "::: Installing Maven..."
  	brew install maven
  	echo "::: Maven OK"
  else
    echo
  fi
}

setupGradle() {
  if  read -q "?Would you like to install Gradle? (y/n): "  ; then
    echo
  	echo "::: Installing Gradle"
  	brew install gradle
  	echo "::: Gradle OK"
  else
    echo
  fi
}

setupIntelliJCE() {
  if  read -q "?Would you like to install IntelliJ CE? (y/n): "  ; then
    echo
    echo "::: Installing IntelliJ CE..."
    brew install --cask intellij-idea
    echo "::: IntelliJ OK"
  else
    echo
  fi;
}

setupGo() {
  if read -q "?Would you like to install Go (y/n) " ; then
    echo
  	echo "::: Installing Go ..."
    brew install golang
  	echo '::: Configuring Go ...'
  	mkdir -p $HOME/go/{bin,src,pkg}
  	echo "export GOPATH=$HOME/go" >> $ENV_FILE
  	echo "export GOROOT=$(brew --prefix golang)/libexec" >> $ENV_FILE
  	echo "export PATH=$PATH:${GOPATH}/bin:${GOROOT}/bin" >> $ENV_FILE
  	source $ENV_FILE
  	echo "::: Go OK"
  else
    echo
  fi;
}

setupFlutter() {
  if  read -q "?Would you like to install Flutter? (y/n): "  ; then
    echo
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
  else
    echo
  fi;
}

setupNodeJS() {
  if  read -q "?Would you like to install NodeJS? (y/n): "  ; then
    echo
  	echo "::: Installing NodeJS..."
  	brew install node
  	echo "::: NodeJS OK"
  else
    echo
  fi
}

setupYarn() {
  if  read -q "?Would you like to install Yarn? (y/n): "  ; then
    echo
    echo "::: Installing Yarn ..."
  	brew install yarn
  	echo "::: Yarn OK"
  else
    echo
  fi;
}

setupGulp() {
  if  read -q "?Would you like to install Gulp? (y/n): "  ; then
    echo
    echo "::: Installing Gulp ..."
  	npm install -g gulp-cli
  	echo "::: Gulp OK"
  else
    echo
  fi;
}

setupWGet() {
  if  read -q "?Would you like to install WGet? (y/n): "  ; then
    echo
    echo "::: Installing WGet ..."
  	brew install wget
  	echo "::: Wget OK"
  else
    echo
  fi;
}

setupITerm() {
  if  read -q "?Would you like to install iTerm2? (y/n): "  ; then
    echo
    echo "::: Installing iTerm2 ..."
  	brew install --cask iterm2
  	echo "::: Downloading themes from https://iterm2colorschemes.com"
  	# wget -O iterm2colorschemes https://github.com/mbadolato/iTerm2-Color-Schemes/zipball/master
  	wget -O homebrewTheme.itermcolors https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Homebrew.itermcolors
  	wget -O JetBrainsTheme.itermcolors https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/JetBrains%20Darcula.itermcolors
  else
    echo
  fi;
}

setupVSCode() {
  if  read -q "?Would you like to install VSCode? (y/n): "  ; then
    echo
    echo "::: Installing VSCode ..."
  	brew install --cask visual-studio-code
  else
    echo
  fi;
}

setupVSCodeExtensions() {
  if  read -q "?Would you like to install Material, Markdown, and basic-generic VSCode Extensions? (y/n): "  ; then
    echo
    echo "::: Installing VSCode Extensions ..."
  	code --install-extension
  	code --install-extension DotJoshJohnson.xml
  	code --install-extension PKief.material-icon-theme
  	code --install-extension yzhang.markdown-all-in-one
  	code --install-extension VisualStudioExptTeam.vscodeintellicode
  else
    echo
  fi;
}

setupVsCodeFlutterExtension() {
  if  read -q "?Would you like to install Flutter VSCode Extensions? (y/n): "  ; then
    echo
    echo "::: Installing VSCode Extensions ..."
  	code --install-extension
  	code --install-extension Dart-Code.flutter
  else
    echo
  fi;
}

setupVsCodeJavaExtension() {
  if  read -q "?Would you like to install Java VSCode Extensions? (y/n): "  ; then
    echo
    echo "::: Installing VSCode Extensions ..."
  	code --install-extension
  	code --install-extension redhat.java
  	code --install-extension vscjava.vscode-java-debug
  	code --install-extension vscjava.vscode-java-dependency
  	code --install-extension vscjava.vscode-java-pack
  	code --install-extension vscjava.vscode-java-test
  	code --install-extension vscjava.vscode-maven
  else
    echo
  fi;
}

setupDocker() {
  if  read -q "?Would you like to install Docker? (y/n): "  ; then
    echo
  	echo "::: Installing Docker ..."
  	brew install --cask docker
  else
    echo
  fi;
}

setupTerraform() {
  if  read -q "?Would you like to install Terraform? (y/n): "  ; then
    echo
    echo "::: Installing Terraform ..."
    brew tap hashicorp/tap
  	brew install hashicorp/tap/terraform
  	brew upgrade hashicorp/tap/terraform
  	echo ::: Terraform OK
  else
    echo
  fi;
}

setupSlack() {
  if read -q "?Would you like to install Slack? (y/n): "  ; then
    echo
    echo "::: Installing Slack ..."
  	brew install --cask slack
  else
      echo
  fi;
}

setupChrome() {
  if read -q "?Would you like to install Chrome? (y/n): "  ; then
    echo
    echo "::: Installing Google Chrome ..."
  	brew install --cask google-chrome
  else
      echo
  fi;
}

setupDBeaver() {
  if read -q "?Would you like to install DBeaver? (y/n): "  ; then
    echo
  	echo "::: Installing DBeaver ..."
  	brew install --cask dbeaver-community
  else
      echo
  fi;
}

setupSpotify() {
  if  read -q "?Would you like to install Spotify? (y/n): "  ; then
    echo
  	echo "::: Installing Spotify ..."
  	brew install --cask spotify
  else
      echo
  fi;
}

setupUnArchiver() {
  if  read -q "?Would you like to install UnArchiver? (y/n): "  ; then
    echo
  	echo "::: Installing UnArchiver ..."
  	brew install --cask the-unarchiver
  else
      echo
  fi;
}

setupPostman() {
  if  read -q "?Would you like to install Postman? (y/n): "  ; then
    echo
  	echo "::: Installing Postman ..."
  	brew install --cask postman
  else
      echo
  fi;
}

setupVLC() {
  if  read -q "?Would you like to install VLC? (y/n): "  ; then
    echo
  	echo "::: Installing VLC ..."
  	brew install --cask vlc
  else
      echo
  fi;
}

setupPgAdmin() {
  if  read -q "?Would you like to install PgAdmin4? (y/n): "  ; then
    echo
  	echo "::: Installing PgAdmin4 ..."
  	brew install --cask pgAdmin4
  else
      echo
  fi;
}

setupWhatsapp() {
  if  read -q "?Would you like to install Whatsapp? (y/n): "  ; then
    echo
  	echo "::: Installing Whatsapp ..."
  	brew install --cask whatsapp
  else
      echo
  fi;
}

setupWebex() {
  if  read -q "?Would you like to install Webex? (y/n): "  ; then
    echo
  	echo "::: Installing Webex ..."
  	brew install --cask webex-meetings
  else
      echo
  fi;
}

setupOhMyZsh() {
  if  read -q "?Would you like to install oh-my-zsh (y/n): "  ; then
    echo
  	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  	compaudit | xargs chmod g-w,o-w
  else
    echo
  fi;
}

setupEnvironmentVariables() {
  if  read -q "?Would you like to configure your ENV (.zshenv, .zshrc) (y/n): "  ; then
    echo
  	chmod +x env_config.sh
  	source ./env_config.sh
  else
    echo
  fi;
}

setupSshKeys() {
  if  read -q "?Would you like to create SSH Keys (y/n): "  ; then
    echo
  	echo "::: Type same filenames to be able to add the keys to the keymananger"
  	echo "::: Generating SSH-KEY 1: id_rcc ]"
  	ssh-keygen -t rsa -C "RCC"
  	echo "::: Generating SSH-KEY 2: id_glb"
  	ssh-keygen -t rsa -C "GLB"
  	ssh-add -K ~/.ssh/id_rcc && ssh-add -K ~/.ssh/id_glb
  else
    echo
  fi;
}

setupTLDR() {
  if  read -q "?Would you like to install TLDR (Simple MAN info) (y/n): "  ; then
    echo
  	echo "::: Installing TLDR ... "
  	npm install -g tldr
  else
    echo
  fi;
}

setupGitConfig() {
  if  read -q "?Would you like to configure your git name and email (y/n): "  ; then
    echo
    echo '::: Configuring git ...'
    git config --global user.email "hernan.tenjo@gmail.com"
    git config --global user.name "Hernan Tenjo"
  else
    echo
  fi;
}

echo
echo "######################################################################"
echo "# Installing OSX Basics"
echo "######################################################################"
requestPrivileges
setupOsxUpdates
setupXCode
setupCocoaPods
setupHomebrew

echo
echo "######################################################################"
echo "# Installing Java Tools"
echo "######################################################################"
setupJEnv
setupOracleJDK
setupOpenJDK
setupMaven
setupGradle
setupIntelliJCE

echo
echo "######################################################################"
echo "# Installing Other Languages"
echo "######################################################################"
setupGo
setupFlutter

echo
echo "######################################################################"
echo "# Installing Web Tools"
echo "######################################################################"
setupNodeJS
setupYarn
setupGulp
setupWGet

echo
echo "######################################################################"
echo "# Installing Additional DevTools"
echo "######################################################################"
setupITerm
setupVSCode
setupVSCodeExtensions
setupVsCodeFlutterExtension
setupVsCodeJavaExtension

echo
echo "######################################################################"
echo "# Installing DevOps Tools"
echo "######################################################################"
setupDocker
setupTerraform

echo
echo "######################################################################"
echo "# Installing desktop Apps"
echo "######################################################################"
setupSlack
setupChrome
setupDBeaver
setupSpotify
setupUnArchiver
setupPostman
setupVLC
setupPgAdmin
setupWhatsapp
setupWebex

echo
echo "######################################################################"
echo "# Environment Config"
echo "######################################################################"
setupOhMyZsh
setupEnvironmentVariables
setupSshKeys
setupTLDR
setupGitConfig

echo
echo "######################################################################"
echo "# Apps to Install Manually"
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

echo
echo "######################################################################"
echo "# CONGRATULATIONS SETUP FINISHED !!!"
echo "######################################################################"