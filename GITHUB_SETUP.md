# Instructions pour publier sur GitHub Pages

Le site sera disponible sur **fbiconseil.com** après configuration du domaine.

## Étape 1: Créer un dépôt GitHub

1. Allez sur [GitHub.com](https://github.com) et connectez-vous
2. Cliquez sur le bouton **"+"** en haut à droite, puis sélectionnez **"New repository"**
3. Donnez un nom à votre dépôt: `fbiconseil`
4. **Ne cochez PAS** "Initialize this repository with a README" (on a déjà un README)
5. Cliquez sur **"Create repository"**

## Étape 2: Connecter votre dépôt local à GitHub

Une fois le dépôt créé, GitHub vous donnera des commandes. Utilisez celles qui commencent par "push an existing repository from the command line". 

Ou exécutez ces commandes dans le terminal:

```bash
cd "/Users/melanie.bois/Documents/CURSOR folders/Site web Consultation"
git remote add origin https://github.com/melanieboisrodriguez-ctrl/fbiconseil.git
git branch -M main
git push -u origin main
```

## Étape 3: Activer GitHub Pages

1. Allez sur votre dépôt GitHub
2. Cliquez sur **"Settings"** (en haut du dépôt)
3. Dans le menu de gauche, cliquez sur **"Pages"**
4. Sous **"Source"**, sélectionnez **"Deploy from a branch"**
5. Choisissez la branche **"main"** et le dossier **"/ (root)"**
6. Cliquez sur **"Save"**

## Étape 4: Configurer le domaine personnalisé fbiconseil.com

Le fichier `CNAME` est déjà inclus dans le projet. GitHub Pages le détectera automatiquement.

**Configuration DNS requise:**

Chez votre registrar de domaine (où vous avez acheté fbiconseil.com), ajoutez ces enregistrements:

### Enregistrements A (pour fbiconseil.com):
```
Type: A
Nom: @ (ou laissez vide)
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

### Enregistrement CNAME (pour www.fbiconseil.com):
```
Type: CNAME
Nom: www
Valeur: melanieboisrodriguez-ctrl.github.io
```

**Note:** Les changements DNS peuvent prendre jusqu'à 48 heures pour se propager.

## Étape 5: Accéder à votre site

Après configuration du DNS, votre site sera disponible à:
- **https://fbiconseil.com**
- **https://www.fbiconseil.com**

Temporairement, vous pouvez aussi accéder au site via:
- **https://melanieboisrodriguez-ctrl.github.io/fbiconseil/**

## Mises à jour futures

Pour mettre à jour le site après avoir modifié les fichiers:

```bash
cd "/Users/melanie.bois/Documents/CURSOR folders/Site web Consultation"
git add .
git commit -m "Description des modifications"
git push
```

Les changements seront automatiquement publiés sur GitHub Pages en quelques minutes.
