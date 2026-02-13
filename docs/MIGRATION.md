# Migration Guide

This guide helps you migrate existing BlackRoad services into the monorepo.

## Prerequisites

- Node.js >= 20.0.0
- pnpm >= 8.0.0
- Git

## Step 1: Choose Package Location

Determine where your service belongs:

- `apps/*` - End-user applications (web, mobile, dashboard)
- `services/*` - Backend microservices (API, auth, billing)
- `packages/*` - Shared libraries (UI, utilities, types)
- `agents/*` - AI agent definitions and orchestration

## Step 2: Create Package Directory

```bash
mkdir -p apps/your-service
# or
mkdir -p services/your-service
# or
mkdir -p packages/your-library
```

## Step 3: Copy Service Files

```bash
# Copy from existing location
cp -r ~/services/web/* apps/web/

# Or clone from GitHub
cd apps
gh repo clone blackboxprogramming/blackroad-web web
```

## Step 4: Update package.json

Update the package.json to use workspace dependencies:

```json
{
  "name": "@blackroad/your-service",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "type-check": "tsc --noEmit"
  },
  "dependencies": {
    "@blackroad/shared": "workspace:*",
    "@blackroad/types": "workspace:*",
    "@blackroad/ui": "workspace:*"
  }
}
```

## Step 5: Install Dependencies

```bash
# From monorepo root
pnpm install
```

## Step 6: Test the Service

```bash
# Run in dev mode
pnpm dev --filter=@blackroad/your-service

# Build
pnpm build --filter=@blackroad/your-service

# Lint
pnpm lint --filter=@blackroad/your-service
```

## Step 7: Update CI/CD

No action needed! The monorepo CI/CD automatically detects and builds changed packages.

## Migration Checklist

### For Next.js Apps

- [ ] Copy app files to `apps/<name>/`
- [ ] Update package.json name to `@blackroad/<name>`
- [ ] Replace shared code with `@blackroad/shared`
- [ ] Update imports to use workspace packages
- [ ] Test dev server
- [ ] Test production build
- [ ] Update environment variables

### For Node.js Services

- [ ] Copy service files to `services/<name>/`
- [ ] Update package.json name to `@blackroad/<name>`
- [ ] Add health check endpoints
- [ ] Update imports to use workspace packages
- [ ] Test service locally
- [ ] Update deployment configuration

### For Shared Libraries

- [ ] Copy library files to `packages/<name>/src/`
- [ ] Create package.json with exports
- [ ] Add TypeScript configuration
- [ ] Build and test
- [ ] Update dependent packages

### For Agents

- [ ] Copy agent configs to `agents/definitions/`
- [ ] Update to use `@blackroad/agent-sdk`
- [ ] Test agent execution
- [ ] Update orchestration configs

## Common Issues

### Issue: Module not found

**Solution**: Run `pnpm install` from monorepo root

### Issue: Type errors

**Solution**: Ensure `@blackroad/types` is in dependencies and run `pnpm type-check`

### Issue: Build failures

**Solution**: Check for circular dependencies with `turbo run build --graph`

### Issue: Environment variables not loaded

**Solution**: Copy `.env.example` to `.env` in service directory

## Bulk Migration Script

For migrating multiple services at once:

```bash
#!/bin/bash

SERVICES=("web" "api" "prism" "operator")

for service in "${SERVICES[@]}"; do
  echo "Migrating $service..."
  
  # Clone from GitHub
  cd apps
  gh repo clone blackboxprogramming/blackroad-$service $service
  
  # Update package.json
  cd $service
  jq '.name = "@blackroad/'$service'"' package.json > tmp.json && mv tmp.json package.json
  
  cd ../..
done

# Install all dependencies
pnpm install

# Build all services
pnpm build

echo "Migration complete!"
```

## Next Steps

After migration:

1. Commit changes to monorepo
2. Update documentation
3. Configure deployment targets
4. Set up monitoring
5. Archive old repositories

## Support

For migration help, see:
- [Architecture Guide](./ARCHITECTURE.md)
- [Agent Development](./AGENTS.md)
- [Deployment Guide](./DEPLOYMENT.md)

---

**Need help?** Open an issue on GitHub
