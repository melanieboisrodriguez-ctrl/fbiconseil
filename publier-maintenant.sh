#!/bin/bash

# Script de publication avec instructions claires
REPO_NAME="fbiconseil"
GITHUB_USER="melanieboisrodriguez-ctrl"

echo "🚀 Publication du site fbiconseil.com sur GitHub"
echo ""
echo "✅ Le domaine fbiconseil.com est configuré (fichier CNAME)"
echo "✅ Tous les fichiers sont prêts"
echo ""
echo "📤 Tentative de publication..."

# Configurer credential helper
git config credential.helper osxkeychain 2>/dev/null || true

# Essayer le push
if git push -u origin main 2>&1; then
    echo ""
    echo "✅ ✅ ✅ SUCCÈS! Code publié sur GitHub! ✅ ✅ ✅"
    echo ""
    echo "🌐 Votre dépôt: https://github.com/${GITHUB_USER}/${REPO_NAME}"
    echo ""
    echo "📝 Prochaine étape: Activer GitHub Pages"
    open "https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
    echo ""
    echo "Dans la page qui s'ouvre:"
    echo "  1. Source: Deploy from a branch"
    echo "  2. Branch: main, Folder: / (root)"
    echo "  3. Cliquez sur 'Save'"
    echo ""
    echo "🌐 Après activation, votre site sera sur:"
    echo "   https://fbiconseil.com (après configuration DNS)"
else
    echo ""
    echo "⚠️  Git demande vos identifiants."
    echo ""
    echo "📋 INSTRUCTIONS:"
    echo ""
    echo "1. Ouvrez le Terminal dans Cursor (View → Terminal)"
    echo ""
    echo "2. Exécutez cette commande:"
    echo "   git push -u origin main"
    echo ""
    echo "3. Quand Git demande vos identifiants:"
    echo "   Username: ${GITHUB_USER}"
    echo "   Password: [Utilisez votre TOKEN GitHub]"
    echo ""
    echo "4. Pour créer un token si vous n'en avez pas:"
    echo "   https://github.com/settings/tokens"
    echo "   → Generate new token (classic)"
    echo "   → Cochez 'repo'"
    echo "   → Copiez le token et utilisez-le comme mot de passe"
    echo ""
    echo "🌐 Ou ouvrez directement votre dépôt:"
    open "https://github.com/${GITHUB_USER}/${REPO_NAME}"
    echo ""
    echo "Une fois le code publié, activez GitHub Pages dans Settings → Pages"
fi
