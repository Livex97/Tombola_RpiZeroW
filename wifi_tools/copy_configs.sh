#!/bin/bash

# Script per copiare i file di configurazione nelle rispettive cartelle
# Uso: sudo ./copy_configs.sh

echo "→ Copia dei file di configurazione nelle rispettive cartelle"

# Crea la directory per wpa_supplicant se non esiste
sudo mkdir -p /etc/wpa_supplicant

# Copia i file di configurazione
sudo cp wpa_supplicant-client.conf /etc/wpa_supplicant/wpa_supplicant-client.conf
sudo cp dhcpcd-ap.conf /etc/dhcpcd-ap.conf
sudo cp dhcpcd-client.conf /etc/dhcpcd-client.conf

echo "✔ File di configurazione copiati con successo in:"
echo "  - /etc/wpa_supplicant/wpa_supplicant-client.conf"
echo "  - /etc/dhcpcd-ap.conf"
echo "  - /etc/dhcpcd-client.conf"