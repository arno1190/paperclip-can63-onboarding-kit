# Onboarding kit — Markdown → PDF

This repository builds a **branded PDF bundle** from kit markdown using [Pandoc](https://pandoc.org/) and XeLaTeX.

## Prerequisites

- Pandoc 2.x+
- A TeX distribution with **XeLaTeX** (e.g. MacTeX / BasicTeX)

## Build

```bash
make pdf
```

Outputs:

- `dist/onboarding-kit-complete.pdf` — single document (all chapters in `kit/manifest.txt` order)
- `dist/modules/*.pdf` — one PDF per chapter (same order)

## Architecture notes

- [`docs/school-portal-architecture-memo.md`](docs/school-portal-architecture-memo.md) — school-facing portal options and phased roadmap (CAN-57).

## Landing statique (pilote messagerie / CAN-63)

Une page **HTML statique** reprend l’esquisse et la FAQ du pack GTM ([`docs/portal-pilot-gtm-messaging.md`](docs/portal-pilot-gtm-messaging.md)) sans activer de portail ni d’auth.

Aperçu local (à lancer depuis la **racine du dépôt** pour que les liens `../docs/` fonctionnent) :

```bash
python3 -m http.server 8080
```

Puis ouvrir `http://127.0.0.1:8080/site/` (ou `site/index.html` en `file://` — les liens relatifs vers `docs/` restent valides).

## Kit content

- Add or edit markdown under `kit/markdown/`.
- Declare build order in `kit/manifest.txt` (one path per line, `#` for comments).

## Branding (CAN-45)

Place UX-approved assets under `assets/branding/` (see `assets/branding/README.md`). The LaTeX template includes the logo when `logo.pdf` or `logo.png` is present; chart colors are centralized as commented placeholders until UX signs off on exact values.

## Clean

```bash
make clean
```
