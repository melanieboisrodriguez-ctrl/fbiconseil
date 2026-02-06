# 🚀 Publier fbiconseil.com en 2 étapes simples

## ✅ Tout est prêt!
- ✅ Site web complet créé
- ✅ Domaine fbiconseil.com configuré (fichier CNAME)
- ✅ Code commité localement
- ⏳ Il ne reste qu'à publier sur GitHub

---

## 📤 ÉTAPE 1: Publier le code

### Option A: Terminal de Cursor (2 minutes)

1. **Ouvrez le terminal dans Cursor:**
   - Menu: `View` → `Terminal`
   - Ou raccourci: `` Ctrl + ` ``

2. **Tapez cette commande:**
   ```bash
   git push -u origin main
   ```

3. **Quand Git demande vos identifiants:**
   - **Username:** `melanieboisrodriguez-ctrl`
   - **Password:** Utilisez votre **TOKEN GitHub** (pas votre mot de passe)

### Option B: GitHub Desktop (Plus facile - Recommandé)

1. **Téléchargez GitHub Desktop:**
   - https://desktop.github.com/
   - Installez et connectez-vous avec votre compte GitHub

2. **Ajoutez le dépôt:**
   - `File` → `Add Local Repository`
   - Sélectionnez: `/Users/melanie.bois/Documents/CURSOR folders/Site web Consultation`
   - Cliquez sur "Publish repository"
   - Cochez "Keep this code private" si vous voulez, mais **Public** est nécessaire pour GitHub Pages gratuit

3. **C'est tout!** Le code sera publié automatiquement.

---

## 🌐 ÉTAPE 2: Activer GitHub Pages

Une fois le code publié:

1. **Allez sur:** https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages

2. **Configurez:**
   - **Source:** Deploy from a branch
   - **Branch:** `main`
   - **Folder:** `/ (root)`

3. **Cliquez sur "Save"**

4. **Attendez 1-2 minutes** - GitHub va déployer votre site

---

## ✅ C'est fait!

Votre site sera disponible à:
- **https://fbiconseil.com** (après configuration DNS)
- **https://www.fbiconseil.com** (après configuration DNS)
- **https://melanieboisrodriguez-ctrl.github.io/fbiconseil/** (temporaire)

---

## 🔧 Configuration DNS (Dernière étape)

Chez votre registrar de domaine (où vous avez acheté fbiconseil.com):

### 4 enregistrements A:
```
Type: A
Nom: @
Valeur: 185.199.108.153
```
(Répétez pour: 185.199.109.153, 185.199.110.153, 185.199.111.153)

### 1 enregistrement CNAME:
```
Type: CNAME
Nom: www
Valeur: melanieboisrodriguez-ctrl.github.io
```

Les changements DNS peuvent prendre jusqu'à 48h.

---

## 💡 Créer un token GitHub (si nécessaire)

1. https://github.com/settings/tokens
2. "Generate new token (classic)"
3. Nom: `fbiconseil`
4. Cochez: **repo**
5. "Generate token"
6. **Copiez le token** (vous ne le reverrez plus!)
7. Utilisez-le comme mot de passe quand Git le demande
