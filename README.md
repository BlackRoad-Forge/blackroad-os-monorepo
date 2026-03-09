# BlackRoad OS Monorepo

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
