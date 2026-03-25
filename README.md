<!-- BlackRoad SEO Enhanced -->

# ulackroad os monorepo

> Part of **[BlackRoad OS](https://blackroad.io)** — Sovereign Computing for Everyone

[![BlackRoad OS](https://img.shields.io/badge/BlackRoad-OS-ff1d6c?style=for-the-badge)](https://blackroad.io)
[![BlackRoad-Forge](https://img.shields.io/badge/Org-BlackRoad-Forge-2979ff?style=for-the-badge)](https://github.com/BlackRoad-Forge)

**ulackroad os monorepo** is part of the **BlackRoad OS** ecosystem — a sovereign, distributed operating system built on edge computing, local AI, and mesh networking by **BlackRoad OS, Inc.**

### BlackRoad Ecosystem
| Org | Focus |
|---|---|
| [BlackRoad OS](https://github.com/BlackRoad-OS) | Core platform |
| [BlackRoad OS, Inc.](https://github.com/BlackRoad-OS-Inc) | Corporate |
| [BlackRoad AI](https://github.com/BlackRoad-AI) | AI/ML |
| [BlackRoad Hardware](https://github.com/BlackRoad-Hardware) | Edge hardware |
| [BlackRoad Security](https://github.com/BlackRoad-Security) | Cybersecurity |
| [BlackRoad Quantum](https://github.com/BlackRoad-Quantum) | Quantum computing |
| [BlackRoad Agents](https://github.com/BlackRoad-Agents) | AI agents |
| [BlackRoad Network](https://github.com/BlackRoad-Network) | Mesh networking |

**Website**: [blackroad.io](https://blackroad.io) | **Chat**: [chat.blackroad.io](https://chat.blackroad.io) | **Search**: [search.blackroad.io](https://search.blackroad.io)

---


Turborepo-based monorepo for the BlackRoad OS platform — web apps, backend services, shared packages, and infrastructure configs.

## Structure

```
apps/
  web/              # Marketing site + dashboard (Next.js 14)
  ai-dashboard/     # AI agent monitoring (Next.js)
  console/          # Prism Console (Next.js)
services/
  api/              # API Gateway (Node.js)
  auth/             # Authentication
  billing/          # Subscriptions
  analytics/        # Analytics pipeline
packages/
  shared/           # Common utilities
  ui/               # Design system components
  config/           # Shared configs
  types/            # TypeScript definitions
  agent-sdk/        # Agent development SDK
infrastructure/
  cloudflare/       # Workers, KV, R2, D1
  railway/          # Railway service configs
  raspberry-pi/     # Local LLM deployment
tooling/
  cli/              # BlackRoad CLI
  scripts/          # Automation
```

## Quick Start

```bash
pnpm install
pnpm dev          # Run all services
pnpm build        # Build all packages
pnpm test         # Run tests
```

### Work on a specific app

```bash
cd apps/web && pnpm dev
turbo run build --filter=@blackroad/web...
```

## Stack

- **Build:** Turborepo + pnpm workspaces
- **Frontend:** Next.js 14 (App Router), React
- **Backend:** Node.js microservices
- **Edge:** Cloudflare Workers, Pages, KV, R2, D1
- **Compute:** Railway, Raspberry Pi cluster
- **Messaging:** NATS (pub/sub)

## Deploy

```bash
pnpm deploy:cloudflare    # Edge + static
pnpm deploy:railway       # Backend services
```

Turborepo only builds changed packages and their dependents:

```bash
turbo run build --filter=[HEAD^1]
```

## Packages

All packages use the `@blackroad/<name>` convention with independent versioning.

## License

Copyright 2026 BlackRoad OS, Inc. All rights reserved.
