# 🚀 Déploiement Rapide - 3 Étapes Simples

Le site sera disponible sur **fbiconseil.com** après configuration.

## Option 1: Avec GitHub CLI (le plus rapide)

Si vous avez GitHub CLI installé:

```bash
# 1. S'authentifier (une seule fois)
gh auth login

# 2. Créer et publier en une commande
gh repo create fbiconseil --public --source=. --remote=origin --push

# 3. Activer GitHub Pages
gh repo view --web
# Puis: Settings → Pages → Source: main → Save
```

## Option 2: Création manuelle (2 minutes)

### Étape 1: Créer le dépôt sur GitHub
1. Allez sur: **https://github.com/new**
2. Nom du dépôt: `fbiconseil`
3. Visibilité: **Public** (nécessaire pour GitHub Pages gratuit)
4. **Ne cochez PAS** "Add a README file"
5. Cliquez sur **"Create repository"**

### Étape 2: Publier le code
Exécutez cette commande dans le terminal:

```bash
cd "/Users/melanie.bois/Documents/CURSOR folders/Site web Consultation"
./publish.sh fbiconseil
```

### Étape 3: Activer GitHub Pages
1. Allez sur: **https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages**
2. Sous **"Source"**, sélectionnez:
   - **Branch:** `main`
   - **Folder:** `/ (root)`
3. Cliquez sur **"Save"**

### Étape 4: Configurer le domaine fbiconseil.com

Le fichier `CNAME` est déjà inclus. Configurez le DNS chez votre registrar:

**Enregistrements A (4 adresses IP GitHub):**
- `185.199.108.153`
- `185.199.109.153`
- `185.199.110.153`
- `185.199.111.153`

**Enregistrement CNAME pour www:**
- Nom: `www`
- Valeur: `melanieboisrodriguez-ctrl.github.io`

### ✅ C'est fait!
Votre site sera disponible à:
- **https://fbiconseil.com** (après configuration DNS)
- **https://www.fbiconseil.com** (après configuration DNS)

---

## Option 3: Avec token GitHub (automatique)

Si vous préférez que tout soit automatique:

1. Créez un token sur: https://github.com/settings/tokens
   - Cliquez sur "Generate new token (classic)"
   - Donnez-lui la permission **"repo"**
   - Copiez le token

2. Exécutez:
```bash
export GITHUB_TOKEN=votre_token_ici
./create_and_publish.sh
```

Le script créera le dépôt et publiera tout automatiquement!
