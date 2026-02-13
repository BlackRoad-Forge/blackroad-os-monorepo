#!/bin/bash

echo "🔧 Updating package.json files for monorepo compatibility..."

# Function to add workspace dependencies
update_package_json() {
    local dir=$1
    if [ -f "$dir/package.json" ]; then
        echo "  📝 Updating: $dir/package.json"
        
        node -e "
        const fs = require('fs');
        const path = require('path');
        const pkgPath = '$dir/package.json';
        
        try {
            const pkg = JSON.parse(fs.readFileSync(pkgPath, 'utf8'));
            
            // Ensure dependencies object exists
            if (!pkg.dependencies) pkg.dependencies = {};
            
            // Add workspace dependencies if not already present
            if (!pkg.dependencies['@blackroad/shared']) {
                pkg.dependencies['@blackroad/shared'] = 'workspace:*';
            }
            
            // Add standard scripts if missing
            if (!pkg.scripts) pkg.scripts = {};
            if (!pkg.scripts.clean) pkg.scripts.clean = 'rm -rf dist .next out build node_modules/.cache';
            
            fs.writeFileSync(pkgPath, JSON.stringify(pkg, null, 2) + '\n');
            console.log('    ✅ Updated');
        } catch (e) {
            console.log('    ⚠️  Skipped (invalid JSON)');
        }
        " 2>/dev/null || echo "    ⚠️  Could not update"
    fi
}

# Update all apps
for dir in apps/*; do
    [ -d "$dir" ] && update_package_json "$dir"
done

# Update all services
for dir in services/*; do
    [ -d "$dir" ] && update_package_json "$dir"
done

# Update all tooling
for dir in tooling/*; do
    [ -d "$dir" ] && update_package_json "$dir"
done

# Update all packages
for dir in packages/*; do
    [ -d "$dir" ] && update_package_json "$dir"
done

echo ""
echo "✅ Package updates complete!"
