#!/bin/bash

set -e

log() {
  echo ""
  echo ">>> $1"
  echo "---------------------------------------------"
}

# 1. Homebrew
log "Instalando Homebrew (si no está instalado)..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

log "Agregando Homebrew al PATH para Zsh..."
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# 2. Herramientas básicas con Homebrew
log "Instalando Git..."
brew install git

log "Instalando HTTPie..."
brew install httpie

log "Instalando Google Chrome..."
brew install --cask google-chrome

log "Instalando iTerm2..."
brew install --cask iterm2

log "Instalando Visual Studio Code..."
brew install --cask visual-studio-code

log "Instalando Filezilla..."
brew install --cask filezilla

log "¿Qué versión de IntelliJ IDEA querés instalar?"
echo "1) Community (gratis)"
echo "2) Ultimate (requiere licencia)"
read -p "Elegí 1 o 2 [1]: " intellij_choice
intellij_choice=${intellij_choice:-1}

if [ "$intellij_choice" = "2" ]; then
  log "Instalando IntelliJ IDEA Ultimate..."
  brew install --cask intellij-idea
else
  log "Instalando IntelliJ IDEA Community..."
  brew install --cask intellij-idea-ce
fi

log "Instalando Postman..."
brew install --cask postman

log "Instalando DBeaver..."
brew install --cask dbeaver-community

log "Instalando Docker Desktop..."
brew install --cask docker

# 3. SDKMAN
log "Instalando SDKMAN!..."
curl -s "https://get.sdkman.io" | bash

log "Agregando SDKMAN a tu .zshrc..."
echo 'source "$HOME/.sdkman/bin/sdkman-init.sh"' >> ~/.zshrc
source "$HOME/.sdkman/bin/sdkman-init.sh"

# 4. JDKs y herramientas Java
log "Instalando Java 21 (Temurin)..."
sdk install java 21.0.2-tem

log "Instalando Java 17 (Temurin)..."
sdk install java 17.0.10-tem

log "Instalando Java 8 (Zulu)..."
sdk install java 8.0.392-zulu

log "Instalando Maven..."
sdk install maven

log "Instalando Gradle..."
sdk install gradle

log "Instalando Spring Boot CLI..."
sdk install springboot

# 5. Establecer versiones por defecto
log "Configurando Java 21 como versión por defecto..."
sdk default java 21.0.2-tem

# 6. Instalar Oh My Zsh
log "Instalando Oh My Zsh..."
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 7. Configurar Zsh con tema y plugins
log "Configurando tema 'agnoster' y plugins útiles..."
sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc
sed -i '' 's/^plugins=.*/plugins=(git docker vscode z)/' ~/.zshrc

# 8. Instalar plugins extra para Zsh
log "Instalando plugins: zsh-autosuggestions y zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Agregar los plugins al .zshrc si no están ya
sed -i '' 's/^plugins=(\(.*\))/plugins=(\1 zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# 9. Fuente recomendada para agnoster
log "Instalando fuente MesloLGS Nerd Font (para agnoster)..."
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

# 10. Colores y autocompletado Git
log "Habilitando colores en Git y autocompletado..."
git config --global color.ui auto
echo "source /usr/local/share/git/completion/git-completion.zsh" >> ~/.zshrc || true

# Final
log "Configuración completa. Reinicia la terminal o ejecuta:"
echo "  source ~/.zshrc"
echo "  Y en iTerm2, cambia la fuente a 'MesloLGS NF' en Preferences > Profiles > Text"
