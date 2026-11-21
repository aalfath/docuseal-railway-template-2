# Changelog

Each entry is one version of this template. Breaking changes come first.
Deployers get an "update available" notice in Railway when a change is merged to `main`. Read the entry before you apply it.

## 3.3.8 (2026-11-21): security release

- No breaking changes. Documents, attachments and settings in Postgres and on the `/data/docuseal` volume are kept; DocuSeal runs its own database migrations at start.
- DocuSeal [3.3.8](https://github.com/docusealco/docuseal/releases/tag/3.3.8) is a security release: it updates Ruby to 4.0.10, which fixes several memory-management vulnerabilities in the Ruby interpreter ([GHSA-78g6-f52x-q3jx](https://github.com/docusealco/docuseal/security/advisories/GHSA-78g6-f52x-q3jx)).
- Image: `docuseal/docuseal:3.3.8@sha256:d67335c0cb3142818a39878ab67a0d0af2a653220e2203b042796dd1321a4a9c`.

## 3.3.7 (2026-11-17)

- No breaking changes. Documents, attachments and settings in Postgres and on the `/data/docuseal` volume are kept; DocuSeal runs its own database migrations at start.
- DocuSeal [3.3.7](https://github.com/docusealco/docuseal/releases/tag/3.3.7): bug fixes, security and performance improvements.
- Image: `docuseal/docuseal:3.3.7@sha256:d2e998dd1fbf9c462a1749df38e4b93f03f8bc552865aad6350d01511d450a65`.

## 3.3.6-1 (2026-11-16)

- README: add the Deploy on Railway button for the published template `docuseal-2` (https://railway.com/deploy/docuseal-2). No change to the app or its configuration.

## 3.3.6 (2026-11-16)

- First release: DocuSeal [3.3.6](https://github.com/docusealco/docuseal/releases/tag/3.3.6) (`docuseal/docuseal:3.3.6@sha256:df78e750ec0df42c121225875714487998048c9c80f412c1d5a0b9290887ba5c`), Railway Postgres, a volume at `/data/docuseal`, a health check on `/up`, and `FORCE_SSL=true`.
