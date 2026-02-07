#!/bin/bash

# Script pour forcer le push vers GitHub
echo "🔍 Vérification de l'état Git..."
git status

echo ""
echo "📦 Préparation du push..."
git add -A

# Vérifier s'il y a des changements
if git diff --staged --quiet; then
    echo "✅ Aucun changement à committer. Les fichiers sont déjà à jour."
else
    echo "📝 Création d'un nouveau commit..."
    git commit -m "Mise à jour: synchronisation avec version locale"
fi

echo ""
echo "🚀 Poussée vers GitHub..."
echo "⚠️  Vous devrez entrer vos identifiants GitHub:"
echo "   - Username: melanieboisrodriguez-ctrl"
echo "   - Password: Votre Personal Access Token (PAT)"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Push réussi!"
    echo "⏳ GitHub Pages peut prendre 1-2 minutes pour se mettre à jour."
    echo "🌐 Vérifiez votre site dans quelques instants:"
    echo "   https://melanieboisrodriguez-ctrl.github.io/fbiconseil/"
else
    echo ""
    echo "❌ Le push a échoué."
    echo "💡 Assurez-vous d'avoir un Personal Access Token valide."
    echo "   Créez-en un ici: https://github.com/settings/tokens"
fi
