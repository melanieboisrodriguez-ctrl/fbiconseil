# 🌐 Activer le site sur GitHub Pages

## Objectif
Rendre le site visible sur: **https://melanieboisrodriguez-ctrl.github.io/fbiconseil/**

---

## ✅ Étape 1: Publier le code

Il reste 2 commits à publier sur GitHub.

### Option A: Script automatique

Dans le terminal de Cursor, exécutez:
```bash
./ACTIVER_SITE.sh
```

Le script vous guidera.

### Option B: Commande manuelle

Dans le terminal de Cursor:
```bash
git push -u origin main
```

**Quand Git demande vos identifiants:**
- **Username:** `melanieboisrodriguez-ctrl`
- **Password:** Utilisez votre **TOKEN GitHub** (pas votre mot de passe)

**Pour créer un token:**
1. https://github.com/settings/tokens
2. "Generate new token (classic)"
3. Cochez "repo"
4. Copiez le token (commence par `ghp_...`)
5. Utilisez-le comme mot de passe

---

## ✅ Étape 2: Vérifier GitHub Pages

1. Allez sur: https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages

2. Vérifiez que c'est configuré:
   - **Source:** Deploy from a branch
   - **Branch:** `main`
   - **Folder:** `/ (root)`

3. Si ce n'est pas configuré, configurez et cliquez sur **"Save"**

---

## ⏳ Étape 3: Attendre le déploiement

GitHub Pages met **1-2 minutes** à déployer votre site.

Après 1-2 minutes, testez:
**https://melanieboisrodriguez-ctrl.github.io/fbiconseil/**

---

## ✅ Vérification

Si le site fonctionne, vous verrez:
- Le titre "Vos opérations vous ralentissent?"
- La photo de Frédéric Bois
- Les sections de services
- Le formulaire de contact

---

## 🆘 Si le site ne fonctionne pas après 2 minutes

1. Vérifiez que le code est bien publié:
   - https://github.com/melanieboisrodriguez-ctrl/fbiconseil
   - Vous devriez voir `index.html`, `styles.css`, etc.

2. Vérifiez GitHub Pages:
   - https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages
   - Devrait afficher "Your site is live at..."

3. Attendez encore un peu (parfois ça prend 5 minutes)

---

## 🎉 C'est tout!

Une fois publié et déployé, votre site sera accessible à:
**https://melanieboisrodriguez-ctrl.github.io/fbiconseil/**

Pas besoin de configurer le DNS pour cette URL - elle fonctionne immédiatement! 🚀
