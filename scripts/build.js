/**
 * Banana Crack Hub - Automated Modular Bundler
 * Compiles all modular files from src/ into the dist/ directory
 */

const fs = require('fs');
const path = require('path');

const rootDir = path.join(__dirname, '..');
const srcDir = path.join(rootDir, 'src');
const distDir = path.join(rootDir, 'dist');
const outputFile = path.join(distDir, 'banana.lua');

// Ensure dist directory exists
fs.mkdirSync(distDir, { recursive: true });

// Dependency compilation order
const buildOrder = [
    // 1. UI Window & Setup
    path.join(srcDir, 'ui', 'window.lua'),

    // 2. Core Engine
    path.join(srcDir, 'core', 'services.lua'),
    path.join(srcDir, 'core', 'quests.lua'),
    path.join(srcDir, 'core', 'esp.lua'),
    path.join(srcDir, 'core', 'utils.lua'),

    // 3. UI Controls
    path.join(srcDir, 'ui', 'toggle_button.lua'),

    // 4. Feature Tabs
    path.join(srcDir, 'tabs', 'home.lua'),
    path.join(srcDir, 'tabs', 'main_farm.lua'),
    path.join(srcDir, 'tabs', 'sea_events.lua'),
    path.join(srcDir, 'tabs', 'item_farm.lua'),
    path.join(srcDir, 'tabs', 'settings.lua'),
    path.join(srcDir, 'tabs', 'status.lua'),
    path.join(srcDir, 'tabs', 'stats.lua'),
    path.join(srcDir, 'tabs', 'player.lua'),
    path.join(srcDir, 'tabs', 'teleport.lua'),
    path.join(srcDir, 'tabs', 'visuals.lua'),
    path.join(srcDir, 'tabs', 'fruit.lua'),
    path.join(srcDir, 'tabs', 'raid.lua'),
    path.join(srcDir, 'tabs', 'race.lua'),
    path.join(srcDir, 'tabs', 'shop.lua'),
    path.join(srcDir, 'tabs', 'misc.lua')
];

console.log('🍌 [Banana Crack Hub Bundler] Starting build...');

let output = `--[[
    Banana Crack Hub - Blox Fruits [ Freemium ]
    Author: wh1tehourse
    Compiled: ${new Date().toISOString()}
    Source: Modular Architecture (src/)
]]\n\n`;

buildOrder.forEach(filePath => {
    const relPath = path.relative(rootDir, filePath).replace(/\\/g, '/');
    if (fs.existsSync(filePath)) {
        const fileContent = fs.readFileSync(filePath, 'utf8');
        output += `\n-- ==========================================\n`;
        output += `-- MODULE: ${relPath}\n`;
        output += `-- ==========================================\n\n`;
        output += fileContent.trim() + '\n';
        console.log(`  ✓ Bundled: ${relPath}`);
    } else {
        console.error(`  ✗ Missing module file: ${relPath}`);
    }
});

// Finalize call
output += `\n-- Finalize Tab Selection\npcall(function()\n    if Window and Window.SelectTab then\n        Window:SelectTab(1)\n    elseif v2 and v2.SelectTab then\n        v2:SelectTab(1)\n    end\nend)\n`;

fs.writeFileSync(outputFile, output, 'utf8');

// Also copy loader to dist/loader.lua
const loaderSrc = path.join(srcDir, 'loader.lua');
const loaderDist = path.join(distDir, 'loader.lua');
if (fs.existsSync(loaderSrc)) {
    fs.copyFileSync(loaderSrc, loaderDist);
    console.log(`  ✓ Copied: dist/loader.lua`);
}

const stats = fs.statSync(outputFile);
const totalLines = output.split('\n').length;
console.log(`\n🎉 Build Complete!`);
console.log(`   Output: dist/banana.lua`);
console.log(`   Total Lines: ${totalLines.toLocaleString()}`);
console.log(`   File Size: ${(stats.size / 1024).toFixed(2)} KB\n`);
