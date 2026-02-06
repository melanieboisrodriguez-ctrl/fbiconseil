#!/bin/bash

# Script complet pour créer le dépôt GitHub et publier le site
# Ce script utilise l'API GitHub directement

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

REPO_NAME="${1:-fbiconseil}"
GITHUB_USER="melanieboisrodriguez-ctrl"
DESCRIPTION="Site web professionnel - Frédéric Bois, Consultant en Opérations"

echo -e "${BLUE}🚀 Création et publication automatique sur GitHub Pages${NC}\n"
echo -e "${BLUE}📦 Dépôt: ${REPO_NAME}${NC}"
echo -e "${BLUE}👤 Utilisateur: ${GITHUB_USER}${NC}\n"

# Vérifier si un token GitHub est disponible
GITHUB_TOKEN="${GITHUB_TOKEN:-}"

if [ -z "$GITHUB_TOKEN" ]; then
    echo -e "${YELLOW}⚠️  Token GitHub non trouvé dans les variables d'environnement.${NC}"
    echo ""
    echo "Pour créer le dépôt automatiquement, vous avez deux options:"
    echo ""
    echo "Option 1 - Avec token GitHub (recommandé):"
    echo "  1. Créez un token sur: https://github.com/settings/tokens"
    echo "  2. Donnez-lui la permission 'repo'"
    echo "  3. Exécutez: export GITHUB_TOKEN=votre_token"
    echo "  4. Relancez ce script"
    echo ""
    echo "Option 2 - Création manuelle:"
    echo "  1. Allez sur https://github.com/new"
    echo "  2. Créez un dépôt nommé: ${REPO_NAME}"
    echo "  3. Ne cochez PAS 'Initialize with README'"
    echo "  4. Exécutez ensuite: ./publish.sh ${REPO_NAME}"
    echo ""
    read -p "Voulez-vous continuer avec la création manuelle? (o/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Oo]$ ]]; then
        echo "Annulé."
        exit 0
    fi
    echo ""
    echo -e "${BLUE}📝 Instructions pour la création manuelle:${NC}"
    echo "1. Créez le dépôt sur: https://github.com/new"
    echo "2. Nom: ${REPO_NAME}"
    echo "3. Visibilité: Public (pour GitHub Pages gratuit)"
    echo "4. Ne cochez PAS 'Add a README file'"
    echo "5. Cliquez sur 'Create repository'"
    echo ""
    read -p "Appuyez sur Entrée une fois le dépôt créé..."
    
    # Continuer avec la publication
    echo ""
    echo -e "${BLUE}📤 Publication du code...${NC}"
    git remote remove origin 2>/dev/null || true
    git remote add origin "https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
    git branch -M main
    git push -u origin main
    
    echo ""
    echo -e "${GREEN}✅ Code publié!${NC}"
    echo ""
    echo -e "${BLUE}📝 Activez GitHub Pages:${NC}"
    echo "1. https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
    echo "2. Source: Deploy from a branch"
    echo "3. Branch: main, Folder: / (root)"
    echo "4. Save"
    echo ""
    echo -e "${GREEN}🌐 Site: https://${GITHUB_USER}.github.io/${REPO_NAME}/${NC}"
    exit 0
fi

# Créer le dépôt via l'API GitHub
echo -e "${BLUE}📦 Création du dépôt via l'API GitHub...${NC}"

RESPONSE=$(curl -s -w "\n%{http_code}" -X POST \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/user/repos \
  -d "{\"name\":\"${REPO_NAME}\",\"description\":\"${DESCRIPTION}\",\"public\":true}")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" = "201" ]; then
    echo -e "${GREEN}✅ Dépôt créé avec succès!${NC}"
elif [ "$HTTP_CODE" = "422" ]; then
    echo -e "${YELLOW}⚠️  Le dépôt existe déjà.${NC}"
    read -p "Voulez-vous continuer avec la publication? (o/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Oo]$ ]]; then
        exit 1
    fi
else
    echo -e "${RED}❌ Erreur lors de la création: HTTP ${HTTP_CODE}${NC}"
    echo "$BODY"
    exit 1
fi

# Publier le code
echo ""
echo -e "${BLUE}📤 Publication du code...${NC}"
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
git branch -M main
git push -u origin main

echo ""
echo -e "${GREEN}✅ Publication terminée!${NC}"
echo ""
echo -e "${BLUE}📝 Activez GitHub Pages:${NC}"
echo "1. https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
echo "2. Source: Deploy from a branch"
echo "3. Branch: main, Folder: / (root)"
echo "4. Save"
echo ""
echo -e "${GREEN}🌐 Votre site sera disponible à:${NC}"
echo -e "${GREEN}   https://${GITHUB_USER}.github.io/${REPO_NAME}/${NC}"
