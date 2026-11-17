# DocuSeal for Railway: the official image, pinned by version and digest.
# Bump the tag and digest together, and add a CHANGELOG.md entry.
FROM docuseal/docuseal:3.3.7@sha256:d2e998dd1fbf9c462a1749df38e4b93f03f8bc552865aad6350d01511d450a65

# Railway terminates TLS at its edge. With FORCE_SSL set, Rails treats every
# request as HTTPS (assume_ssl), sets secure cookies and builds https:// links.
ENV FORCE_SSL=true

# Attachments, the generated docuseal.env and the embedded Redis data live here.
# Mount a volume at this path.
WORKDIR /data/docuseal

EXPOSE 3000

# Same start command as upstream. Puma listens on $PORT (default 3000).
CMD ["/app/bin/bundle", "exec", "puma", "-C", "/app/config/puma.rb", "--dir", "/app"]
