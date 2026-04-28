# Changelog

All notable changes to paper7 are documented here.

## [0.6.0-beta.0] - 2026-04-28

### Changed

- Rewrote paper7 as the `@guataiba/paper7` TypeScript npm CLI.
- Switched command parsing and routing to `effect/unstable/cli`.
- Replaced legacy shell smoke coverage with deterministic `@effect/vitest` suites.
- Removed the legacy shell implementation and retained shell smoke scripts.

### Security

- Removed remote shell installer path from docs and package surface.
- Kept npm package install-time hooks empty and runtime dependencies limited to Effect packages.
