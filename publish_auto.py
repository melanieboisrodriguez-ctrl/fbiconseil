#!/usr/bin/env python3
"""
Script pour créer automatiquement un dépôt GitHub et publier le site
"""

import subprocess
import sys
import os
import json

def run_command(cmd, check=True):
    """Exécute une commande shell"""
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, check=check)
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"❌ Erreur: {e.stderr}")
        return None

def check_gh_cli():
    """Vérifie si GitHub CLI est installé"""
    result = run_command("which gh", check=False)
    return result is not None and result != ""

def create_repo_with_gh(repo_name, description="Site web FBI Conseil"):
    """Crée un dépôt GitHub avec GitHub CLI"""
    print(f"📦 Création du dépôt '{repo_name}' sur GitHub...")
    
    # Vérifier l'authentification
    auth_check = run_command("gh auth status", check=False)
    if "Logged in" not in auth_check:
        print("🔐 Authentification GitHub requise...")
        run_command("gh auth login")
    
    # Créer le dépôt
    cmd = f'gh repo create {repo_name} --public --description "{description}" --source=. --remote=origin --push'
    result = run_command(cmd, check=False)
    
    if result is None:
        print("❌ Échec de la création du dépôt")
        return False
    
    print("✅ Dépôt créé avec succès!")
    return True

def setup_github_pages(repo_name, github_user):
    """Configure GitHub Pages via l'API"""
    print("\n📝 Configuration de GitHub Pages...")
    print("⚠️  Note: Vous devrez activer GitHub Pages manuellement:")
    print(f"   1. Allez sur: https://github.com/{github_user}/{repo_name}/settings/pages")
    print("   2. Source: Deploy from a branch")
    print("   3. Branch: main, Folder: / (root)")
    print("   4. Cliquez sur 'Save'")
    print(f"\n🌐 Votre site sera disponible à:")
    print(f"   https://{github_user}.github.io/{repo_name}/")

def main():
    repo_name = "fbiconseil-website"  # Nom par défaut
    github_user = "melanieboisrodriguez-ctrl"
    
    if len(sys.argv) > 1:
        repo_name = sys.argv[1]
    
    print("🚀 Publication automatique sur GitHub Pages\n")
    print(f"📦 Nom du dépôt: {repo_name}")
    print(f"👤 Utilisateur: {github_user}\n")
    
    # Vérifier si GitHub CLI est installé
    if not check_gh_cli():
        print("⚠️  GitHub CLI (gh) n'est pas installé.")
        print("\nOptions:")
        print("1. Installer GitHub CLI: brew install gh")
        print("2. Créer le dépôt manuellement sur GitHub.com et utiliser:")
        print(f"   ./publish.sh {repo_name}")
        return 1
    
    # Créer le dépôt
    if create_repo_with_gh(repo_name):
        setup_github_pages(repo_name, github_user)
        return 0
    else:
        print("\n💡 Alternative: Créez le dépôt manuellement sur GitHub.com")
        print(f"   Puis exécutez: ./publish.sh {repo_name}")
        return 1

if __name__ == "__main__":
    sys.exit(main())
