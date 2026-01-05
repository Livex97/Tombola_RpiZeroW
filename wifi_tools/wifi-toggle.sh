#!/bin/bash

# Script per il passaggio tra modalità AP e Client
# Uso: sudo ./wifi-toggle.sh [ap|client]

if [ "$1" == "ap" ]; then
    echo "→ Passaggio a ACCESS POINT"
    
    # Ferma i servizi client
    sudo systemctl stop wpa_supplicant 2>/dev/null
    
    # Copia la configurazione per la modalità AP
    sudo cp /etc/dhcpcd-ap.conf /etc/dhcpcd.conf
    
    # Riavvia dhcpcd
    sudo systemctl restart dhcpcd
    
    # Avvia i servizi AP
    sudo systemctl start dnsmasq
    sudo systemctl start hostapd
    
    echo "✔ Modalità ACCESS POINT attiva"
    
elif [ "$1" == "client" ]; then
    echo "→ Passaggio a Wi-Fi CLIENT"
    
    # Ferma i servizi AP
    sudo systemctl stop hostapd 2>/dev/null
    sudo systemctl stop dnsmasq 2>/dev/null
    
    # Copia la configurazione per la modalità client
    sudo cp /etc/dhcpcd-client.conf /etc/dhcpcd.conf
    sudo cp /etc/wpa_supplicant/wpa_supplicant-client.conf /etc/wpa_supplicant/wpa_supplicant.conf
    
    # Riavvia i servizi
    sudo systemctl restart dhcpcd
    sudo systemctl restart wpa_supplicant
    
    echo "✔ Modalità CLIENT attiva"
else
    echo "❌ Uso: sudo ./wifi-toggle.sh [ap|client]"
    exit 1
fi