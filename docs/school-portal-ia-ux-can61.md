# School portal MVP — IA & UX recommendations (CAN-61)

**Inputs:** CAN-57 memo · `docs/school-portal-architecture-memo.md`  
**Audience:** Board review, then implementation epic CAN-58.

---

## 1. Recommended information architecture

### 1.1 Principles

- **One primary nav** on mobile and desktop; role differences are **entry points and highlights**, not separate silos until phase 3 (memo P3).
- **Enseignant** is the default “hero” journey: find kit → read → download PDF → see what changed.
- **Direction** and **FabLab** paths reuse the same pages where possible; add **role-oriented landing strips** (cards) on home only.

### 1.2 Top navigation (MVP / P1)

Mobile: **hamburger → same items**. Order optimized for teachers first.

| Label (FR)        | Purpose |
|-------------------|--------|
| **Accueil**       | Role cards + current kit spotlight + trust/version strip |
| **Kits**          | Versioned kit hub: semver, changelog link, PDF CTA, doc tree |
| **Ressources**    | Downloads, BOM errata, firmware, external links (FabLab-heavy) |
| **À propos**      | Roadmap (light PM), legal/privacy, contact / “signaler un problème” |
| *(future P3)* **Espace connecté** | Hidden until auth exists; then last item |

**Optional utility row** (not duplicated in main nav): persistent **“Kit actuel : vX.Y.Z”** + **Télécharger le PDF** as a slim bar below header on doc pages.

### 1.3 Site map (ASCII)

```
/accueil
  ├─ [cards] Direction | Enseignant | FabLab / technique  → anchor scroll or /kits#role-*
  └─ bandeau: version canonique + lien changelog

/kits
  ├─ /kits/<kit-slug>           (e.g. kit-2025)
  │    ├─ Vue d'ensemble       (résumé, prérequis, durée)
  │    ├─ Documentation        (TOC markdown / sections)
  │    ├─ Journal des versions  → /changelog#kit-… ou filtre
  │    └─ CTA: Télécharger PDF (même build que repo)

/ressources
  ├─ Fichiers & errata
  ├─ Firmware / dépôts
  └─ Dépannage (liens stables imprimables dans PDF)

/a-propos
  ├─ Feuille de route (publiée)
  ├─ Confidentialité & cookies
  ├─ Mentions / hébergeur UE
  └─ Contact / signalement

/changelog                    (global + per-kit anchors)

/pilote (P2 — invite-only)
  └─ brouillons, retours structurés, contenu non public
```

### 1.4 Key flows (2–3)

**Flow A — Enseignant (mobile-first, happy path)**  
1. Land **Accueil** → tap **Enseignant** card → scroll to “Kit actuel”.  
2. **Kits** → pick kit → **Documentation** (TOC, search if available).  
3. Long read on phone; sticky **“Télécharger PDF”** + **version** visible.  
4. Optional: **Changelog** filtered to this kit (“depuis votre version”).

**Flow B — Direction (compliance / traceability)**  
1. **Accueil** → **Direction** card → short copy + links to **À propos** (privacy, hosting, retention).  
2. **Kits** → proof of **semver** + **date de publication** + PDF checksum or build id (if engineering exposes it).  
3. Stable URLs for inspector-facing pages (no login required in P1).

**Flow C — FabLab / technique**  
1. **Ressources** first (errata, BOM, firmware).  
2. **Kits** for narrative context; **Changelog** for “what broke/fixed”.  
3. Outbound links (GitHub, releases) clearly badged **externe**.

### 1.5 Mobile-first notes

- **Thumb zone:** primary CTAs (PDF, kit switcher) in lower third or sticky footer on long reads.  
- **TOC:** collapsible; remember scroll position when navigating sections.  
- **Offline expectation:** always offer PDF download; never hide critical steps only in web-only blocks without labeling (see §3).

---

## 2. Public vs invite-only (phase 1 pilot)

Aligned with memo phases **P1** (public docs + changelog + PDF) and **P2** (invite-only pilots).

| Surface | P1 pilot recommendation | Rationale |
|--------|-------------------------|-----------|
| Documentation versionnée, changelog, téléchargement PDF | **Public** (sans compte) | Friction minimale pour enseignants; URL stable pour impression dans PDF; correspond au “lieu unique de confiance”. |
| Formulaire contact / signalement | **Public** avec traitement RGPD documenté | Déjà prévu memo MVP; pas besoin d’auth pour la première prise de contact. |
| Espace pilote (brouillons, retours nominatifs, contenu non validé) | **Invite-only (P2)** | Réduit risque consentement / mineurs; aligné memo GDPR “direction/enseignant-only simplifie”. |
| Prévisualisation pré-lancement pour quelques établissements | **Invite-only ou staging** | Même logique que memo “staging password-protected”. |

**Synthèse:** pour une **phase 1 pilot** calendrier réel, tranchez en **lecture publique canonique** + **couche pilote privée** uniquement là où il y a **données identifiantes** ou **contenu non figé**. Ne pas mettre la doc stable des kits derrière login en P1.

---

## 3. PDF vs web — éviter les versions contradictoires

**Règle UX:** une seule **vérité affichée** par canal, avec statut explicite.

1. **Page web “kit / doc” (source de navigation en ligne)**  
   - Afficher en en-tête: **Version du contenu** (semver kit), **Date de publication**, et lien **Voir le journal des versions**.  
   - **Badge** sur chaque page ou section: `Contenu inclus dans le PDF vX.Y` | `Mise à jour web uniquement (sera intégré PDF vNext)` | `Supplément média (non requis pour l’atelier)`.  
   - **CTA unique:** **Télécharger le PDF officiel (vX.Y)** — même artefact que le build repo.

2. **PDF (contrat hors-ligne)**  
   - Couverture ou pied de page: **URL courte stable** vers la page portail du même kit + **version**.  
   - Si le web ajoute du contenu hors PDF: le PDF ne prétend pas l’inclure; le portail le signale (badge).

3. **Changelog**  
   - Entrées datées, liées au **semver**; libellé clair **“affecte PDF” / “web seulement”** quand pertinent.

4. **Jamais** deux fichiers PDF différents présentés comme “courants” sans comparateur de version (éviter “PDF A vs PDF B” sans hiérarchie).

---

## 4. Accessibilité — lecture longue sur téléphone / tablette

- **Typo:** taille de base ≥ 16px équivalent, interligne confortable; limiter la largeur de ligne en lecture (max ~65–75 caractères sur tablette paysage).  
- **Contraste:** texte et liens respectent WCAG AA; ne pas se fier à la couleur seule pour les badges “web only”.  
- **Focus clavier / lecteur d’écran:** ordre de tabulation logique (nav → contenu → CTA); titres hiérarchiques (`h1`…`h3`) alignés sur la TOC.  
- **Liens:** intitulés explicites (“Télécharger le PDF du kit X v1.2”) plutôt que “cliquez ici”.  
- **Réduction des animations:** respecter `prefers-reduced-motion` pour les transitions de nav/TOC.  
- **Cibles tactiles:** zones de tap ≥ 44×44 px pour CTA répétés (téléchargement, ouverture TOC).  
- **Mode sombre (optionnel):** si activé, revérifier contrastes des badges et code snippets.

---

## 5. Handoff implémentation

- **Epic:** CAN-58.  
- **Rôle-aware IA** complète (vues séparées) = **P3** dans le memo; MVP = nav unique + cartes d’accueil par rôle.
