---
categories:
  - ADR
date: "2025-10-10"
draf: false
title: "ADR 20251010-00 Vérification des liens internes et externes dans le blog"
tags:
  - ADR
  - CI/CD
  - pre-commit
  - Qualité
summary: "Adopter l’outil lychee pour automatiser la vérification des liens Markdown dans le blog, à la fois via pre-commit en local, GitHub Actions, et une tâche planifiée hebdomadaire."
---

## Statut

Proposé

## Contexte

Le blog contient de nombreux fichiers Markdown avec des liens internes(`./guide-pratique-ssh.md`, `/articles/...`) et externes (liens GitHub, références, outils, etc.).
Avec la croissance du contenu, certains liens peuvent devenir brisés, obsolètes, ou mal formatés, ce qui nuit à la qualité du contenu et la crédibilité du site.

Une vérification automatique des liens est nécessaire pour :

- Détecter rapidement les liens brisés avant publication;
- Éviter les erreurs 404 sur le site en production;
- Maintenir une documentation cohérente à travers le temps;
- Intégrer la vérification dans le CI/CD et le flux de développement local.

## Décision

J'adopte **[lychee](https://github.com/lycheeverse/lychee)** comme outil principal pour valider les liens Markdown, intégré à trois niveaux:

1. En local via pre-commit, afin de détecter les problèmes avant même de pousser les modifications.
2. Dans le pipeline CI/CD via GitHub Actions, pour valider le contenu chaque push ou pull request.
3. Via une tâche planifiée dans GitHub Actions, pour vérifier régulièrement le contenu publié même si aucun commit n'est réalisé.

## Alternatives considérées

### 1. markdown-lint-check

- **Avantages**: facile à installer, supporte les liens Markdown.
- **Inconvénients**: pas de cache, lent, pas d’intégration native avec pre-commit, et nécessite l'installation de nodejs.

### 2. script maison : curl + grep

- **Avantages**: flexibilité totale.
- **Inconvénients**: maintenance élevée, pas d’intégration avec GitHub ou pre-commit.

### 3. plugin hugo

- **Avantages**: intégration directe au build du site.
- **Inconvénients**: ne couvre pas les liens Markdown bruts avant génération.

## Conséquences

- Lorsqu'un lien est brisé, je recevrai une alerte directement dans le terminal au moment du commit, ou via GitHub Actions après le push, ou grâce à une tâche planifié dans GitHub Actions.
- Cette automatisation me permet de maintenir une qualité du contenu sans vérification manuelle.
- Les exceptions (liens temporaires, localhost) peuvent être ignorées via .lycheeignore.

## Références

- [Lychee - GitHub](https://github.com/lycheeverse/lychee)
  Le projet officiel de Lychee pour vérifier les liens Markdown.

- [Lychee Action - GitHub Marketplace](https://github.com/lycheeverse/lychee-action)
  Action GitHub officielle pour exécuter Lychee dans les workflows CI/CD.

- [Lychee pre-commit hook](https://github.com/lycheeverse/lychee/blob/master/PRE_COMMIT.md)
  Intégration de Lychee avec pre-commit pour la vérification locale des liens.

- [markdown-link-check](https://github.com/tcort/markdown-link-check)
  Alternative pour vérifier les liens Markdown via npm.
