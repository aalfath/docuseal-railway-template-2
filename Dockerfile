# DocuSeal for Railway: the official image, pinned by version and digest.
# Bump the tag and digest together, and add a CHANGELOG.md entry.
FROM docuseal/docuseal:3.3.6@sha256:df78e750ec0df42c121225875714487998048c9c80f412c1d5a0b9290887ba5c

# Railway terminates TLS at its edge. With FORCE_SSL set, Rails treats every
# request as HTTPS (assume_ssl), sets secure cookies and builds https:// links.
ENV FORCE_SSL=true

# Attachments, the generated docuseal.env and the embedded Redis data live here.
# Mount a volume at this path.
WORKDIR /data/docuseal

EXPOSE 3000

# Same start command as upstream. Puma listens on $PORT (default 3000).
CMD ["/app/bin/bundle", "exec", "puma", "-C", "/app/config/puma.rb", "--dir", "/app"]
