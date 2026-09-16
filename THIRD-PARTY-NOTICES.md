# THIRD-PARTY NOTICES — FarooqRemote-Server

The server is unmodified upstream rustdesk-server 1.1.16. Its Rust dependency inventory is `Cargo.lock` at tag 1.1.16 (Tokio, SQLx, Axum, sodiumoxide, reqwest, hbb_common and others). A generated SBOM (`cargo cyclonedx` or `cargo license`) is to be added at `farooqremote/docs/SBOM-server-1.1.16.txt` before the first public release — open item from the Phase 0 audit; requires the `libs/hbb_common` submodule initialised.

Deployment-time third parties:
- Docker Engine / Compose (Path A) — Apache 2.0.
- s6-overlay inside the upstream image — ISC.
- Ubuntu packages (Path B) — per Ubuntu.
