#!/bin/bash

# Script final pour publier tout et vérifier

echo "🚀 Publication complète du site fbiconseil.com"
echo ""

# Ajouter tous les fichiers
echo "📦 Ajout de tous les fichiers..."
git add -A

# Vérifier s'il y a des changements
if git diff --staged --quiet && [ -z "$(git status -s)" ]; then
    echo "ℹ️  Aucun changement à commiter."
    echo ""
    echo "Vérification de l'état..."
    git status
else
    echo "💾 Création du commit..."
    git commit -m "Mise à jour complète du site"
fi

echo ""
echo "📤 Publication sur GitHub..."
echo ""
echo "⚠️  Git va demander vos identifiants:"
echo "   Username: melanieboisrodriguez-ctrl"
echo "   Password: [Utilisez votre TOKEN GitHub]"
echo ""
echo "Pour créer un token: https://github.com/settings/tokens"
echo "   → Generate new token (classic)"
echo "   → Cochez 'repo'"
echo ""
read -p "Appuyez sur Entrée pour continuer..."

if git push -u origin main; then
    echo ""
    echo "✅ ✅ ✅ CODE PUBLIÉ AVEC SUCCÈS! ✅ ✅ ✅"
    echo ""
    echo "⏳ Attendez 1-2 minutes pour le déploiement GitHub Pages..."
    echo ""
    echo "🌐 Votre site sera disponible à:"
    echo "   https://melanieboisrodriguez-ctrl.github.io/fbiconseil/"
    echo ""
    echo "📝 Vérifiez le statut:"
    echo "   https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages"
    echo ""
    echo "🔧 Prochaine étape: Configuration DNS"
    echo "   Voir: CONFIGURATION_DNS_COMPLETE.md"
    echo ""
    open "https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages"
else
    echo ""
    echo "❌ Erreur lors de la publication."
    echo ""
    echo "Vérifiez:"
    echo "  - Que vous avez utilisé le TOKEN (pas votre mot de passe)"
    echo "  - Que le token a la permission 'repo'"
    echo ""
    echo "Réessayez avec: ./PUBLIER_TOUT.sh"
fi
