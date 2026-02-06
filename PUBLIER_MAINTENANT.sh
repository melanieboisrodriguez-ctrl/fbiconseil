#!/bin/bash

echo "🚀 Publication de votre site sur GitHub..."
echo ""
echo "Le code va être envoyé sur GitHub."
echo "Git va vous demander vos identifiants:"
echo ""
echo "  👤 Username: melanieboisrodriguez-ctrl"
echo "  🔑 Password: [Utilisez votre TOKEN GitHub, pas votre mot de passe]"
echo ""
echo "Si vous n'avez pas encore de token:"
echo "  1. Allez sur: https://github.com/settings/tokens"
echo "  2. Cliquez sur 'Generate new token (classic)'"
echo "  3. Cochez 'repo'"
echo "  4. Copiez le token et utilisez-le comme mot de passe"
echo ""
echo "Appuyez sur Entrée pour commencer..."
read

echo ""
echo "📤 Envoi du code sur GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ ✅ ✅ SUCCÈS! Votre code est maintenant sur GitHub! ✅ ✅ ✅"
    echo ""
    echo "Vous pouvez voir votre projet ici:"
    echo "https://github.com/melanieboisrodriguez-ctrl/fbiconseil"
    echo ""
    echo "📝 Prochaine étape: Activer GitHub Pages"
    echo "   Ouvrant la page de configuration..."
    sleep 2
    open "https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages"
    echo ""
    echo "   Dans la page qui s'ouvre:"
    echo "   1. Sous 'Source', sélectionnez:"
    echo "      ✅ Deploy from a branch"
    echo "      ✅ Branch: main"
    echo "      ✅ Folder: / (root)"
    echo "   2. Cliquez sur 'Save'"
    echo ""
    echo "🌐 Après activation, votre site sera disponible à:"
    echo "   https://fbiconseil.com (après configuration DNS)"
else
    echo ""
    echo "❌ Erreur lors de la publication."
    echo ""
    echo "Vérifiez:"
    echo "  - Que vous avez utilisé le TOKEN (pas votre mot de passe)"
    echo "  - Que le token a la permission 'repo'"
    echo ""
    echo "Réessayez avec: ./PUBLIER_MAINTENANT.sh"
fi
