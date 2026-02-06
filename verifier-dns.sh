#!/bin/bash

# Script pour vérifier la configuration DNS

echo "🔍 Vérification de la configuration DNS pour fbiconseil.com"
echo ""

DOMAIN="fbiconseil.com"
EXPECTED_IPS=("185.199.108.153" "185.199.109.153" "185.199.110.153" "185.199.111.153")

echo "📋 Vérification des enregistrements A pour $DOMAIN..."
echo ""

# Vérifier les enregistrements A
IPS_FOUND=$(dig +short $DOMAIN A | sort)

if [ -z "$IPS_FOUND" ]; then
    echo "❌ Aucun enregistrement A trouvé pour $DOMAIN"
    echo "   Les enregistrements DNS ne sont peut-être pas encore propagés."
else
    echo "✅ Enregistrements A trouvés:"
    echo "$IPS_FOUND"
    echo ""
    
    # Vérifier si toutes les IP GitHub sont présentes
    ALL_FOUND=true
    for ip in "${EXPECTED_IPS[@]}"; do
        if echo "$IPS_FOUND" | grep -q "$ip"; then
            echo "   ✅ $ip trouvé"
        else
            echo "   ⚠️  $ip manquant"
            ALL_FOUND=false
        fi
    done
    
    if [ "$ALL_FOUND" = true ]; then
        echo ""
        echo "✅ Toutes les IP GitHub sont configurées!"
    else
        echo ""
        echo "⚠️  Certaines IP GitHub manquent. Vérifiez votre configuration DNS."
    fi
fi

echo ""
echo "📋 Vérification du CNAME pour www.$DOMAIN..."
echo ""

CNAME=$(dig +short www.$DOMAIN CNAME)

if [ -z "$CNAME" ]; then
    echo "❌ Aucun enregistrement CNAME trouvé pour www.$DOMAIN"
    echo "   Configurez un CNAME pointant vers: melanieboisrodriguez-ctrl.github.io"
else
    echo "✅ CNAME trouvé:"
    echo "   $CNAME"
    
    if echo "$CNAME" | grep -q "github.io"; then
        echo "   ✅ CNAME correct!"
    else
        echo "   ⚠️  CNAME devrait pointer vers: melanieboisrodriguez-ctrl.github.io"
    fi
fi

echo ""
echo "🌐 Test de l'accessibilité du site..."
echo ""

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" https://$DOMAIN 2>/dev/null)

if [ "$HTTP_CODE" = "200" ]; then
    echo "✅ Site accessible sur https://$DOMAIN (HTTP $HTTP_CODE)"
elif [ "$HTTP_CODE" = "000" ]; then
    echo "⏳ Site pas encore accessible (DNS en propagation ou non configuré)"
else
    echo "⚠️  Site retourne HTTP $HTTP_CODE"
fi

echo ""
echo "📝 Vérifiez aussi dans GitHub:"
echo "   https://github.com/melanieboisrodriguez-ctrl/fbiconseil/settings/pages"
echo "   (Devrait afficher une coche verte à côté du domaine)"
echo ""
