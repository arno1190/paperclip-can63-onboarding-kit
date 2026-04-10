# Portail école — messagerie GTM (piste PDF + piste en ligne)

**Ticket :** [CAN-60](/CAN/issues/CAN-60) · **Entrées :** [memo architecture](school-portal-architecture-memo.md), [CAN-57](/CAN/issues/CAN-57), [CAN-54](/CAN/issues/CAN-54)  
**Garde-fous :** ne pas promettre de calendrier ni de périmètre fonctionnel non validés par le board — voir [CAN-58](/CAN/issues/CAN-58). Formulations : *phased*, *sur invitation*, *sous réserve des arbitrages en cours*.

---

## 1. Narratif bi-piste (court)

Les établissements partenaires disposent aujourd’hui d’une **piste PDF / kit physique** : documents imprimables et hors-ligne, versionnés, qui restent le **référentiel minimal** pour faire tourner l’atelier sans dépendre d’Internet. En parallèle, une **piste portail (pilote)** peut être proposée **de façon progressive et sur invitation** : même contenu et mises à jour présentés en ligne (navigation, téléchargements canoniques, journal des changements), avec des espaces optionnels réservés aux pilotes — **sans remplacer** la piste PDF ni les flux déjà en place (courriel, ENT, etc.).

**Aujourd’hui (piste PDF / kit)**

- Matériel pédagogique et technique **utilisable hors connexion** dans la classe.
- **Contrat opérationnel** : tout le nécessaire pour exploiter le kit est dans le PDF ou y renvoie par une URL stable imprimable.
- **Traçabilité** : numéros de version / changelog alignés sur le kit livré.

**Pilote portail (piste en ligne, optionnelle)**

- **Miroir et confort** : recherche, pages « quoi de neuf », téléchargement des **mêmes** PDF que la chaîne de build.
- **Phase pilote** : accès **sur invitation** pour un nombre limité d’établissements, pas un engagement de fonctionnalités ou de date publique tant que le board n’a pas arbitré.
- **Évolutif** : feuille de route publiée et phases décrites dans le memo technique ; pas de promesse d’ENT/SSO ni de LMS en entrée de gamme.

---

## 2. Esquisse de page d’accueil (titres de sections + claims — FR)

*À implémenter côté site ; pas de maquette pixel — la structure peut être remise à l’UX (enfant portail de [CAN-3](/CAN/issues/CAN-3)).*

| # | Titre de section (proposé) | Claims / messages clés |
|---|----------------------------|-------------------------|
| 1 | **Ressources pour les écoles** | Accès clair aux supports du kit : **même source** que les PDF officiels ; lecture simple sur mobile et bureau. |
| 2 | **Deux façons d’accéder aux contenus** | **Kit + PDF** : référence hors-ligne. **Portail** : option pour navigation, mises à jour et téléchargements — **complément**, pas substitut. |
| 3 | **Version actuelle** | Indication de la **version du kit** en cours ; lien vers changelog / « ce qui a changé » (sans date de roadmap non validée). |
| 4 | **Pilote (sur invitation)** | Espace éventuel **réservé** aux établissements invités ; pas de promesse d’ouverture grand public ni de périmètre figé. |
| 5 | **Signaler un problème** | Canal simple (formulaire / contact) pour remontées — aligné sur le memo (email/ticket côté ops). |
| 6 | **Confiance & conformité** | Hébergement **UE**, politique de confidentialité, mentions légales, rôles ciblés (direction / enseignants / tech) — **textes à valider par le board / juridique**. |
| 7 | **Foire aux questions** | Renvoi vers la FAQ stakeholder ci-dessous (ou ancre sur la même page). |

**Lignes à flag board / juridique (ne pas publier sans relecture)**

- Traitement des données (formulaires, journaux d’accès, durées de conservation).
- **Comptes élèves vs comptes adultes** : le memo privilégie une phase **direction / enseignant** pour simplifier consentements ; toute évolution « comptes élèves » = validation juridique.
- **ENT / SSO** : présenter uniquement comme **piste long terme** soumise à conventions, pas comme engagement MVP.

---

## 3. FAQ parties prenantes (mairie / direction) — 5 Q&R

**Q1 — Le portail remplace-t-il les PDF et le kit physique ?**  
**R.** Non. Les PDF et le matériel livré restent le **socle** pour travailler hors ligne et pour la traçabilité. Le portail, lorsqu’il est proposé, **reflète et facilite l’accès** aux mêmes ressources et aux mises à jour.

**Q2 — Quelle est la « source de vérité » entre le site et les documents imprimés ?**  
**R.** Les **artefacts versionnés** (PDF issus de la chaîne de build) sont la référence contractuelle pour l’exploitation du kit. Le site affiche la **version courante** et les mêmes fichiers ; toute divergence est traitée comme **bug de publication** à corriger.

**Q3 — Où sont hébergées les données et qui est responsable du traitement ?**  
**R.** Cible **hébergement Union européenne**, sous-traitants documentés, politique de confidentialité publique. Les détails précis (responsable de traitement, DPA, conservation des logs et des messages du formulaire) sont **à valider avec le board / le juridique** avant publication.

**Q4 — Les élèves devront-ils créer un compte ?**  
**R.** Les premières phases peuvent **limiter l’accès authentifié** aux rôles adultes (direction, équipes pédagogiques, référents tech), ce qui simplifie le cadre RGPD. Un périmètre élève éventuel est **une évolution** qui nécessite une décision produit et juridique dédiée.

**Q5 — Comment participer au pilote et que garantit-on sur les fonctionnalités ?**  
**R.** Participation **sur invitation**, avec périmètre et disponibilité **alignés sur les arbitrages board** ([CAN-58](/CAN/issues/CAN-58)). Le pilote sert à **tester l’expérience** et la qualité de service ; la feuille de route publique reste **indicative** tant que les jalons ne sont pas validés officiellement.

---

## 4. Coordination (rappel issue)

- Toute affirmation sur **auth, hébergement, RGPD** : croiser avec [CTO](/CAN/agents/cto).  
- **IA visuelle et mise en page** : déléguer à l’UX (travail portail rattaché à [CAN-3](/CAN/issues/CAN-3)) ; ce document fournit **structure et formulations**, pas le design final.
