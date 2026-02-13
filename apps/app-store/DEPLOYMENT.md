# 🚀 Deploying BlackRoad OS App Store

## Quick Deploy Options

### 1. Cloudflare Pages (Recommended - FREE!)

```bash
# Install Wrangler CLI
npm install -g wrangler

# Deploy web storefront
cd web
npx wrangler pages deploy out --project-name blackroad-store

# Deploy API
cd ../api
npx wrangler deploy
```

Your store will be live at: `blackroad-store.pages.dev`

**Benefits:**
- 🆓 100% free
- ⚡ Global CDN
- 🔐 Automatic HTTPS
- 📊 Analytics included

### 2. Vercel (Also FREE!)

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
cd web
vercel --prod
```

### 3. Your Own Domain

1. **Buy a domain**: Get `yourapps.com` from Namecheap ($10/year)
2. **Point DNS** to Cloudflare/Vercel
3. **Deploy** as above
4. **Done!** Your store at `yourapps.com`

## Production Checklist

- [ ] Environment variables configured
- [ ] Database set up (PostgreSQL on Railway/Supabase)
- [ ] CDN for app binaries (Cloudflare R2)
- [ ] Analytics enabled
- [ ] Custom domain configured
- [ ] SSL certificate (automatic with Cloudflare/Vercel)

## Cost Breakdown

| Service | Cost | Notes |
|---------|------|-------|
| Cloudflare Pages | $0 | Unlimited bandwidth |
| Cloudflare R2 | ~$1/mo | 10GB storage |
| PostgreSQL | $5/mo | Railway/Supabase free tier |
| Domain | $10/yr | .com domain |
| **Total** | **~$6/mo** | vs App Store $99/yr + 30% fees |

## Going Live

```bash
# 1. Deploy storefront
cd ~/blackroad-app-store/web
npm run build
npx wrangler pages deploy out --project-name blackroad-store

# 2. Deploy API
cd ../api
npx wrangler deploy

# 3. Update environment variables
echo "STORE_URL=https://blackroad-store.pages.dev" > .env
echo "API_URL=https://api.blackroad-store.pages.dev" >> .env

# 4. Test it!
curl https://blackroad-store.pages.dev
```

## Scaling

Free tier handles:
- ✅ 100K requests/day
- ✅ Unlimited apps
- ✅ Unlimited users
- ✅ Global CDN

When you grow bigger:
- Cloudflare: Still free (no bandwidth charges)
- Railway: $5/mo → $20/mo for database
- R2: $1/mo → ~$10/mo for storage

**You'll save thousands vs Apple/Google fees!**

---

🌟 Your store. Your rules. Your freedom.
