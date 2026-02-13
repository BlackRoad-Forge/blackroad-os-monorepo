[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/blackboxprogramming/blackroad-linear.svg?style=social&label=Star)](https://github.com/blackboxprogramming/blackroad-linear)
[![GitHub forks](https://img.shields.io/github/forks/blackboxprogramming/blackroad-linear.svg?style=social&label=Fork)](https://github.com/blackboxprogramming/blackroad-linear/fork)


# BlackRoad Linear Integration 🎯

Integrate BlackRoad with Linear for seamless project management!

## Features

- **Auto-issue Creation**
  - Failed deployments → Linear issues
  - Priority-based alerts
  - Complete error details

- **Deployment Tracking**
  - Sync all deployments to Linear
  - Track deployment status
  - Link to deployment dashboards

- **Bidirectional Integration**
  - Create deployments from Linear issues
  - Update issues with deployment URLs

## Installation

```bash
npm install @linear/sdk axios
```

## Setup

```bash
export LINEAR_API_KEY="your-linear-key"
export LINEAR_TEAM_ID="your-team-id"
export LINEAR_PROJECT_ID="your-project-id"
export BLACKROAD_API_KEY="your-api-key"
```

## Usage

```typescript
import { createIssueForFailedDeployment, syncDeploymentsToLinear } from './integration'

// Create issue for failed deployment
await createIssueForFailedDeployment(deployment)

// Sync all deployments
await syncDeploymentsToLinear()

// Create deployment from issue
await createDeploymentFromIssue('issue-id')
```

## Automatic Monitoring

The integration watches for failed deployments every 5 minutes and auto-creates urgent issues.

## License

MIT License

---

Part of the **BlackRoad Empire** 🚀

---

## 📜 License & Copyright

**Copyright © 2026 BlackRoad OS, Inc. All Rights Reserved.**

**CEO:** Alexa Amundson

**PROPRIETARY AND CONFIDENTIAL**

This software is the proprietary property of BlackRoad OS, Inc. and is **NOT for commercial resale**.

### ⚠️ Usage Restrictions:
- ✅ **Permitted:** Testing, evaluation, and educational purposes
- ❌ **Prohibited:** Commercial use, resale, or redistribution without written permission

### 🏢 Enterprise Scale:
Designed to support:
- 30,000 AI Agents
- 30,000 Human Employees
- One Operator: Alexa Amundson (CEO)

### 📧 Contact:
For commercial licensing inquiries:
- **Email:** blackroad.systems@gmail.com
- **Organization:** BlackRoad OS, Inc.

See [LICENSE](LICENSE) for complete terms.
