#!/bin/bash

# Script final de déploiement - Utilise les credentials macOS
REPO_NAME="fbiconseil"
GITHUB_USER="melanieboisrodriguez-ctrl"

echo "🚀 Déploiement final pour fbiconseil.com"
echo ""

# Vérifier si le dépôt existe
echo "📋 Vérification du dépôt..."
if git ls-remote "https://github.com/${GITHUB_USER}/${REPO_NAME}.git" &>/dev/null; then
    echo "✅ Dépôt trouvé!"
else
    echo "⚠️  Le dépôt n'existe pas encore."
    echo ""
    echo "🌐 Ouverture de GitHub pour créer le dépôt..."
    open "https://github.com/new?name=${REPO_NAME}&description=Site%20web%20FBI%20Conseil"
    echo ""
    echo "📝 Créez le dépôt avec ces paramètres:"
    echo "   - Nom: ${REPO_NAME}"
    echo "   - Public"
    echo "   - Ne cochez PAS 'Add a README'"
    echo ""
    read -p "Appuyez sur Entrée une fois le dépôt créé..."
fi

echo ""
echo "📤 Publication du code..."

# Configurer le remote
git remote remove origin 2>/dev/null || true
git remote add origin "https://${GITHUB_USER}@github.com/${GITHUB_USER}/${REPO_NAME}.git"
git branch -M main

# Utiliser credential helper macOS
git config credential.helper osxkeychain

# Push avec gestion d'erreur
if git push -u origin main; then
    echo ""
    echo "✅ Code publié avec succès!"
    echo ""
    echo "📝 Activez GitHub Pages:"
    open "https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
    echo ""
    echo "   1. Source: Deploy from a branch"
    echo "   2. Branch: main, Folder: / (root)"
    echo "   3. Save"
    echo ""
    echo "🌐 Site: https://fbiconseil.com (après DNS)"
else
    echo ""
    echo "❌ Erreur lors du push."
    echo ""
    echo "💡 Solutions possibles:"
    echo "   1. Vérifiez que le dépôt existe: https://github.com/${GITHUB_USER}/${REPO_NAME}"
    echo "   2. Utilisez un Personal Access Token comme mot de passe"
    echo "      Créez-en un: https://github.com/settings/tokens"
    echo "   3. Ou utilisez SSH:"
    echo "      git remote set-url origin git@github.com:${GITHUB_USER}/${REPO_NAME}.git"
    echo "      git push -u origin main"
fi
