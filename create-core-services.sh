#!/bin/bash

echo "🏗️ Creating core services..."

# API Service
mkdir -p services/api/app/api
cat > services/api/package.json << 'PKG'
{
  "name": "@blackroad/api",
  "version": "1.0.0",
  "private": true,
  "description": "BlackRoad OS API Gateway",
  "scripts": {
    "dev": "next dev -p 3100",
    "build": "next build",
    "start": "next start -p 3100",
    "lint": "next lint",
    "type-check": "tsc --noEmit"
  },
  "dependencies": {
    "next": "14.2.0",
    "react": "^18.3.0",
    "react-dom": "^18.3.0",
    "@blackroad/shared": "workspace:*"
  },
  "devDependencies": {
    "@types/node": "^20",
    "typescript": "^5",
    "eslint": "^8",
    "eslint-config-next": "14.2.0"
  }
}
PKG

# Auth Service
mkdir -p services/auth/app/api
cat > services/auth/package.json << 'PKG'
{
  "name": "@blackroad/auth",
  "version": "1.0.0",
  "private": true,
  "description": "BlackRoad OS Authentication Service",
  "scripts": {
    "dev": "next dev -p 3101",
    "build": "next build",
    "start": "next start -p 3101",
    "lint": "next lint",
    "type-check": "tsc --noEmit"
  },
  "dependencies": {
    "next": "14.2.0",
    "react": "^18.3.0",
    "react-dom": "^18.3.0",
    "@blackroad/shared": "workspace:*"
  },
  "devDependencies": {
    "@types/node": "^20",
    "typescript": "^5",
    "eslint": "^8",
    "eslint-config-next": "14.2.0"
  }
}
PKG

# Billing Service
mkdir -p services/billing/app/api
cat > services/billing/package.json << 'PKG'
{
  "name": "@blackroad/billing",
  "version": "1.0.0",
  "private": true,
  "description": "BlackRoad OS Billing & Subscriptions",
  "scripts": {
    "dev": "next dev -p 3102",
    "build": "next build",
    "start": "next start -p 3102",
    "lint": "next lint",
    "type-check": "tsc --noEmit"
  },
  "dependencies": {
    "next": "14.2.0",
    "react": "^18.3.0",
    "react-dom": "^18.3.0",
    "@blackroad/shared": "workspace:*",
    "stripe": "^14.0.0"
  },
  "devDependencies": {
    "@types/node": "^20",
    "typescript": "^5",
    "eslint": "^8",
    "eslint-config-next": "14.2.0"
  }
}
PKG

# Analytics Service
mkdir -p services/analytics/app/api
cat > services/analytics/package.json << 'PKG'
{
  "name": "@blackroad/analytics",
  "version": "1.0.0",
  "private": true,
  "description": "BlackRoad OS Analytics Pipeline",
  "scripts": {
    "dev": "next dev -p 3103",
    "build": "next build",
    "start": "next start -p 3103",
    "lint": "next lint",
    "type-check": "tsc --noEmit"
  },
  "dependencies": {
    "next": "14.2.0",
    "react": "^18.3.0",
    "react-dom": "^18.3.0",
    "@blackroad/shared": "workspace:*"
  },
  "devDependencies": {
    "@types/node": "^20",
    "typescript": "^5",
    "eslint": "^8",
    "eslint-config-next": "14.2.0"
  }
}
PKG

echo "✅ Core services created!"
