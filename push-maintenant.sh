#!/bin/bash

echo "🚀 Publication des modifications sur GitHub..."
echo ""
echo "📝 Les modifications suivantes seront publiées:"
git log origin/main..HEAD --oneline
echo ""
echo "🔐 Vous allez être demandé vos identifiants GitHub:"
echo "   - Username: melanieboisrodriguez-ctrl"
echo "   - Password: Votre Personal Access Token (PAS votre mot de passe)"
echo ""
echo "💡 Si vous n'avez pas de token, créez-en un ici:"
echo "   https://github.com/settings/tokens"
echo "   (Permissions nécessaires: 'repo')"
echo ""
read -p "Appuyez sur Entrée pour continuer..."

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ ✅ ✅ Succès! Modifications publiées sur GitHub! ✅ ✅ ✅"
    echo ""
    echo "⏳ Attendez 1-2 minutes pour que GitHub Pages déploie le site"
    echo "🌐 Votre site sera mis à jour à:"
    echo "   https://melanieboisrodriguez-ctrl.github.io/fbiconseil/"
    echo ""
    echo "💡 N'oubliez pas de vider le cache de votre navigateur (Cmd+Shift+R)"
else
    echo ""
    echo "❌ Erreur lors de la publication."
    echo ""
    echo "Vérifiez:"
    echo "  - Que vous avez utilisé votre TOKEN GitHub comme mot de passe"
    echo "  - Que le token a la permission 'repo'"
    echo ""
    echo "Pour créer un token: https://github.com/settings/tokens"
fi
