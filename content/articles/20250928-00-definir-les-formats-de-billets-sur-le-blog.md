---
categories: ["ADR"]
date: "2025-09-26T08:54:26Z"
draft: false
title: 'ADR 20250928-00 Définir les formats de billets sur le blog'
tags: ["ADR", "Blog", "Format", "Concept", "Guide pratique"]
---

## Statut

Adopté

## Contexte

Je souhaite tenir un blog technique pour partager mes réflexions, pratiques et décisions.
Il existe plusieurs types de contenu : concepts, guides pratiques et décisions formelles.
Je veux à la fois rendre le blog **intéressant et lisible**, et **assurer la traçabilité des décisions importantes**.

## Décision

Les billets du blog seront rédigés en **trois formats principaux** :

1. **Concepts** : expliquer des idées ou théories, format libre et narratif.
2. **Guides pratiques** : montrer comment réaliser une tâche, format concret et étape par étape.
3. **Architecture Decision Records (ADR)** : capturer les décisions importantes de manière formelle, concise et traçable.

J'essayerai de rédiger **la majorité des décisions importantes en ADR**, tandis que certains billets narratifs ou guides pratiques peuvent rester dans un format libre.

## Alternatives considérées

- **Tout rédiger en ADR** :
  - Avantages : uniformité complète.
  - Inconvénients : rend la lecture lourde pour des concepts ou guides narratifs, moins engageant.
- **Formats libres uniquement** :
  - Avantages : facile à rédiger, plus souple pour la lecture.
  - Inconvénients : perte de traçabilité et d’historique clair des décisions.

## Conséquences

- Avantages :
  - Traçabilité des décisions importantes.
  - Lecture agréable pour concepts et guides.
  - Navigation fluide entre théorie, pratique et décisions formelles.
- Inconvénients :
  - Les lecteurs doivent s’adapter à plusieurs formats.
  - Gestion légèrement plus complexe du blog (différents layouts, CSS, etc.).

## Références

- **Concept ADR** - interne
  [Concept ADR]({{< ref "adr-concept.md" >}})

- **Guide ADR** - interne
  [Guide ADR]({{< ref "adr-guide.md" >}})
