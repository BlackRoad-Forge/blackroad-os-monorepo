# BlackRoad OS Monorepo

🚀 **Complete unified monorepo** for BlackRoad OS - Browser-native operating system with AI agent orchestration.

## 📊 Scale

- **15+ GitHub organizations**
- **1000+ AI agents** (targeting 30K → 1M users → 30B users)
- **19 domains** across infrastructure
- **24+ services** deployed across multiple platforms

## 🏗️ Architecture

### Monorepo Structure

```
blackroad-os-monorepo/
├── apps/                    # End-user applications
│   ├── web/                # Main marketing site (Next.js)
│   ├── console/            # Prism Console (Next.js)
│   ├── dashboard/          # Admin dashboard (Next.js)
│   └── mobile/             # React Native mobile app
│
├── services/               # Backend microservices
│   ├── api/               # API Gateway (Node.js)
│   ├── auth/              # Authentication service
│   ├── billing/           # Billing & subscriptions
│   ├── analytics/         # Analytics pipeline
│   └── gateway/           # APISIX configuration
│
├── packages/              # Shared packages
│   ├── shared/           # Common utilities
│   ├── ui/               # Design system components
│   ├── config/           # Shared configurations
│   ├── types/            # TypeScript definitions
│   └── agent-sdk/        # SDK for agent development
│
├── agents/                # AI Agent ecosystem
│   ├── definitions/      # 1000+ agent configs (YAML/JSON)
│   ├── orchestration/    # LangGraph + CrewAI orchestrators
│   ├── memory/           # PS-SHA∞ memory system
│   └── communication/    # NATS event bus integration
│
├── infrastructure/        # Infrastructure as Code
│   ├── cloudflare/       # Workers, KV, R2, D1
│   ├── railway/          # Railway service configs
│   ├── kubernetes/       # K3s manifests (Alice/Octavia)
│   └── raspberry-pi/     # Local LLM deployment configs
│
└── tooling/              # Developer tools
    ├── cli/             # BlackRoad CLI
    ├── scripts/         # Automation scripts
    ├── deployment/      # CI/CD configurations
    └── monitoring/      # Observability setup
```

## 🛠️ Tech Stack

### Core Technologies
- **Agents**: LangGraph + CrewAI
- **LLM**: vLLM + llama.cpp
- **Vectors**: Milvus
- **Messaging**: NATS (pub/sub event bus)
- **MLOps**: Kubeflow + Langfuse
- **API Gateway**: APISIX
- **Blockchain**: Besu (RoadChain)
- **Metaverse**: Ethereal Engine

### Frontend
- **Framework**: Next.js 14 (App Router)
- **UI**: Browser-native OS (web-based)
- **Mobile**: React Native

### Infrastructure
- **Edge**: Cloudflare (Workers, KV, R2, D1)
- **Compute**: Railway, DigitalOcean Droplets
- **Local**: Raspberry Pis, Jetson Orin Nano
- **Orchestration**: K3s (Alice/Octavia cluster)

### Domains (19 total)
- `blackroad.io` - Main platform
- `lucidia.earth` - AI system
- `roadchain.io` - Blockchain
- `aliceqi.com` - AI intelligence
- +15 more specialized domains

## 🚀 Quick Start

### Prerequisites
- Node.js >= 20.0.0
- pnpm >= 8.0.0
- Docker (for local services)

### Installation

```bash
# Install dependencies
pnpm install

# Run all services in dev mode
pnpm dev

# Build all packages
pnpm build

# Run tests
pnpm test

# Lint all code
pnpm lint
```

### Development Workflow

```bash
# Work on specific app
cd apps/web
pnpm dev

# Work on specific service
cd services/api
pnpm dev

# Build specific package
pnpm build --filter=@blackroad/ui

# Run selective builds
turbo run build --filter=@blackroad/web...
```

## 📦 Package Naming

All packages follow the `@blackroad/<name>` convention:

- `@blackroad/web` - Web application
- `@blackroad/ui` - UI components
- `@blackroad/shared` - Shared utilities
- `@blackroad/agent-sdk` - Agent development SDK

## 🚢 Deployment

### Multi-Platform Deployment

```bash
# Deploy to Cloudflare
pnpm deploy:cloudflare

# Deploy to Railway
pnpm deploy:railway

# Deploy edge functions
pnpm deploy:edge
```

### Environment-Specific Deploys

```bash
# Staging
turbo run deploy --filter='*' --env=staging

# Production
turbo run deploy --filter='*' --env=production
```

### Platform-Specific Targets

- **Cloudflare Workers**: Edge functions, API routes
- **Cloudflare Pages**: Static sites, Next.js apps
- **Railway**: Backend services, databases
- **K3s**: Agent orchestration, memory systems
- **Raspberry Pi**: Local LLM inference

## 🤖 Agent System

### Event Bus Architecture
- **NATS** for pub/sub messaging
- **PS-SHA∞** for memory persistence (append-only journals)
- **Milvus** for vector storage

### Agent Organization
```
agents/
├── definitions/          # 1000+ agent YAML/JSON configs
│   ├── tier-1/          # Core system agents
│   ├── tier-2/          # Domain-specific agents
│   └── tier-3/          # User-created agents
├── orchestration/       # LangGraph + CrewAI workflows
├── memory/              # Memory persistence system
└── communication/       # NATS integration
```

## 📝 Independent Versioning

Each package can be versioned independently:

```json
{
  "name": "@blackroad/ui",
  "version": "2.1.0"
}
```

Cross-package compatibility is managed through:
- Semantic versioning
- Dependency constraints
- Integration tests

## 🔄 CI/CD Strategy

### Selective Builds
Turborepo only builds changed packages and their dependents:

```bash
# Only build affected packages
turbo run build --filter=[HEAD^1]
```

### Multi-Environment Pipeline
```yaml
- Build changed packages
- Run tests for affected packages
- Deploy to staging (auto)
- Deploy to production (manual approval)
```

### Platform Detection
CI automatically detects target platform from package metadata:
- Cloudflare Workers → `wrangler deploy`
- Railway → `railway up`
- K3s → `kubectl apply`

## 📚 Documentation

- [Architecture Guide](./docs/ARCHITECTURE.md)
- [Agent Development](./docs/AGENTS.md)
- [Deployment Guide](./docs/DEPLOYMENT.md)
- [Contributing](./CONTRIBUTING.md)

## 🔑 Key Features

✅ **Unified codebase** - All services in one repo  
✅ **Fast builds** - Turborepo caching and parallelization  
✅ **Independent versioning** - Each package versions separately  
✅ **Multi-platform** - Deploy to Cloudflare, Railway, K3s, Pi  
✅ **Type-safe** - Shared TypeScript types across packages  
✅ **Event-driven** - NATS-based agent communication  
✅ **Scalable** - From 1K to 30K to 1M agents  

## 📄 License

Proprietary - BlackRoad OS Inc.

## 🤝 Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for development workflow.

---

**Built with ❤️ by BlackRoad OS**  
Targeting: 30K agents → 1M users → 30B users
