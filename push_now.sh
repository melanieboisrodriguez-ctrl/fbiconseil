#!/bin/bash

# Script pour publier le code maintenant
echo "📤 Publication du code sur GitHub..."
echo ""
echo "Si Git vous demande vos identifiants:"
echo "  - Username: melanieboisrodriguez-ctrl"
echo "  - Password: Utilisez un Personal Access Token (PAS votre mot de passe GitHub)"
echo ""
echo "Pour créer un token: https://github.com/settings/tokens"
echo "  → Generate new token (classic)"
echo "  → Cochez 'repo'"
echo "  → Copiez le token et utilisez-le comme mot de passe"
echo ""
echo "Appuyez sur Entrée pour continuer..."
read

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Code publié avec succès!"
    echo ""
    echo "📝 Prochaine étape: Activer GitHub Pages"
    echo "   Ouvrant la page de configuration..."
    open "https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages"
    echo ""
    echo "   Dans la page qui s'ouvre:"
    echo "   1. Sous 'Source', sélectionnez:"
    echo "      - Deploy from a branch"
    echo "      - Branch: main"
    echo "      - Folder: / (root)"
    echo "   2. Cliquez sur 'Save'"
    echo ""
    echo "🌐 Votre site sera disponible à:"
    echo "   https://fbiconseil.com (après configuration DNS)"
else
    echo ""
    echo "❌ Erreur lors de la publication."
    echo "Vérifiez vos identifiants et réessayez."
fi
