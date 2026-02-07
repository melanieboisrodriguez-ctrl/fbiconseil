#!/bin/bash

echo "🔄 Synchronisation complète avec GitHub..."
echo ""

# Ajouter tous les fichiers modifiés
echo "📦 Ajout de tous les fichiers..."
git add -A

# Créer un commit si nécessaire
if ! git diff --staged --quiet; then
    echo "📝 Création d'un commit avec toutes les modifications..."
    git commit -m "Synchronisation: Logo7, styles mobile optimisés, photo wrapper"
fi

# Afficher les commits locaux non poussés
echo ""
echo "📋 Commits locaux à pousser:"
git log origin/main..HEAD --oneline 2>/dev/null || git log --oneline -5

echo ""
echo "🚀 Poussée vers GitHub..."
echo ""
echo "⚠️  IMPORTANT: Vous devrez entrer vos identifiants:"
echo "   Username: melanieboisrodriguez-ctrl"
echo "   Password: Votre Personal Access Token (PAT)"
echo "   (Créez-en un ici si besoin: https://github.com/settings/tokens)"
echo ""

# Tenter le push
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Push réussi!"
    echo ""
    echo "⏳ GitHub Pages se mettra à jour dans 1-2 minutes."
    echo "🌐 Vérifiez votre site:"
    echo "   https://melanieboisrodriguez-ctrl.github.io/fbiconseil/"
    echo ""
    echo "💡 Si le site ne se met pas à jour immédiatement:"
    echo "   1. Attendez 2-3 minutes (délai de propagation)"
    echo "   2. Videz le cache de votre navigateur (Cmd+Shift+R sur Mac)"
    echo "   3. Vérifiez les paramètres GitHub Pages:"
    echo "      https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages"
else
    echo ""
    echo "❌ Le push a échoué."
    echo ""
    echo "💡 Solutions possibles:"
    echo "   1. Vérifiez votre connexion internet"
    echo "   2. Assurez-vous d'avoir un Personal Access Token valide"
    echo "   3. Essayez manuellement: git push -u origin main"
fi
