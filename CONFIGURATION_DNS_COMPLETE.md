# 🔧 Configuration DNS pour fbiconseil.com

## 📋 Informations à copier-coller

Voici **exactement** ce que vous devez configurer chez votre registrar de domaine (où vous avez acheté fbiconseil.com).

---

## 🌐 Enregistrements DNS à créer

### 1️⃣ Quatre (4) enregistrements A

Créez **4 enregistrements A identiques** avec ces valeurs:

**Enregistrement A #1:**
```
Type: A
Nom/Host: @ (ou laissez vide, ou mettez juste le domaine)
Valeur/IP: 185.199.108.153
TTL: 3600 (ou par défaut)
```

**Enregistrement A #2:**
```
Type: A
Nom/Host: @
Valeur/IP: 185.199.109.153
TTL: 3600
```

**Enregistrement A #3:**
```
Type: A
Nom/Host: @
Valeur/IP: 185.199.110.153
TTL: 3600
```

**Enregistrement A #4:**
```
Type: A
Nom/Host: @
Valeur/IP: 185.199.111.153
TTL: 3600
```

### 2️⃣ Un (1) enregistrement CNAME

**Enregistrement CNAME:**
```
Type: CNAME
Nom/Host: www
Valeur/Point vers: melanieboisrodriguez-ctrl.github.io
TTL: 3600 (ou par défaut)
```

---

## 📝 Instructions par registrar

### Si votre domaine est chez:

#### **GoDaddy:**
1. Connectez-vous à votre compte
2. Allez dans "My Products" → "DNS"
3. Cliquez sur "Add" pour chaque enregistrement
4. Pour les A: Type=A, Host=@, Points to=185.199.108.153 (répétez pour les 4 IP)
5. Pour le CNAME: Type=CNAME, Host=www, Points to=melanieboisrodriguez-ctrl.github.io

#### **Namecheap:**
1. Connectez-vous → "Domain List"
2. Cliquez sur "Manage" à côté de fbiconseil.com
3. Onglet "Advanced DNS"
4. Cliquez "Add New Record" pour chaque enregistrement
5. Pour les A: Type=A Record, Host=@, Value=185.199.108.153
6. Pour le CNAME: Type=CNAME Record, Host=www, Value=melanieboisrodriguez-ctrl.github.io

#### **Google Domains / Squarespace Domains:**
1. Connectez-vous
2. Sélectionnez fbiconseil.com
3. "DNS" ou "Name servers"
4. Ajoutez les 4 enregistrements A avec @ comme nom
5. Ajoutez le CNAME pour www

#### **Autre registrar:**
- Cherchez la section "DNS", "DNS Management", ou "Zone DNS"
- Ajoutez les enregistrements comme indiqué ci-dessus

---

## ✅ Vérification

Après avoir configuré le DNS, attendez quelques minutes, puis vérifiez:

### 1. Vérifier dans GitHub:
- https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages
- Vous devriez voir une **coche verte** à côté de "fbiconseil.com"

### 2. Tester les URLs:
- https://fbiconseil.com
- https://www.fbiconseil.com

### 3. Vérifier avec un outil en ligne:
- https://dnschecker.org/#A/fbiconseil.com
- Tous les serveurs DNS devraient montrer les 4 IP GitHub

---

## ⏰ Délais

- **Propagation DNS:** 5 minutes à 48 heures (généralement 15-30 minutes)
- **GitHub Pages:** 1-2 minutes après activation DNS

---

## 🆘 Problèmes courants

### Le site ne fonctionne pas après 1 heure:
1. Vérifiez que les 4 enregistrements A sont bien créés
2. Vérifiez que le CNAME pour www est correct
3. Attendez encore un peu (parfois ça prend jusqu'à 48h)
4. Vérifiez dans GitHub Pages settings qu'il n'y a pas d'erreur

### Erreur "Domain not verified":
- Attendez quelques minutes
- Vérifiez que le fichier CNAME est bien dans votre dépôt GitHub
- Vérifiez que les enregistrements DNS sont corrects

---

## 📞 Besoin d'aide?

Si vous avez des difficultés:
1. Dites-moi quel est votre registrar (GoDaddy, Namecheap, etc.)
2. Je peux vous donner des instructions spécifiques
3. Ou envoyez-moi une capture d'écran de votre interface DNS

---

## 🎉 Une fois configuré

Votre site sera accessible à:
- ✅ **https://fbiconseil.com**
- ✅ **https://www.fbiconseil.com**

Et GitHub Pages redirigera automatiquement vers votre domaine personnalisé!
