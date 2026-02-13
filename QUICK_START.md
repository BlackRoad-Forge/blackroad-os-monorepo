# BlackRoad OS Monorepo - Quick Start Guide

## ⚡ Instant Setup (< 5 minutes)

```bash
# 1. Navigate to monorepo
cd ~/blackroad-os-monorepo

# 2. Install all dependencies
pnpm install

# 3. Build shared packages
pnpm build --filter="@blackroad/shared" --filter="@blackroad/agent-sdk"

# 4. Start development
pnpm dev
```

## 🎯 Common Commands

### Development
```bash
# Run all services
pnpm dev

# Run specific app
pnpm dev --filter="@blackroad/web"
pnpm dev --filter="@blackroad/ai-dashboard"
pnpm dev --filter="@blackroad/lucidia"

# Run specific service
pnpm dev --filter="@blackroad/api"
pnpm dev --filter="@blackroad/auth"
```

### Building
```bash
# Build everything
pnpm build

# Build specific package
pnpm build --filter="@blackroad/web"

# Build dependencies first
pnpm build --filter="@blackroad/web..."
```

### Testing
```bash
# Lint all code
pnpm lint

# Type check all packages
pnpm type-check

# Run tests (when available)
pnpm test
```

### Deployment
```bash
# Deploy to Cloudflare
pnpm deploy:cloudflare

# Deploy to Railway
pnpm deploy:railway

# Deploy edge functions
pnpm deploy:edge
```

## 📦 Package Structure

```
@blackroad/web              → apps/web/
@blackroad/apps             → apps/apps/
@blackroad/app-store        → apps/app-store/
@blackroad/ai-dashboard     → apps/ai-dashboard/
@blackroad/lucidia          → apps/lucidia/
@blackroad/metaverse        → apps/metaverse/

@blackroad/vscode-extension → tooling/vscode-extension/
@blackroad/chrome-extension → tooling/chrome-extension/
@blackroad/raycast          → tooling/raycast/

@blackroad/zapier           → services/zapier/
@blackroad/notion           → services/notion/
@blackroad/api              → services/api/
@blackroad/auth             → services/auth/

@blackroad/shared           → packages/shared/
@blackroad/agent-sdk        → packages/agent-sdk/
@blackroad/api-sdks         → packages/api-sdks/
```

## 🚀 Working on a Specific Product

### Example: Web App
```bash
# 1. Navigate to app
cd apps/web

# 2. Run dev server
pnpm dev

# 3. Open browser
open http://localhost:3000
```

### Example: VS Code Extension
```bash
# 1. Navigate to extension
cd tooling/vscode-extension

# 2. Install dependencies (if needed)
pnpm install

# 3. Build extension
pnpm build

# 4. Test in VS Code
# Press F5 in VS Code to launch extension
```

## 🔧 Adding New Products

### New App
```bash
# 1. Create directory
mkdir -p apps/my-new-app

# 2. Initialize package.json
cat > apps/my-new-app/package.json << JSON
{
  "name": "@blackroad/my-new-app",
  "version": "1.0.0",
  "dependencies": {
    "@blackroad/shared": "workspace:*"
  }
}
JSON

# 3. Install dependencies
pnpm install

# 4. Build
pnpm build --filter="@blackroad/my-new-app"
```

## 🐛 Troubleshooting

### "Module not found"
```bash
# Clear and reinstall
rm -rf node_modules pnpm-lock.yaml
pnpm install
```

### "Build failed"
```bash
# Build with verbose output
pnpm build --filter="@blackroad/web" --verbose

# Check dependency graph
turbo run build --graph
```

### "Type errors"
```bash
# Check types
pnpm type-check

# View specific errors
cd apps/web && pnpm type-check
```

## 📚 Resources

- **Main README**: [README.md](./README.md)
- **Setup Guide**: [SETUP_COMPLETE.md](./SETUP_COMPLETE.md)
- **Product Inventory**: [PRODUCT_INVENTORY.md](./PRODUCT_INVENTORY.md)
- **Architecture**: [docs/ARCHITECTURE.md](./docs/ARCHITECTURE.md)
- **Migration Guide**: [docs/MIGRATION.md](./docs/MIGRATION.md)

## 🎓 Key Concepts

### Workspace Dependencies
```json
{
  "dependencies": {
    "@blackroad/shared": "workspace:*"
  }
}
```
This links to the local package in the monorepo.

### Turborepo Filters
```bash
--filter="@blackroad/web"        # Specific package
--filter="@blackroad/web..."     # Package + dependencies
--filter="..@blackroad/web"      # Package + dependents
--filter="[HEAD^1]"              # Changed packages
```

### Build Order
Turborepo automatically determines build order based on dependencies.
Packages are built in parallel when possible.

## ✅ Quick Checklist

Before committing:
- [ ] Run `pnpm lint`
- [ ] Run `pnpm type-check`
- [ ] Test locally with `pnpm dev`
- [ ] Build succeeds with `pnpm build`

## 🆘 Need Help?

1. Check documentation in `docs/`
2. Review `PRODUCT_INVENTORY.md` for product locations
3. Check GitHub Issues
4. Review existing package.json files for examples

---

**Last Updated**: 2026-02-13  
**Monorepo Version**: 1.0.0  
**Total Products**: 29 packages
