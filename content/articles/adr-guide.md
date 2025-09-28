---
categories: ["Guide pratique"]
date: '2025-09-26T08:54:26Z'
draft: false
title: 'Guide pratique : Comment rédiger un ADR'
---

## Introduction

Ce guide explique comment utiliser le format ADR pour rédiger une décision, avec des **étapes concrètes, des best practices et un exemple pratique**.
Il complète le [Concept ADR]({{< ref "adr-concept.md" >}}), qui décrit *ce qu’est un ADR et pourquoi l’utiliser*.

## Étapes pour rédiger un ADR

1. **Identifier la décision à documenter**

    - Correspond au **Titre / Décision** dans le Concept.
    - Formulez la décision principale que vous souhaitez prendre.

2. **Rédiger le contexte**

    - Correspond à la section **Contexte** du Concept.
    - Expliquez la situation et pourquoi la décision est nécessaire.

3. **Lister les alternatives**

   - Correspond à **Options considérées**.
   - Décrivez brièvement chaque option envisagée avec ses avantages et inconvénients.

4. **Décrire les conséquences**

   - Correspond à **Conséquences**.
   - Notez les impacts positifs et négatifs de la décision.

5. **Ajouter des notes et liens**

   - Correspond à la section **Notes / Liens**.
   - Incluez des références vers des concepts, guides ou ressources pertinentes.

## Best practices

- Rester **court et simple** dans la décision.
- Contexte explicatif mais concis.
- Versionner les ADR dans Git ou une autre technologie de suivi.
- Inclure des liens vers le Concept ADR et le Guide pour plus de contexte.

## Pièges à éviter

- Ne pas mélanger narration et décision.
- Ne pas ajouter trop de détails dans la décision elle-même.
- Ne pas mettre à jour le guide ou le concept si les pratiques changent.
- Limiter chaque ADR à une **seule décision** pour un contexte.

## Exemples concrets

### ADR “Hello World” pour le blog

```markdown
# 20250926-00: Décision d’écrire les billets de blog en ADR

## Statut
Adopté

## Contexte
Nous voulons structurer les billets en ADR pour garder un historique clair et traçable.

## Décision
Tous les billets de blog seront rédigés en format ADR.

## Alternatives
- Écrire des billets classiques sans structure → trop dispersé
- Créer un billet uniquement technique → manque de traçabilité

## Conséquences
- Avantages : traçabilité, clarté, pédagogie
- Inconvénients : format un peu rigide pour certains billets

## Notes / Liens
- Concept ADR : [docs/adr-concept.md](../docs/adr-concept.md)
- Guide pratique : [docs/adr-guide.md](../docs/adr-guide.md)
