#!/bin/bash

# Funzione per aggiornare e aggiornare i pacchetti
update_system() {
  echo "Aggiornamento del sistema..."
  sudo apt-get update -y && sudo apt-get upgrade -y
}

# Funzione per controllare se un pacchetto è già installato
check_install() {
  PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $1 | grep "install ok installed")
  if [ "" = "$PKG_OK" ]; then
    echo "$1 non è installato. Installazione in corso..."
    sudo apt-get install $1 -y
  else
    echo "$1 è già installato."
  fi
}

# Funzione per installare Vim
install_vim() {
  echo "Controllo se Vim è installato..."
  check_install vim
}

# Funzione per installare Git
install_git() {
  echo "Controllo se Git è installato..."
  check_install git
}

# Funzione per installare Docker
install_docker() {
  echo "Installazione di Docker..."
  
  # Rimuovere eventuali versioni precedenti
  sudo apt-get remove docker docker-engine docker.io containerd runc -y
  
  sudo apt-get update -y
  sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  
  echo "Aggiunta del repository Docker..."
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update -y
  sudo apt-get install docker-ce docker-ce-cli containerd.io -y

  # Aggiungere l'utente corrente al gruppo docker
  sudo usermod -aG docker $USER
  echo "Docker è stato installato. E' necessario fare logout e login per usare Docker senza sudo."
}

# Eseguire le funzioni
update_system
install_vim
install_git
install_docker

echo "Installazione completata. Ricordati di fare logout e login per usare Docker senza sudo."

