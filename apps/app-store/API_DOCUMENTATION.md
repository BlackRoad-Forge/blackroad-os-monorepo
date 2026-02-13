# 📚 BlackRoad OS - API Documentation

## Overview

BlackRoad OS provides a simple REST API for managing apps, users, and analytics.

**Base URL:** `https://api.blackroad-os.com/v1`

**Authentication:** Bearer token in Authorization header

---

## Authentication

### Get API Key

```bash
curl -X POST https://api.blackroad-os.com/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "developer@example.com",
    "password": "secure_password",
    "name": "John Doe"
  }'
```

**Response:**
```json
{
  "success": true,
  "user": {
    "id": "usr_abc123",
    "email": "developer@example.com",
    "apiKey": "sk_live_abc123xyz789"
  }
}
```

### Authenticate Requests

Include your API key in all requests:

```bash
curl https://api.blackroad-os.com/v1/apps \
  -H "Authorization: Bearer sk_live_abc123xyz789"
```

---

## Apps API

### List Your Apps

```bash
GET /apps
```

**Example:**
```bash
curl https://api.blackroad-os.com/v1/apps \
  -H "Authorization: Bearer sk_live_abc123xyz789"
```

**Response:**
```json
{
  "success": true,
  "apps": [
    {
      "id": "app_123",
      "name": "My Awesome App",
      "slug": "my-awesome-app",
      "icon": "🚀",
      "price": 4.99,
      "downloads": 1234,
      "revenue": 6165.66,
      "status": "published",
      "createdAt": "2024-01-15T10:30:00Z"
    }
  ],
  "total": 1
}
```

### Get Single App

```bash
GET /apps/:id
```

**Example:**
```bash
curl https://api.blackroad-os.com/v1/apps/app_123 \
  -H "Authorization: Bearer sk_live_abc123xyz789"
```

### Create New App

```bash
POST /apps
```

**Body:**
```json
{
  "name": "My New App",
  "description": "An amazing app that does cool things",
  "icon": "🎨",
  "category": "productivity",
  "price": 4.99,
  "url": "https://myapp.com",
  "screenshots": [
    "https://myapp.com/screenshot1.png",
    "https://myapp.com/screenshot2.png"
  ]
}
```

**Example:**
```bash
curl -X POST https://api.blackroad-os.com/v1/apps \
  -H "Authorization: Bearer sk_live_abc123xyz789" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "My New App",
    "description": "An amazing app",
    "icon": "🎨",
    "category": "productivity",
    "price": 4.99,
    "url": "https://myapp.com"
  }'
```

**Response:**
```json
{
  "success": true,
  "app": {
    "id": "app_456",
    "name": "My New App",
    "slug": "my-new-app",
    "status": "published",
    "publishedAt": "2024-01-16T15:45:00Z"
  }
}
```

### Update App

```bash
PATCH /apps/:id
```

**Example:**
```bash
curl -X PATCH https://api.blackroad-os.com/v1/apps/app_123 \
  -H "Authorization: Bearer sk_live_abc123xyz789" \
  -H "Content-Type: application/json" \
  -d '{
    "price": 9.99,
    "description": "Updated description"
  }'
```

### Delete App

```bash
DELETE /apps/:id
```

**Example:**
```bash
curl -X DELETE https://api.blackroad-os.com/v1/apps/app_123 \
  -H "Authorization: Bearer sk_live_abc123xyz789"
```

---

## Analytics API

### Get App Analytics

```bash
GET /apps/:id/analytics
```

**Parameters:**
- `startDate` (string): ISO date (e.g., "2024-01-01")
- `endDate` (string): ISO date
- `metrics` (string): Comma-separated list (views,downloads,revenue)

**Example:**
```bash
curl "https://api.blackroad-os.com/v1/apps/app_123/analytics?startDate=2024-01-01&endDate=2024-01-31&metrics=views,downloads,revenue" \
  -H "Authorization: Bearer sk_live_abc123xyz789"
```

**Response:**
```json
{
  "success": true,
  "analytics": {
    "views": 12543,
    "downloads": 1234,
    "revenue": 6165.66,
    "averageRating": 4.8,
    "totalReviews": 156,
    "dailyStats": [
      {
        "date": "2024-01-01",
        "views": 423,
        "downloads": 45,
        "revenue": 224.55
      }
    ]
  }
}
```

### Get Revenue Breakdown

```bash
GET /analytics/revenue
```

**Example:**
```bash
curl "https://api.blackroad-os.com/v1/analytics/revenue?startDate=2024-01-01&endDate=2024-01-31" \
  -H "Authorization: Bearer sk_live_abc123xyz789"
```

**Response:**
```json
{
  "success": true,
  "revenue": {
    "total": 15420.50,
    "byApp": [
      {
        "appId": "app_123",
        "appName": "My Awesome App",
        "revenue": 6165.66
      }
    ],
    "byDay": [
      {
        "date": "2024-01-01",
        "revenue": 224.55
      }
    ]
  }
}
```

---

## Users API

### Get User Profile

```bash
GET /user
```

**Example:**
```bash
curl https://api.blackroad-os.com/v1/user \
  -H "Authorization: Bearer sk_live_abc123xyz789"
```

**Response:**
```json
{
  "success": true,
  "user": {
    "id": "usr_abc123",
    "email": "developer@example.com",
    "name": "John Doe",
    "plan": "pro",
    "appsCount": 5,
    "totalRevenue": 15420.50,
    "createdAt": "2024-01-01T00:00:00Z"
  }
}
```

### Update Profile

```bash
PATCH /user
```

**Example:**
```bash
curl -X PATCH https://api.blackroad-os.com/v1/user \
  -H "Authorization: Bearer sk_live_abc123xyz789" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Jane Doe",
    "bio": "Full-stack developer"
  }'
```

---

## Webhooks

BlackRoad OS can send webhooks to your server when events occur.

### Setup Webhook

```bash
POST /webhooks
```

**Body:**
```json
{
  "url": "https://myapp.com/webhooks",
  "events": ["app.download", "payment.success", "review.created"]
}
```

### Webhook Events

**app.download**
```json
{
  "event": "app.download",
  "timestamp": "2024-01-16T15:45:00Z",
  "data": {
    "appId": "app_123",
    "userId": "usr_456",
    "platform": "ios"
  }
}
```

**payment.success**
```json
{
  "event": "payment.success",
  "timestamp": "2024-01-16T15:45:00Z",
  "data": {
    "appId": "app_123",
    "userId": "usr_456",
    "amount": 4.99,
    "currency": "USD",
    "paymentId": "pay_789"
  }
}
```

**review.created**
```json
{
  "event": "review.created",
  "timestamp": "2024-01-16T15:45:00Z",
  "data": {
    "appId": "app_123",
    "userId": "usr_456",
    "rating": 5,
    "comment": "Great app!"
  }
}
```

---

## Rate Limits

- **Free tier:** 100 requests/hour
- **Pro tier:** 1,000 requests/hour
- **Enterprise tier:** 10,000 requests/hour

Rate limit headers:
```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1705423200
```

---

## Error Handling

All errors follow this format:

```json
{
  "success": false,
  "error": {
    "code": "INVALID_REQUEST",
    "message": "App name is required",
    "details": {
      "field": "name"
    }
  }
}
```

### Error Codes

- `INVALID_REQUEST` - Bad request format
- `UNAUTHORIZED` - Invalid or missing API key
- `NOT_FOUND` - Resource not found
- `RATE_LIMITED` - Too many requests
- `SERVER_ERROR` - Internal server error

---

## SDK Libraries

### JavaScript/Node.js

```bash
npm install @blackroad-os/sdk
```

```javascript
const BlackRoadOS = require('@blackroad-os/sdk');

const client = new BlackRoadOS({
  apiKey: 'sk_live_abc123xyz789'
});

// Create app
const app = await client.apps.create({
  name: 'My App',
  price: 4.99
});

// Get analytics
const analytics = await client.analytics.get('app_123', {
  startDate: '2024-01-01',
  endDate: '2024-01-31'
});
```

### Python

```bash
pip install blackroad-os
```

```python
from blackroad_os import Client

client = Client(api_key='sk_live_abc123xyz789')

# Create app
app = client.apps.create(
    name='My App',
    price=4.99
)

# Get analytics
analytics = client.analytics.get('app_123',
    start_date='2024-01-01',
    end_date='2024-01-31'
)
```

### Ruby

```bash
gem install blackroad-os
```

```ruby
require 'blackroad_os'

client = BlackRoadOS::Client.new(
  api_key: 'sk_live_abc123xyz789'
)

# Create app
app = client.apps.create(
  name: 'My App',
  price: 4.99
)

# Get analytics
analytics = client.analytics.get('app_123',
  start_date: '2024-01-01',
  end_date: '2024-01-31'
)
```

---

## Quick Start Examples

### Publish Your First App

```bash
# 1. Sign up and get API key
curl -X POST https://api.blackroad-os.com/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "you@example.com",
    "password": "your_password",
    "name": "Your Name"
  }'

# 2. Create your app
curl -X POST https://api.blackroad-os.com/v1/apps \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "My First App",
    "description": "My awesome app",
    "icon": "🚀",
    "price": 4.99,
    "url": "https://myapp.com"
  }'

# 3. That's it! Your app is live!
```

### Track Revenue

```bash
# Get all-time revenue
curl https://api.blackroad-os.com/v1/analytics/revenue \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Setup Webhook

```bash
# Get notified of new downloads
curl -X POST https://api.blackroad-os.com/v1/webhooks \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "url": "https://myapp.com/webhook",
    "events": ["app.download"]
  }'
```

---

## Support

- **Documentation:** https://docs.blackroad-os.com
- **Email:** api@blackroad-os.com
- **Discord:** https://discord.gg/blackroad-os
- **GitHub:** https://github.com/BlackRoad-OS/blackroad-app-store

---

## Changelog

### v1.0.0 (2024-01-16)
- Initial API release
- Apps CRUD operations
- Analytics endpoint
- Webhooks support
- Rate limiting

---

**Built with ❤️ by developers, for developers.**
