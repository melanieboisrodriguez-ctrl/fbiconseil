# Instructions pour pousser les modifications vers GitHub

## Problème
La version en ligne (GitHub Pages) n'est pas à jour avec votre version locale.

## Solution

**Exécutez cette commande dans votre terminal :**

```bash
git push -u origin main
```

**Quand Git vous demande :**
- **Username** : `melanieboisrodriguez-ctrl`
- **Password** : Votre **Personal Access Token (PAT)** GitHub (⚠️ PAS votre mot de passe GitHub)

## Si vous n'avez pas de Personal Access Token

1. Allez sur : https://github.com/settings/tokens
2. Cliquez sur "Generate new token" → "Generate new token (classic)"
3. Donnez-lui un nom (ex: "fbiconseil-push")
4. Cochez la permission `repo` (accès complet aux dépôts)
5. Cliquez sur "Generate token"
6. **Copiez le token immédiatement** (vous ne pourrez plus le voir après)
7. Utilisez ce token comme mot de passe lors du `git push`

## Après le push

1. Attendez 1-2 minutes pour que GitHub Pages se mette à jour
2. Videz le cache de votre navigateur (Cmd+Shift+R sur Mac, Ctrl+Shift+R sur Windows)
3. Vérifiez votre site : https://melanieboisrodriguez-ctrl.github.io/fbiconseil/

## Vérification

Pour vérifier que le push a fonctionné, vous pouvez exécuter :
```bash
git log origin/main --oneline -5
```

Si vous voyez les commits récents (y compris "Description de vos changements"), le push a réussi.
