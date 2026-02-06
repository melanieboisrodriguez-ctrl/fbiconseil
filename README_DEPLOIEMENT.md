# ✅ Tout est prêt pour le déploiement!

Votre site web est prêt et tous les fichiers sont commités dans Git. Le site sera disponible sur **fbiconseil.com**.

## 🎯 Option la plus simple (recommandée)

### 1. Créer le dépôt sur GitHub
Allez sur: **https://github.com/new**

- **Nom:** `fbiconseil`
- **Visibilité:** Public
- **Ne cochez PAS** "Add a README file"
- Cliquez sur **"Create repository"**

### 2. Publier le code
Dans le terminal, exécutez:

```bash
cd "/Users/melanie.bois/Documents/CURSOR folders/Site web Consultation"
git remote add origin https://github.com/melanieboisrodriguez-ctrl/fbiconseil.git
git branch -M main
git push -u origin main
```

*(Si demandé, entrez vos identifiants GitHub)*

### 3. Activer GitHub Pages
1. Allez sur: **https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages**
2. **Source:** Deploy from a branch
3. **Branch:** `main`, **Folder:** `/ (root)`
4. Cliquez sur **"Save"**

### 4. Configurer le domaine personnalisé fbiconseil.com

Le fichier `CNAME` est déjà inclus dans le projet et sera automatiquement détecté par GitHub Pages.

**Configuration DNS requise chez votre registrar de domaine:**

Ajoutez ces enregistrements DNS pour `fbiconseil.com`:

```
Type: A
Nom: @
Valeur: 185.199.108.153
```

```
Type: A
Nom: @
Valeur: 185.199.109.153
```

```
Type: A
Nom: @
Valeur: 185.199.110.153
```

```
Type: A
Nom: @
Valeur: 185.199.111.153
```

Pour le sous-domaine www:

```
Type: CNAME
Nom: www
Valeur: melanieboisrodriguez-ctrl.github.io
```

**Note:** Les changements DNS peuvent prendre jusqu'à 48 heures pour se propager.

### 🌐 Votre site sera disponible à:
- **https://fbiconseil.com** (après configuration DNS)
- **https://www.fbiconseil.com** (après configuration DNS)
- **https://melanieboisrodriguez-ctrl.github.io/fbiconseil/** (temporaire, en attendant le DNS)

---

## 📋 Fichiers créés

- ✅ `index.html` - Page principale du site
- ✅ `styles.css` - Styles selon vos guidelines de marque
- ✅ `Frederiec Bois photo.jpg` - Photo incluse
- ✅ `CNAME` - Configuration du domaine personnalisé
- ✅ Dépôt Git initialisé et commité
- ✅ Scripts de déploiement prêts

## 🛠️ Scripts disponibles

- `deploy.sh` - Ouvre GitHub et guide le processus
- `publish.sh` - Publie après création manuelle du dépôt
- `create_and_publish.sh` - Automatique avec token GitHub

---

## 💡 Astuce: Utiliser GitHub CLI (optionnel)

Si vous installez GitHub CLI, tout devient automatique:

```bash
brew install gh
gh auth login
gh repo create fbiconseil --public --source=. --remote=origin --push
```

Puis activez GitHub Pages dans les settings.

---

## 🔧 Vérification du domaine

Après avoir configuré le DNS, vous pouvez vérifier que tout fonctionne:

1. Allez sur: **https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages**
2. Vérifiez que "Custom domain" affiche: `fbiconseil.com`
3. Si une coche verte apparaît, le domaine est correctement configuré!
