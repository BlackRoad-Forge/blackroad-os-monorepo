# 🚀 BlackRoad Figma Plugin - Quick Installation

**Get the plugin running in Figma in 2 minutes**

---

## Prerequisites

- ✅ Figma Desktop App (required - browser version doesn't support plugins)
- ✅ macOS, Windows, or Linux

**Download Figma Desktop**: https://www.figma.com/downloads/

---

## Step 1: Locate Plugin Files

Plugin files are ready at:
```
/tmp/blackroad-brand-figma-plugin/
```

Contains:
- `manifest.json` - Plugin configuration
- `code.js` - Plugin logic
- `ui.html` - Plugin interface
- `README.md` - Full documentation
- `INSTALLATION_GUIDE.md` - This file

---

## Step 2: Import Plugin to Figma

### Option A: Direct Import (Fastest)

1. **Open Figma Desktop App**

2. **Go to Plugins Menu**:
   ```
   Menu Bar → Plugins → Development → Import plugin from manifest...
   ```

3. **Select Manifest File**:
   - Navigate to: `/tmp/blackroad-brand-figma-plugin/`
   - Select: `manifest.json`
   - Click "Open"

4. **✅ Done!**
   - Plugin now appears in: Plugins → Development → BlackRoad Brand System

### Option B: Copy to Permanent Location

If you want to keep the plugin permanently:

```bash
# Create plugin directory
mkdir -p ~/figma-plugins/blackroad-brand-system

# Copy plugin files
cp -r /tmp/blackroad-brand-figma-plugin/* ~/figma-plugins/blackroad-brand-system/

# Now import from permanent location
```

Then import `~/figma-plugins/blackroad-brand-system/manifest.json` in Figma.

---

## Step 3: Run the Plugin

1. **Open any Figma file** (or create a new one)

2. **Run the plugin**:
   ```
   Menu → Plugins → Development → BlackRoad Brand System
   ```

   Or use keyboard shortcut:
   ```
   macOS: Cmd + /  (search "BlackRoad")
   Windows: Ctrl + /
   ```

3. **Plugin UI appears!**
   - 400x600 panel on the right
   - Shows brand colors, gradient, spacing
   - Ready to use

---

## Step 4: Test the Plugin

### Test 1: Apply a Color

1. **Create a rectangle** (press R, click and drag)
2. **Keep rectangle selected**
3. **In plugin**, click "Hot Pink" color
4. **✅ Rectangle turns hot pink** (#FF1D6C)

### Test 2: Apply Gradient

1. **Create another rectangle**
2. **Keep selected**
3. **In plugin**, click "Apply to Selection" under gradient
4. **✅ Rectangle gets brand gradient** (135° with Golden Ratio stops)

### Test 3: Create Logo

1. **Click "Create BlackRoad Logo"** in plugin
2. **✅ Logo frame appears** with hot pink circle, amber/blue halves

### Test 4: Create Color Palette

1. **Click "Create Color Palette"**
2. **✅ Full color palette frame** appears with all brand colors

---

## Usage Examples

### Example 1: Design a Button

```
1. Create rectangle (R key)
2. Apply brand gradient from plugin
3. Add text "Click Me"
4. Use Hot Pink for text color
5. Add --space-md (21px) padding
6. ✅ Brand-compliant button!
```

### Example 2: Build a Landing Page

```
1. Create frame (F key) 1440x1024
2. Apply Black (#000000) background
3. Add title text, apply gradient
4. Create CTA button with Hot Pink
5. Use spacing guide for layout (34px, 55px, etc.)
6. Add BlackRoad logo from plugin
7. ✅ Brand-compliant landing page!
```

### Example 3: Create Design System

```
1. Click "Create Full Library" in plugin
2. New page created with all brand assets
3. Add your custom components
4. Share with team
5. ✅ Team design system ready!
```

---

## Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Open plugins menu | Cmd/Ctrl + / |
| Run last plugin | Cmd/Ctrl + Option/Alt + P |
| Close plugin | Esc |

---

## Troubleshooting

### Plugin doesn't appear in menu?

**Solution**:
1. Make sure you're using Figma **Desktop** (not browser)
2. Check: Plugins → Development → Manage plugins
3. Look for "BlackRoad Brand System"
4. If missing, reimport manifest.json

### "Import plugin from manifest" is grayed out?

**Solution**:
- You need to be in a Figma file (not on homepage)
- Create new file or open existing one
- Try again

### Colors not applying?

**Solution**:
1. Select an object **first**
2. Object must support fills (rectangles, frames, etc.)
3. Groups don't have fills - select individual objects
4. Check selection in Figma layers panel

### Plugin crashes or errors?

**Solution**:
1. Close and reopen plugin
2. Check browser console (Help → Toggle Developer Tools)
3. Reimport manifest.json
4. Restart Figma

---

## What the Plugin Provides

### ✅ Instant Access to Brand Colors
- All 10 brand colors (Hot Pink, Amber, Electric Blue, Violet, etc.)
- Exact hex values (#FF1D6C, #F5A623, etc.)
- One-click application to selection

### ✅ Brand Gradient
- 135° gradient with Golden Ratio stops
- Stops at 38.2% and 61.8%
- Amber → Hot Pink → Violet → Electric Blue

### ✅ Spacing System
- Fibonacci sequence (8, 13, 21, 34, 55, 89, 144)
- Golden Ratio based (φ = 1.618)
- Visual spacing bars

### ✅ Quick Actions
- Create color palette frame
- Create spacing guide frame
- Create BlackRoad logo
- Create full component library

---

## Integration with Other Tools

After designing in Figma with the plugin:

1. **Export your design** (Cmd/Ctrl + Shift + E)

2. **Implement in code** using exact same values:
   ```css
   /* Same colors as Figma */
   --hot-pink: #FF1D6C;
   --amber: #F5A623;

   /* Same gradient */
   background: linear-gradient(135deg,
     var(--amber) 0%,
     var(--hot-pink) 38.2%,
     var(--violet) 61.8%,
     var(--electric-blue) 100%);

   /* Same spacing */
   padding: 34px; /* --space-lg from plugin */
   ```

3. **Validate with CLI tool**:
   ```bash
   blackroad-brand check index.html
   ```

4. **Check in browser** with browser extension

5. **Deploy** with enforcement

✅ **Perfect design-to-code consistency!**

---

## Next Steps

Now that you have the plugin installed:

1. **Create a test design** using brand colors
2. **Try all the quick actions**
3. **Create a component library** for your team
4. **Share with designers** on your team
5. **Use exact same values** in code implementation

---

## Resources

- **Full Documentation**: README.md in plugin folder
- **Brand System**: ~/BLACKROAD_BRAND_SYSTEM.md
- **CLI Tool**: @blackroad/brand-cli
- **Browser Extension**: /tmp/blackroad-brand-extension/
- **Website**: https://blackroad-os-brand.pages.dev

---

## Support

Having issues? Need help?

- **Email**: blackroad.systems@gmail.com
- **GitHub**: https://github.com/BlackRoad-OS
- **Docs**: https://blackroad-os-brand.pages.dev

---

**DESIGN WITH CONFIDENCE. BRAND COMPLIANCE GUARANTEED.**

🔒 LOCKED · 🎨 STANDARDIZED · 🚀 ENFORCED · 🤖 AUTOMATED
