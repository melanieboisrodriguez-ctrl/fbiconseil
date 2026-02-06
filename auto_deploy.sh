#!/bin/bash

# Script de déploiement automatique complet
set -e

REPO_NAME="fbiconseil"
GITHUB_USER="melanieboisrodriguez-ctrl"
REPO_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🚀 Déploiement automatique pour fbiconseil.com${NC}\n"

# Vérifier si le dépôt existe déjà
echo -e "${BLUE}🔍 Vérification si le dépôt existe...${NC}"
if curl -s -o /dev/null -w "%{http_code}" "https://github.com/${GITHUB_USER}/${REPO_NAME}" | grep -q "200"; then
    echo -e "${GREEN}✅ Le dépôt existe déjà!${NC}\n"
    DEPOT_EXISTE=true
else
    echo -e "${YELLOW}⚠️  Le dépôt n'existe pas encore.${NC}\n"
    DEPOT_EXISTE=false
    
    # Ouvrir GitHub pour créer le dépôt
    echo -e "${BLUE}🌐 Ouverture de GitHub dans votre navigateur...${NC}"
    open "https://github.com/new?name=${REPO_NAME}&description=Site%20web%20professionnel%20-%20Frédéric%20Bois%2C%20Consultant%20en%20Opérations"
    
    echo ""
    echo -e "${YELLOW}📝 Instructions:${NC}"
    echo "   1. Le nom du dépôt est pré-rempli: ${REPO_NAME}"
    echo "   2. Assurez-vous que 'Public' est sélectionné"
    echo "   3. NE cochez PAS 'Add a README file'"
    echo "   4. Cliquez sur 'Create repository'"
    echo ""
    echo -e "${BLUE}⏳ Attente de la création du dépôt...${NC}"
    echo "   (Vérification toutes les 5 secondes...)"
    
    # Attendre que le dépôt soit créé
    ATTEMPTS=0
    MAX_ATTEMPTS=60  # 5 minutes max
    
    while [ $ATTEMPTS -lt $MAX_ATTEMPTS ]; do
        sleep 5
        if curl -s -o /dev/null -w "%{http_code}" "https://github.com/${GITHUB_USER}/${REPO_NAME}" | grep -q "200"; then
            echo -e "\n${GREEN}✅ Dépôt créé détecté!${NC}\n"
            DEPOT_EXISTE=true
            break
        fi
        ATTEMPTS=$((ATTEMPTS + 1))
        echo -n "."
    done
    
    if [ "$DEPOT_EXISTE" = false ]; then
        echo -e "\n${YELLOW}⏱️  Timeout. Le dépôt n'a pas été détecté.${NC}"
        echo "Continuez quand même avec la publication? (o/n)"
        read -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Oo]$ ]]; then
            exit 1
        fi
    fi
fi

# Configurer le remote
echo -e "${BLUE}🔗 Configuration du remote GitHub...${NC}"
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/${GITHUB_USER}/${REPO_NAME}.git" 2>/dev/null || git remote set-url origin "https://github.com/${GITHUB_USER}/${REPO_NAME}.git"

# S'assurer qu'on est sur main
git branch -M main 2>/dev/null || true

# Publier le code
echo -e "${BLUE}📤 Publication du code sur GitHub...${NC}"
echo ""

# Essayer avec les credentials macOS
if git push -u origin main 2>&1; then
    echo ""
    echo -e "${GREEN}✅ Code publié avec succès!${NC}\n"
else
    echo ""
    echo -e "${YELLOW}⚠️  Push échoué. Tentative avec authentification...${NC}"
    echo ""
    echo "Si vous êtes invité à entrer vos identifiants:"
    echo "  - Utilisateur: ${GITHUB_USER}"
    echo "  - Mot de passe: Utilisez un Personal Access Token (pas votre mot de passe)"
    echo ""
    echo "Pour créer un token: https://github.com/settings/tokens"
    echo ""
    read -p "Appuyez sur Entrée pour réessayer le push..."
    git push -u origin main
fi

# Ouvrir la page de configuration GitHub Pages
echo ""
echo -e "${BLUE}📝 Configuration de GitHub Pages...${NC}"
echo ""
open "https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"

echo -e "${YELLOW}📋 Dernière étape manuelle:${NC}"
echo "   1. Dans la page qui s'est ouverte, sous 'Source':"
echo "      - Sélectionnez: Deploy from a branch"
echo "      - Branch: main"
echo "      - Folder: / (root)"
echo "   2. Cliquez sur 'Save'"
echo ""
echo -e "${GREEN}🌐 Votre site sera disponible à:${NC}"
echo -e "${GREEN}   https://fbiconseil.com${NC}"
echo -e "${GREEN}   (après configuration DNS)${NC}"
echo ""
echo -e "${BLUE}📝 Configuration DNS requise:${NC}"
echo "   Ajoutez 4 enregistrements A pointant vers:"
echo "   185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153"
echo "   Et un CNAME pour www: melanieboisrodriguez-ctrl.github.io"
echo ""
