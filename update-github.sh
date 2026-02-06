#!/bin/bash

# Script pour mettre à jour GitHub facilement
# Usage: ./update-github.sh "Message de commit"

COMMIT_MESSAGE="${1:-Mise à jour du site}"

echo "🔄 Mise à jour du site sur GitHub..."
echo "📝 Message: $COMMIT_MESSAGE"
echo ""

# Ajouter tous les fichiers modifiés
echo "📦 Ajout des fichiers..."
git add -A

# Vérifier s'il y a des changements
if git diff --staged --quiet; then
    echo "ℹ️  Aucun changement à commiter."
else
    # Faire le commit
    echo "💾 Création du commit..."
    git commit -m "$COMMIT_MESSAGE"
    
    # Publier sur GitHub
    echo ""
    echo "📤 Publication sur GitHub..."
    echo "   (Git va peut-être demander vos identifiants)"
    echo ""
    
    if git push -u origin main; then
        echo ""
        echo "✅ ✅ ✅ Succès! Site mis à jour sur GitHub! ✅ ✅ ✅"
        echo ""
        echo "Votre site est maintenant à jour:"
        echo "https://github.com/melanieboisrodriguez-ctrl/fbiconseil"
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
fi
