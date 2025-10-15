---
categories:
  - DevSecOps
  - Guide pratique
  - Sécurité
date: '2025-10-17'
draft: false
summary: "Un guide clair et pratique pour détecter, supprimer, prévenir les fuites de secrets dans un dépôt git à l'aide de Gitleaks et git-filter-repo."
tags:
  - devsecops
  - git
  - gitleaks
  - git-filter-repo
  - secrets
  - securité
title: 'Guide pratique : Comment nettoyer un dépôt git après une fuite de secrets'
---

## Introduction

Les fuites de secrets dans un dépôt git arrivent de plus en plus souvent que nous pouvons le penser.
Un fichier .env oublier, une clé API commitée juste pour tester... et c'est la porte pour ouverte à des accès non-autorisés.
Il existe heureusement une méthode claire pour identifier, corriger, et prévenir ces situations.

## Comprendre le problème

Un secret exposé dans un dépôt public est souvent repéré en quelques minutes par des bots.
Même si tu le supprimes ensuite, git garde tout son historique. Il faut donc réécrire cet historique proprement.

### Exemples de secrets courrants

- Clés API (AWS, Azure, GitHub...);
- Tokens d'accès CI/CD;
- Mots de passe dans du code;
- Clés privés (clés ssh privées, certificats, etc);
- Fichiers .env.

## Détecter les secrets avec Gitleaks

L'outil Gitleaks permet de scanner ton dépôt git et son historique.

### Installation

```bash
brew install gitleaks
```

### Scanner le dépôt courant

```bash
gitleaks detect --source . --report-path gitleaks-report.json
```

### Scanner tout l'historique du dépôt

```bash
gitleaks detect --source . --log-opts="--all"
```
### Lire l'output du fichier gitleaks-report.json

La meilleure façon pour lire l'output JSON de Gitleaks consiste à utiliser `jq`, un outil pratique pour formater et filtrer le JSON.

```bash
# Afficher le contenu de manière lisible
jq '.' gitleaks-report.json

# Lister seulement les fichiers contenant des secrets
jq '.[].file' gitleaks-report.json

# Lister les secrets détectés
jq '.[].secret' gitleaks-report.json
```

## Supprimer les secrets avec git filter-repo

Une fois les fichiers identifiés, il faut les effacer de l'historique du Git.


### Copie de sécurité
Avant de vous lancer dans cette opération, vous devez absolument avoir crée une copie de sécurité du dépôt que vous allez réécrire. Autrement, les données seront perdues.

Réécrire l'historique modifie les commits existants.

```bash
git clone --mirror https://github.com/fredericlebel/opval.com.git opval.com-backup.git
```

### Installation

```bash
brew install git-filter-repo
```

### Supprimer un fichier de tous les commits

```bash
git filter-repo --path .env --invert-paths
```

### Réécrire le dépôt distant

```bash
git push origin --force --all
git push origin --force --tags
```

## Révoquer et regénérer les secrets compromis

1. Révoquer immédiatement les secrets exposés.
2. Générer de nouveaux secrets.
3. Mettre à jour les environnements et les pipelines CI/CD.

## Prévenir les fuites à l'avenir

### pre-commit hook gitleaks

Empêcher les secrets d'être committés.

```yaml
repos:
  - repo: https://github.com/gitleaks/gitleaks
    rev: v8.18.2
    hooks:
      - id: gitleaks

```

### Intégration CI/CD

Ajouter une vérification automatique à chaque push:

```
name: Scanner les secrets
on: [push, pull_request]
jobs:
  scanner-les-secrets:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v5
      - uses: gitleaks/gitleaks-action@v2
```

## Bonnes pratiques

- Ne jamais commiter de .env, ou de .pem, ou credentials.
- Utiliser un vault(Ansible vault, AWS Secrets manager, Azure Keyvault, etc).
- Ajouter les fichiers sensibles dans le .gitignore.
- Ajouter une vérification avant les commits avec pre-commit.
- Scanner régulièrement avec Gitleaks avec un pipeline CI/CD.

## Références

- **Gitleaks** - Détection de secrets dans les dépôts Git
  Outil open-source écrit en Go permettant d'analyser le code source et l'historique Git à la recherche de secrets (API keys, tokens, mots de passe).
  [github.com/gitleaks/gitleaks](https://github.com/gitleaks/gitleaks)

- **git-filter-repo** - Réécriture propre et rapide de l'historique Git
  Remplace `git filter-branch` et BFG Repo-Cleaner. Permet de supprimer ou de modifier des fichiers et valeurs sensibles dans tout l'historique Git.
  [github.com/newren/git-filter-repo](https://github.com/newren/git-filter-repo)

- **pre-commit** - Cadre de gestion des hooks Git
  Outil permettant d'exécuter automatiquement des vérifications (comme Gitleaks) avant chaque commit, afin de prévenir les erreurs de sécurité et de conformité.
  [pre-commit.com](https://pre-commit.com)
