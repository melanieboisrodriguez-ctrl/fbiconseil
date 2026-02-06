#!/bin/bash

# Script pour publier le site sur GitHub Pages
# Usage: ./publish.sh [nom-du-depot]

set -e

# Couleurs pour les messages
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Publication du site FBI Conseil sur GitHub Pages${NC}\n"

# Vérifier si un nom de dépôt a été fourni
if [ -z "$1" ]; then
    echo -e "${YELLOW}Nom du dépôt GitHub non fourni.${NC}"
    echo "Usage: ./publish.sh nom-du-depot"
    echo ""
    echo "Exemple: ./publish.sh fbiconseil"
    exit 1
fi

REPO_NAME=$1
GITHUB_USER="melanieboisrodriguez-ctrl"

echo -e "${BLUE}📦 Nom du dépôt: ${REPO_NAME}${NC}"
echo -e "${BLUE}👤 Utilisateur GitHub: ${GITHUB_USER}${NC}\n"

# Vérifier si le remote existe déjà
if git remote get-url origin &>/dev/null; then
    echo -e "${YELLOW}⚠️  Un remote 'origin' existe déjà.${NC}"
    read -p "Voulez-vous le remplacer? (o/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Oo]$ ]]; then
        git remote remove origin
    else
        echo "Annulé."
        exit 1
    fi
fi

# Ajouter le remote
echo -e "${BLUE}🔗 Configuration du remote GitHub...${NC}"
git remote add origin "https://github.com/${GITHUB_USER}/${REPO_NAME}.git" || {
    echo -e "${YELLOW}⚠️  Le remote existe déjà, mise à jour...${NC}"
    git remote set-url origin "https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
}

# S'assurer qu'on est sur la branche main
git branch -M main

# Pousser le code
echo -e "${BLUE}📤 Envoi du code sur GitHub...${NC}"
git push -u origin main || {
    echo -e "${YELLOW}❌ Erreur lors du push.${NC}"
    echo ""
    echo "Assurez-vous que:"
    echo "1. Le dépôt '${REPO_NAME}' existe sur GitHub.com"
    echo "2. Vous avez les permissions d'écriture"
    echo "3. Vous êtes authentifié (git credential ou SSH)"
    exit 1
}

echo ""
echo -e "${GREEN}✅ Code publié avec succès!${NC}\n"
echo -e "${BLUE}📝 Prochaines étapes:${NC}"
echo ""
echo "1. Allez sur: https://github.com/${GITHUB_USER}/${REPO_NAME}"
echo "2. Cliquez sur 'Settings' → 'Pages'"
echo "3. Sous 'Source', sélectionnez:"
echo "   - Branch: main"
echo "   - Folder: / (root)"
echo "4. Cliquez sur 'Save'"
echo ""
echo -e "${GREEN}🌐 Votre site sera disponible à:${NC}"
echo -e "${GREEN}   https://${GITHUB_USER}.github.io/${REPO_NAME}/${NC}\n"
