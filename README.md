# DocuSeal on Railway

A Railway template for [DocuSeal](https://www.docuseal.com), the open-source document signing app. You build PDF forms, send them out for signing and keep the signed copies, on your own server.

## What it deploys

| Service | Source | Notes |
|---|---|---|
| `DocuSeal` | this repo (`Dockerfile`) | DocuSeal **3.3.6** (`docuseal/docuseal:3.3.6@sha256:df78e750…`), public domain, health check `/up`, volume at `/data/docuseal` |
| `Postgres` | Railway Postgres | the app's database |

DocuSeal runs its own Redis and background jobs inside the app container. Uploaded documents, signed copies and the Redis data are stored on the volume.

## Variables

| Variable | Value | Why |
|---|---|---|
| `DATABASE_URL` | `${{Postgres.DATABASE_URL}}` | private-network connection to Postgres |
| `SECRET_KEY_BASE` | `${{secret(128,"abcdef0123456789")}}` | generated at deploy; signs sessions and encrypts stored settings. Don't change it after first boot |
| `PORT` | `3000` | the port Puma listens on |

`FORCE_SSL=true` is set in the `Dockerfile`, because Railway serves the app over HTTPS.

Optional settings you can add later in Railway (see the [DocuSeal docs](https://www.docuseal.com/docs)): SMTP settings (`SMTP_ADDRESS`, `SMTP_PORT`, `SMTP_USERNAME`, `SMTP_PASSWORD`, `SMTP_FROM`) so DocuSeal can email signing requests, S3, Google Cloud Storage or Azure storage for attachments, and `APP_URL` to fix the app's URL.

## First run

Open the app's URL right after the deploy finishes. The first visitor gets the setup page and creates the admin account. Until then, anyone who finds the URL could claim it.

## Updates

The service builds from this repo's `Dockerfile`. When a new DocuSeal release is tested, the pin is bumped here and an entry is added to `CHANGELOG.md`. Railway then shows an "update available" notice on your project, and you choose when to apply it. Back up the volume and Postgres before a major version.

## License

The wrapper files in this repo are MIT. DocuSeal itself is AGPL-3.0 with [additional terms](https://github.com/docusealco/docuseal/blob/master/LICENSE_ADDITIONAL_TERMS).
