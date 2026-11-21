# DocuSeal for Railway: the official image, pinned by version and digest.
# Bump the tag and digest together, and add a CHANGELOG.md entry.
FROM docuseal/docuseal:3.3.8@sha256:d67335c0cb3142818a39878ab67a0d0af2a653220e2203b042796dd1321a4a9c

# Railway terminates TLS at its edge. With FORCE_SSL set, Rails treats every
# request as HTTPS (assume_ssl), sets secure cookies and builds https:// links.
ENV FORCE_SSL=true

# Attachments, the generated docuseal.env and the embedded Redis data live here.
# Mount a volume at this path.
WORKDIR /data/docuseal

EXPOSE 3000

# Same start command as upstream. Puma listens on $PORT (default 3000).
CMD ["/app/bin/bundle", "exec", "puma", "-C", "/app/config/puma.rb", "--dir", "/app"]
