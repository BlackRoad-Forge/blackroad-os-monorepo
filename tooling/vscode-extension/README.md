[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/blackboxprogramming/blackroad-vscode-extension.svg?style=social&label=Star)](https://github.com/blackboxprogramming/blackroad-vscode-extension)
[![GitHub forks](https://img.shields.io/github/forks/blackboxprogramming/blackroad-vscode-extension.svg?style=social&label=Fork)](https://github.com/blackboxprogramming/blackroad-vscode-extension/fork)


# BlackRoad VS Code Extension 💻

Deploy to BlackRoad directly from VS Code!

## Features

- **Deploy Command** - `BlackRoad: Deploy` command palette
- **Status Bar** - Deployment status in status bar
- **Notifications** - Toast notifications for deployments
- **API Testing** - Test API endpoints
- **Metrics View** - View analytics in sidebar

## Installation

### From Marketplace
```bash
code --install-extension blackroad.blackroad-vscode
```

### Manual
1. Download `.vsix` from releases
2. Extensions → Install from VSIX

## Usage

1. Open Command Palette (`Cmd+Shift+P` or `Ctrl+Shift+P`)
2. Type "BlackRoad"
3. Select command:
   - Deploy
   - View Metrics
   - Test API

## Configuration

Add to your `settings.json`:

```json
{
  "blackroad.apiKey": "your-api-key",
  "blackroad.autoRefresh": true
}
```

## Keyboard Shortcuts

- `Cmd+Shift+D` - Deploy
- `Cmd+Shift+M` - View Metrics

## Development

```bash
npm install
npm run compile
# Press F5 to debug
```

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
