#!/bin/bash

echo "=========================================="
echo "🚀 PUSH FORCÉ - Styles Mobile"
echo "=========================================="
echo ""

# Vérifier l'état
echo "📋 État actuel:"
git status --short
echo ""

# Afficher les commits à pousser
echo "📦 Commits locaux à pousser:"
git log origin/main..HEAD --oneline 2>/dev/null
if [ $? -ne 0 ]; then
    echo "   (Tous les commits semblent déjà poussés)"
    echo "   Mais on va forcer le push quand même..."
fi
echo ""

# Afficher le dernier commit
echo "📝 Dernier commit:"
git log -1 --oneline
echo ""

echo "⚠️  ATTENTION: Vous devez pousser manuellement!"
echo ""
echo "Exécutez cette commande:"
echo "   git push -u origin main"
echo ""
echo "Quand Git demande:"
echo "   Username: melanieboisrodriguez-ctrl"
echo "   Password: Votre Personal Access Token (PAT)"
echo ""
echo "=========================================="
echo "💡 Si le push échoue, essayez:"
echo "   git push -f origin main"
echo "   (⚠️  Attention: force push peut écraser des commits)"
echo "=========================================="
