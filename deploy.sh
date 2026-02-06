#!/bin/bash

# Script de déploiement simplifié
# Ouvre GitHub et guide l'utilisateur, puis publie automatiquement

REPO_NAME="fbiconseil"
GITHUB_USER="melanieboisrodriguez-ctrl"

echo "🚀 Déploiement du site FBI Conseil"
echo ""
echo "📦 Nom du dépôt: $REPO_NAME"
echo "👤 Utilisateur: $GITHUB_USER"
echo ""
echo "🌐 Ouverture de GitHub dans votre navigateur..."
echo ""

# Ouvrir la page de création de dépôt
open "https://github.com/new?name=${REPO_NAME}&description=Site%20web%20professionnel%20-%20Frédéric%20Bois%2C%20Consultant%20en%20Opérations"

echo "📝 Instructions:"
echo "   1. Le dépôt est pré-rempli avec le nom: $REPO_NAME"
echo "   2. Assurez-vous que 'Public' est sélectionné"
echo "   3. NE cochez PAS 'Add a README file'"
echo "   4. Cliquez sur 'Create repository'"
echo ""
read -p "Appuyez sur Entrée une fois le dépôt créé sur GitHub..."

echo ""
echo "⏳ Attente de la création du dépôt..."
sleep 3
echo ""
echo "📤 Publication du code sur GitHub..."

# Configurer et pousser avec credentials macOS
git remote remove origin 2>/dev/null || true
git remote add origin "https://${GITHUB_USER}@github.com/${GITHUB_USER}/${REPO_NAME}.git"
git branch -M main

# Essayer de pousser (les credentials seront demandés via macOS keychain si nécessaire)
echo "🔐 Si demandé, entrez vos identifiants GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Code publié avec succès!"
    echo ""
    echo "📝 Dernière étape - Activer GitHub Pages:"
    echo ""
    echo "   Ouvrant la page de configuration..."
    open "https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
    echo ""
    echo "   Dans la page qui s'ouvre:"
    echo "   1. Sous 'Source', sélectionnez:"
    echo "      - Branch: main"
    echo "      - Folder: / (root)"
    echo "   2. Cliquez sur 'Save'"
    echo ""
    echo "🌐 Votre site sera disponible à:"
    echo "   https://${GITHUB_USER}.github.io/${REPO_NAME}/"
    echo ""
else
    echo ""
    echo "❌ Erreur lors de la publication."
    echo "Vérifiez que le dépôt existe bien sur GitHub."
fi
