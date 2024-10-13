#!/bin/bash
# courtesy: gpt

# Überprüfen, ob das Skript als root oder mit sudo ausgeführt wird
if [ "$EUID" -ne 0 ]; then
    echo "Bitte führen Sie dieses Skript als root oder mit sudo aus."
    exit 1
fi

# Schritt 1: Abhängigkeiten installieren
echo "Installiere Abhängigkeiten (curl, apt-transport-https)..."
apt-get update
apt-get install -y curl apt-transport-https

# Schritt 2: kubectl installieren
echo "Installiere kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/

# Überprüfen der kubectl-Installation
if ! command -v kubectl &> /dev/null; then
    echo "kubectl Installation fehlgeschlagen!"
    exit 1
else
    echo "kubectl erfolgreich installiert!"
fi

# Schritt 3: Minikube installieren
echo "Installiere Minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
mv minikube-linux-amd64 /usr/local/bin/minikube

# Überprüfen der Minikube-Installation
if ! command -v minikube &> /dev/null; then
    echo "Minikube Installation fehlgeschlagen!"
    exit 1
else
    echo "Minikube erfolgreich installiert!"
fi

# Schritt 4: Virtualisierungssoftware installieren (Docker)
echo "Installiere Docker als Virtualisierungssoftware..."
apt-get install -y docker.io

# Überprüfen der Docker-Installation
if ! command -v docker &> /dev/null; then
    echo "Docker Installation fehlgeschlagen!"
    exit 1
else
    echo "Docker erfolgreich installiert!"
fi

# Starten von Minikube
echo "Starte Minikube..."
minikube start --driver=docker

# Überprüfen, ob Minikube erfolgreich gestartet wurde
if [ $? -eq 0 ]; then
    echo "Minikube wurde erfolgreich gestartet!"
else
    echo "Minikube Start fehlgeschlagen. Überprüfe ob der Benutzer in 'docker' Gruppe hinzugefügt werden müssen. Wenn Ja, dann `sudo usermod -aG docker $USER && newgrp docker` Befehl laufen lassen."
    exit 1
fi

# Erfolgsmeldung
echo "Minikube und kubectl wurden erfolgreich installiert und Minikube läuft!"
