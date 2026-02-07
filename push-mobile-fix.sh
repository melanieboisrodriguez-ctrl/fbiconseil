#!/bin/bash

echo "🔄 Poussée des modifications mobile vers GitHub..."
echo ""

# Afficher les commits à pousser
echo "📋 Commits à pousser:"
git log origin/main..HEAD --oneline 2>/dev/null || git log --oneline -3

echo ""
echo "🚀 Poussée vers GitHub..."
echo ""
echo "⚠️  IMPORTANT: Vous devrez entrer vos identifiants:"
echo "   Username: melanieboisrodriguez-ctrl"
echo "   Password: Votre Personal Access Token (PAT)"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Push réussi!"
    echo ""
    echo "⏳ GitHub Pages se mettra à jour dans 1-2 minutes."
    echo "🌐 Vérifiez votre site mobile:"
    echo "   https://melanieboisrodriguez-ctrl.github.io/fbiconseil/"
    echo ""
    echo "💡 Pour voir les changements mobile:"
    echo "   1. Ouvrez les outils de développement (F12)"
    echo "   2. Activez le mode responsive (Cmd+Shift+M)"
    echo "   3. Sélectionnez un appareil mobile (iPhone, etc.)"
    echo "   4. Videz le cache (Cmd+Shift+R)"
else
    echo ""
    echo "❌ Le push a échoué."
    echo "💡 Essayez manuellement: git push -u origin main"
fi
