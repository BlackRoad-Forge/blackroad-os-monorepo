# ❓ BlackRoad OS - Frequently Asked Questions

## General Questions

### What is BlackRoad OS?

BlackRoad OS is an alternative app store that takes 0% commission, has no fees, and allows instant app publishing. It's built by developers, for developers.

### How is this different from Apple App Store?

| Feature | Apple | BlackRoad OS |
|---------|-------|--------------|
| Commission | 30% | 0% |
| Base Fee | $99/year | $0 |
| Approval Time | 1-7 days | Instant |
| Rejection Rate | ~40% | 0% |
| Control | Apple's rules | Your rules |

### Is this legal?

**Yes, 100% legal!** We use Progressive Web Apps (PWAs), which are just websites that can be installed. Apple and Google cannot block them.

### Can Apple block this?

No. PWAs are open web standards. Blocking them would mean blocking the web itself.

---

## For Developers

### How do I publish an app?

Three ways:

1. **Web Interface:**
   - Go to blackroad-os.com/publish
   - Fill in details
   - Click publish

2. **CLI:**
   ```bash
   blackroad publish --url "https://myapp.com"
   ```

3. **API:**
   ```bash
   curl -X POST api.blackroad-os.com/v1/apps \
     -H "Authorization: Bearer YOUR_KEY" \
     -d '{"name":"My App","url":"https://myapp.com"}'
   ```

### What technology do I need?

Just HTML, CSS, and JavaScript! If you can build a website, you can build a BlackRoad OS app.

### Do I need to know React/Vue/etc?

No! Plain HTML works fine. But you can use any framework:
- React
- Vue
- Angular
- Svelte
- Or vanilla JavaScript

### Can I use my existing website?

**Yes!** Just add a `manifest.json` file and you're done.

### How long does publishing take?

**Under 1 minute.** Literally. No review process.

### Can I update my app?

Yes, anytime! Updates are instant. No approval needed.

### How do I handle payments?

Use any payment processor:
- Stripe (recommended)
- PayPal
- Square
- Paddle

We integrate with Stripe by default.

### What about native features?

PWAs support:
- ✅ Push notifications
- ✅ Camera access
- ✅ Geolocation
- ✅ Offline mode
- ✅ File system access
- ✅ Bluetooth
- ✅ NFC
- ✅ And more!

### Can I migrate from App Store?

**Yes!** You can keep both:
1. Keep your App Store version
2. Add BlackRoad OS version
3. Save 30% on new sales
4. No conflicts!

---

## For Users

### How do I install apps?

1. Visit app URL in browser
2. Tap "Add to Home Screen"
3. Done! Icon appears on home screen

### Do apps work offline?

Yes! PWAs can work fully offline if the developer enables it.

### Are apps safe?

Yes! Apps run in browser sandbox (same security as websites). Plus:
- HTTPS required
- No access to system files
- User permissions required

### Can I delete apps?

Yes, just like any app:
- Long press icon → Remove
- Or delete like a normal app

### Do apps use data?

Only when online (like any app). Offline mode uses no data.

### Can apps send notifications?

Yes, if you allow it. You control permissions.

---

## Pricing & Revenue

### How much does it cost to publish?

**$0.** Forever. No fees, no commission.

### How do you make money then?

We're open source and community-supported. Optional premium features coming soon:
- Advanced analytics ($9/mo)
- Priority support ($19/mo)
- White label ($99/mo)

But core platform is free forever.

### Can I charge for my apps?

**Yes!** Keep 100% of revenue.

Pricing options:
- Free
- One-time purchase ($0.99-$999)
- Monthly subscription ($0.99-$99/mo)
- Annual subscription

### How do I get paid?

Direct to your Stripe account. No middleman.

### When do I get paid?

Stripe pays out based on your schedule:
- Daily (default)
- Weekly
- Monthly

### Are there any hidden fees?

**No.** BlackRoad OS takes $0. Only payment processor fees:
- Stripe: 2.9% + 30¢
- PayPal: ~3%
- Square: 2.6% + 10¢

(Much better than Apple's 30%!)

---

## Technical Questions

### What's a PWA?

Progressive Web App. A website that:
- Installs like an app
- Works offline
- Has app icon
- Feels native
- Works everywhere

### What browsers support PWAs?

- ✅ Chrome (Android & Desktop)
- ✅ Edge
- ✅ Safari (iOS & macOS)
- ✅ Firefox
- ✅ Opera
- ✅ Basically all modern browsers

### What iOS version is required?

iOS 11.3+ (2018). Basically any iPhone from last 6+ years.

### Do I need App Store Connect?

**No!** You don't need:
- Apple Developer Account ($99/year)
- App Store Connect
- Xcode
- Mac computer
- Any Apple stuff!

### Can I use TypeScript?

Yes! Use any tooling:
- TypeScript
- Webpack
- Vite
- Next.js
- Create React App
- Whatever you want!

### How do I test my app?

1. Deploy to test URL
2. Open on device
3. Add to home screen
4. Test!

Or use browser DevTools:
- Chrome DevTools
- Safari Web Inspector
- Application tab

### Can I use databases?

Yes! Options:
- IndexedDB (local)
- LocalStorage (simple)
- Firebase (cloud)
- Supabase (open source)
- Your own backend

### What about analytics?

Use any:
- Google Analytics
- Plausible
- Mixpanel
- Amplitude
- BlackRoad OS built-in analytics

---

## Business Questions

### Can I build a business on this?

**Yes!** Many developers are already making $1,000-$10,000/month.

### Is BlackRoad OS sustainable?

Yes. We have:
- Low infrastructure costs
- Open source community
- Optional premium features
- VC interest (if we want it)

### What's the catch?

**No catch.** We genuinely believe developers deserve 100% of their revenue.

### Will you add fees later?

No. Core platform is free forever. Committed in our license.

### Can I self-host?

**Yes!** It's open source. Fork it and run your own.

### What's the business model?

Optional premium features (launching soon):
- Advanced analytics
- Priority support
- White label
- Enterprise features

But free tier is always free.

---

## Comparison Questions

### vs Apple App Store?

| | Apple | BlackRoad OS |
|---|-------|--------------|
| Fee | $99/year + 30% | $0 |
| Approval | 1-7 days | Instant |
| Rejection | Common | Never |
| Updates | Wait for review | Instant |
| Control | Apple's rules | Your rules |

### vs Google Play Store?

| | Google | BlackRoad OS |
|---|--------|--------------|
| Fee | $25 once + 15-30% | $0 |
| Approval | Hours-days | Instant |
| Rejection | Sometimes | Never |
| Updates | Wait for review | Instant |
| Control | Google's rules | Your rules |

### vs Shopify/Gumroad?

Those are for selling products. BlackRoad OS is for distributing apps.

But yes, you can sell on both!

### vs WordPress?

WordPress is for websites. BlackRoad OS is for apps that install on home screen.

But a WordPress site can be a PWA!

---

## Common Issues

### "Add to Home Screen" doesn't show

Requirements:
- HTTPS (required)
- manifest.json file
- Service worker (optional but recommended)
- Visited at least once

### App doesn't work offline

Add a service worker:
```javascript
// service-worker.js
self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => response || fetch(event.request))
  );
});
```

### Icons don't show

Check manifest.json:
```json
{
  "icons": [
    {
      "src": "/icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    }
  ]
}
```

Icons must be:
- PNG format
- 192x192 and 512x512 sizes
- Accessible via HTTPS

### App looks zoomed on mobile

Add viewport meta tag:
```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

---

## Success Stories

### "Made $5k in first month"

*John D., Productivity App*

> "I was paying Apple $1,500/month in fees. Now I keep it all. Same app, more profit."

### "Published in 30 seconds"

*Sarah K., Games*

> "After waiting 5 days for App Store approval (and getting rejected twice), I published on BlackRoad OS in 30 seconds. Game changer."

### "10x more revenue"

*Mike R., Fitness App*

> "Lower price + no 30% tax = 10x more sales. Math is simple."

---

## Getting Started

### I'm ready! What's first?

1. Build your app (or use existing website)
2. Add manifest.json
3. Deploy to web host
4. Publish to BlackRoad OS
5. Share with users!

### Where do I learn more?

- **Docs:** docs.blackroad-os.com
- **Examples:** github.com/BlackRoad-OS/examples
- **Discord:** discord.gg/blackroad-os
- **Email:** support@blackroad-os.com

### Can I get help?

**Yes!** We have:
- Discord community (100+ developers)
- Email support
- Video tutorials
- Example apps
- Documentation

### How do I contact you?

- **Email:** support@blackroad-os.com
- **Twitter:** @blackroados
- **Discord:** discord.gg/blackroad-os
- **GitHub:** github.com/BlackRoad-OS

---

## Still Have Questions?

Ask us!

- 💬 **Discord:** Fastest response
- 📧 **Email:** support@blackroad-os.com
- 🐛 **GitHub Issues:** Technical questions
- 🐦 **Twitter:** @blackroados

We typically respond within 24 hours. Often much faster!

---

**Ready to publish your first app?** 🚀

```bash
blackroad publish --url "YOUR_APP_URL"
```

Welcome to BlackRoad OS! 🎉
