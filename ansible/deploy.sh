#!/bin/bash
set -e  # detiene el script si cualquier comando falla

echo "========================================"
echo " CASO PRACTICO 2 - Despliegue completo"
echo "========================================"

# Variables
ACR_NAME="acrcesargcp2"
ACR_SERVER="acrcesargcp2.azurecr.io"
IMAGE_NAME="app-web"
IMAGE_TAG="casopractico2"
ANSIBLE_DIR=~/caso-practico-2/ansible
APP_DIR=~/caso-practico-2/app-web

# PASO 1: Login al ACR
echo ""
echo "[1/4] Login al Azure Container Registry..."
az acr login --name $ACR_NAME

# PASO 2: Build de la imagen
echo ""
echo "[2/4] Construyendo imagen Docker/Podman..."
cd $APP_DIR
podman build -t $ACR_SERVER/$IMAGE_NAME:$IMAGE_TAG .

# PASO 3: Push al ACR
echo ""
echo "[3/4] Subiendo imagen al ACR..."
podman push $ACR_SERVER/$IMAGE_NAME:$IMAGE_TAG

# PASO 4: Ejecutar playbook Ansible
echo ""
echo "[4/4] Ejecutando playbook Ansible..."
cd $ANSIBLE_DIR
ansible-playbook -i hosts playbook_podman.yml --ask-vault-pass

echo ""
echo "========================================"
echo " Despliegue completado exitosamente"
echo "========================================"

# Muestra la IP de la VM para verificación
IP=$(az vm show -g rg-casopractico2 -n vm-casopractico2 \
  --show-details --query publicIps -o tsv)
echo " URL: https://$IP"
echo " Usuario: alumno"
echo " Password: unir2026"
echo "========================================"