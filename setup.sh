#!/bin/bash

echo "Updating system..."
sudo apt update
sudo apt upgrade -y

echo "Installing Java 8..."
sudo apt install openjdk-8-jdk -y

echo "Checking Java version..."
java -version

echo "Downloading TRON Full Node..."
wget https://github.com/tronprotocol/java-tron/releases/latest/download/FullNode.jar

echo "Downloading mainnet config..."
wget https://raw.githubusercontent.com/tronprotocol/tron-deployment/master/main_net_config.conf

echo "Opening port 8090..."
sudo ufw allow 8090

echo "Setup complete."