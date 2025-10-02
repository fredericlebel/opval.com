---
categories: ["ADR"]
# date: "2025-10-04"
date: "2025-10-04"
draft: false
title: 'ADR 20251004-00 Hébergement du site opval.com'
tags: ["ADR", "Blog"]
---

## Statut

Proposé

## Contexte

J'ai un blog statique généré avec Hugo, destiné à être publié sous le domaine opval.com.
Je souhaite décider entre deux options d'hébergement.

1. **GitHub Pages**: publication automatique via GitHub Actions, servir par le CDN de GitHub.
2. **Cluster K3S interne**: hébergement interne, exposition via ingress, flux.cd, et cert-manager.

L'objectif est de décider quelle approche est la plus adaptée en terme de simplicité, contrôle et maintenance.

## Décision

L'hébergement du blog se fera sur **GitHub Pages** avec le domaine `opval.com`.
Cette solution permet une publication rapide, un accès mondial via le CDN de GitHub, et minimise la maintenance nécessaire pour l'infrastructure.

## Alternatives considérées

- **Héberger le site sur GitHub Pages**:
  - Avantages: gratuit, rapide via CDN mondial, zéro maintenance.
  - Inconvénients: contrôle limité, dépendance à GitHub.

- **Héberger le site dans k3s**:
  - Avantages: contrôle complet, intégration avec monitoring, observabilité, et souverainté des données.
  - Inconvénients: maintenance accrue, disponibilité dépendante du cluster, pas de CDN mondial intégré, et risque au niveau de la capacité disponible pour la charge.

## Conséquences

- Avantages :
  - Blog rapide et disponible mondialement via GitHub pages.
  - Publication simple et automatisée via GitHub Actions.
  - Maintenance minimale, pas de gestion d'infrastructure complexe.

- Inconvénients :
  - Contrôle limité sur la configuration réseau et les headers de sécurité.
  - Dépendance à GitHub pour l'hébergement et la disponibilité.

## Références

- **GitHub Pages Documentation** – GitHub
  Documentation officielle sur l’hébergement de sites statiques via GitHub Pages.
  [docs.github.com/en/pages](https://docs.github.com/en/pages)

- **Hugo Documentation** – Hugo
  Documentation officielle sur la génération de sites statiques avec Hugo.
  [gohugo.io/documentation/](https://gohugo.io/documentation/)

- **k3s Documentation** – Rancher Labs
  Documentation officielle pour l’installation et la gestion de k3s.
  [k3s.io](https://k3s.io/)
