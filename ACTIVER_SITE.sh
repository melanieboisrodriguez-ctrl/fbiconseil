#!/bin/bash

# Script simple pour activer le site sur GitHub Pages

echo "🌐 Activation du site sur GitHub Pages"
echo ""

echo "📤 Publication des derniers fichiers..."
echo ""
echo "⚠️  Git va demander vos identifiants:"
echo "   Username: melanieboisrodriguez-ctrl"
echo "   Password: [Votre TOKEN GitHub]"
echo ""
echo "Si vous n'avez pas de token:"
echo "   1. https://github.com/settings/tokens"
echo "   2. Generate new token (classic)"
echo "   3. Cochez 'repo'"
echo "   4. Copiez le token et utilisez-le comme mot de passe"
echo ""
read -p "Appuyez sur Entrée pour continuer..."

# Publier
if git push -u origin main; then
    echo ""
    echo "✅ Code publié!"
    echo ""
    echo "⏳ Attendez 1-2 minutes pour le déploiement..."
    echo ""
    echo "🌐 Votre site sera disponible à:"
    echo "   https://melanieboisrodriguez-ctrl.github.io/fbiconseil/"
    echo ""
    echo "📝 Vérifiez le statut:"
    open "https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages"
    echo ""
    echo "Dans la page qui s'ouvre, vérifiez que:"
    echo "   ✅ Source: Deploy from a branch"
    echo "   ✅ Branch: main"
    echo "   ✅ Folder: / (root)"
    echo ""
    echo "Si ce n'est pas configuré, configurez et cliquez sur 'Save'"
    echo ""
    echo "🎉 Dans 1-2 minutes, votre site sera en ligne!"
else
    echo ""
    echo "❌ Erreur. Vérifiez vos identifiants et réessayez."
fi
