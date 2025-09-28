---
categories: ["Concept"]
date: "2025-09-26T08:54:26Z"
draft: false
title: 'Concept : Qu''est-ce qu''un ADR ?'
---

## Introduction

Un **Architecture Decision Record (ADR)** est un document léger qui permet de **capturer les décisions importantes** dans un projet, incluant la décision, le contexte ainsi que les conséquences.
Il est recommandé de stocker ces documents aussi près que possible du code source, par exemple dans le même dépôt Git que l’application, afin qu’ils restent synchronisés.

## Objectif

- Maintenir un historique clair des choix
- Faciliter l’onboarding (ou l’intégration) de nouveaux membres
- Rendre les décisions traçables et compréhensibles

## Sections typiques

1. **Titre** : composé d’un identifiant unique et de la décision elle-même
2. **Statut** : Brouillon, Proposé, Adopté, Remplacé par [ADR #] ou Retiré
3. **Décision** : la décision prise en quelques phrases, avec le pourquoi
4. **Contexte** : situation et problème à résoudre
5. **Options considérées** : chaque option envisagée est brièvement décrite avec ses avantages et inconvénients
6. **Conséquences** : les conséquences de cette décision, positives comme négatives
7. **Notes / Liens** : documentation et ressources utiles

> _Exemple : [20250926-00 - Choisir GitHub Actions pour le CI/CD](#)_ (exemple fictif)

## Références

- **Documenting Architecture Decisions** – Michael Nygard, 2011
  Le billet fondateur qui a popularisé le concept d’ADR.
  [cognitect.com/blog/2011/11/15/documenting-architecture-decisions](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)

- **Scaling Architecture Conversationally** – Martin Fowler, 2016
  Comment faire évoluer les discussions d’architecture de façon collaborative.
  [martinfowler.com/articles/scaling-architecture-conversationally.html](https://martinfowler.com/articles/scaling-architecture-conversationally.html)

- **Lightweight Architecture Decision Records** – ThoughtWorks Technology Radar
  Une approche légère et moderne pour documenter les décisions.
  [thoughtworks.com/radar/techniques/lightweight-architecture-decision-records](https://www.thoughtworks.com/radar/techniques/lightweight-architecture-decision-records)
