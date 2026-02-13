#!/bin/bash
set -e

MONOREPO_ROOT="$HOME/blackroad-os-monorepo"
TEMP_DIR="$MONOREPO_ROOT/.migration-tmp"

echo "🚀 BlackRoad Product Migration Script"
echo "======================================"

migrate_app() {
    local repo_name=$1
    local target_dir=$2
    local package_name=$3
    
    echo ""
    echo "📦 Migrating: $repo_name → $target_dir"
    
    # Clone if doesn't exist locally
    if [ ! -d "$TEMP_DIR/$repo_name" ]; then
        cd "$TEMP_DIR"
        gh repo clone blackboxprogramming/$repo_name 2>/dev/null || echo "⚠️  Repo not found or already exists"
    fi
    
    # Copy to monorepo
    if [ -d "$TEMP_DIR/$repo_name" ]; then
        mkdir -p "$MONOREPO_ROOT/$target_dir"
        cp -r "$TEMP_DIR/$repo_name/"* "$MONOREPO_ROOT/$target_dir/" 2>/dev/null || true
        
        # Update package.json if exists
        if [ -f "$MONOREPO_ROOT/$target_dir/package.json" ]; then
            cd "$MONOREPO_ROOT/$target_dir"
            
            # Update package name using Node
            node -e "
                const fs = require('fs');
                const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
                pkg.name = '$package_name';
                fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));
            " 2>/dev/null || echo "⚠️  Could not update package.json"
        fi
        
        echo "✅ Migrated: $repo_name"
    else
        echo "❌ Failed: $repo_name (not found)"
    fi
}

# Priority 1: Core Applications
echo ""
echo "=== PRIORITY 1: Core Applications ==="
migrate_app "blackroad-apps" "apps/apps" "@blackroad/apps"
migrate_app "blackroad-app-store" "apps/app-store" "@blackroad/app-store"
migrate_app "blackroad-ai-dashboard" "apps/ai-dashboard" "@blackroad/ai-dashboard"
migrate_app "blackroad-metaverse" "apps/metaverse" "@blackroad/metaverse"
migrate_app "lucidia" "apps/lucidia" "@blackroad/lucidia"

echo ""
echo "=== PRIORITY 2: Developer Tools ==="
migrate_app "blackroad-vscode-extension" "tooling/vscode-extension" "@blackroad/vscode-extension"
migrate_app "blackroad-chrome-extension" "tooling/chrome-extension" "@blackroad/chrome-extension"
migrate_app "blackroad-raycast" "tooling/raycast" "@blackroad/raycast"
migrate_app "blackroad-alfred" "tooling/alfred" "@blackroad/alfred"
migrate_app "blackroad-desktop-app" "tooling/desktop-app" "@blackroad/desktop-app"

echo ""
echo "=== PRIORITY 3: Integrations ==="
migrate_app "blackroad-zapier" "services/zapier" "@blackroad/zapier"
migrate_app "blackroad-notion" "services/notion" "@blackroad/notion"
migrate_app "blackroad-linear" "services/linear" "@blackroad/linear"
migrate_app "blackroad-slack-bot" "services/slack-bot" "@blackroad/slack-bot"
migrate_app "blackroad-figma-plugin" "tooling/figma-plugin" "@blackroad/figma-plugin"

echo ""
echo "=== PRIORITY 4: Infrastructure ==="
migrate_app "blackroad-github-actions" "infrastructure/github-actions" "@blackroad/github-actions"
migrate_app "blackroad-gitlab-ci" "infrastructure/gitlab-ci" "@blackroad/gitlab-ci"

echo ""
echo "=== PRIORITY 5: SDKs & Templates ==="
migrate_app "blackroad-api-sdks" "packages/api-sdks" "@blackroad/api-sdks"
migrate_app "blackroad-templates" "packages/templates" "@blackroad/templates"

echo ""
echo "=== PRIORITY 6: Product Launch ==="
migrate_app "blackroad-product-hunt" "apps/product-hunt" "@blackroad/product-hunt"
migrate_app "blackroad-analysis" "apps/analysis" "@blackroad/analysis"

echo ""
echo "======================================"
echo "✅ Migration complete!"
echo "Next: cd $MONOREPO_ROOT && pnpm install"
