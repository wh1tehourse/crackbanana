# 🚀 Banana Hub - Multi-Game Scripts

### 🍌 1. Blox Fruits [ Freemium Hub ]
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/wh1tehourse/crackbanana/main/dist/blox_fruits/loader.lua"))()
```

### 🚂 2. Dead Rails [ Kaitun Bond & Auto Farm ]
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/wh1tehourse/crackbanana/main/dist/dead_rails/loader.lua?t=" .. tostring(tick())))()
```

---

## 📁 Struktur Folder Multi-Game Proyek

```text
crackbanana/
├── 📁 dist/                               # Output siap pakai untuk Roblox (Distribution)
│   ├── 📁 blox_fruits/
│   │   ├── loader.lua                     # Fast Loader Blox Fruits
│   │   └── banana.lua                     # Bundled script Blox Fruits
│   └── 📁 dead_rails/
│       └── kaitun_bond.lua                # Instant Kaitun Bond Dead Rails
│
├── 📁 src/                                # Source Code Modular per Game
│   ├── 📁 blox_fruits/                    # Modul Khusus Blox Fruits
│   │   ├── 📁 core/                       # Engine (combat, esp, quests, tween, dll.)
│   │   ├── 📁 tabs/                       # Tabs (main_farm, sea_events, item_farm, dll.)
│   │   ├── 📁 ui/                         # UI Components
│   │   └── loader.lua
│   │
│   └── 📁 dead_rails/                     # Modul Khusus Dead Rails
│       ├── 📁 core/                       # Core engine (scanner, collector, farm, teleport, server_hop, services, state, anti_afk)
│       ├── 📁 ui/                         # Standalone compact Kaitun HUD
│       └── init.lua                       # Modular Entrypoint Overview
│
├── 📁 scripts/                            # Build Automation
│   ├── build.js                           # Multi-game bundler (npm run build)
│   └── obfuscate.js                       # Safe UTF-8 Lua protection
│
└── package.json                           # Multi-game build commands
```

---

## 🛠️ Perintah Build (Development):

```bash
# Build semua game sekaligus
npm run build

# Build khusus Blox Fruits
npm run build:blox

# Build khusus Dead Rails
npm run build:deadrails
```
