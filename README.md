# 🍌 Banana Crack Hub

Script Blox Fruits premium & modular untuk **Blox Fruits (Sea 1, Sea 2, Sea 3)**.

---

## 🚀 Fast Loader (Recommended)

Gunakan **Ultra-Lightweight Loader** untuk eksekusi yang cepat, anti-lag, dan otomatis mendeteksi Sea:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/wh1tehourse/crackbanana/main/dist/loader.lua"))()
```

---

## ⚡ Direct Execution

Atau jalankan script utama secara langsung:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/wh1tehourse/crackbanana/main/dist/banana.lua?t=" .. tostring(tick())))()
```

---

## 📁 Struktur Folder Proyek

Semua modul dipisahkan secara rinci dan terorganisir per fungsinya:

```text
crackbanana/
├── 📁 dist/                       # Output siap pakai untuk Roblox (Distribution)
│   ├── loader.lua                 # Fast Loader
│   └── banana.lua                 # Bundled script hasil compile
│
├── 📁 scripts/                    # Skrip otomatisasi & development
│   └── build.js                   # Bundler otomatis (src/ -> dist/)
│
├── 📁 src/                        # Seluruh Source Code Modular
│   ├── loader.lua                 # Source code loader
│   ├── init.lua                   # Entrypoint utama modular
│   │
│   ├── 📁 core/                   # Logika Inti & Engine (Granular)
│   │   ├── services.lua           # Roblox Services & PlaceId Sea 1/2/3
│   │   ├── anti_afk.lua           # Anti-Idle / Anti-Disconnect 20 menit
│   │   ├── quests.lua             # Database Quest, Monster & Level CFrame
│   │   ├── esp.lua                # ESP (Mob, Sea, Npc, Player, Fruit)
│   │   ├── fast_attack.lua        # FastAttack delay & Metatable hook
│   │   ├── noclip.lua             # BodyClip & Disable Collision
│   │   ├── combat.lua             # Auto Haki, Enemy Search, Inventory
│   │   └── tween.lua              # Engine pergerakan terbang & bypass CFrame
│   │
│   ├── 📁 ui/                     # Komponen Tampilan
│   │   ├── window.lua             # Fluent UI Window, Theme & Tab Setup
│   │   └── toggle_button.lua      # Tombol Floating Pisang (Drag & Toggle)
│   │
│   └── 📁 tabs/                   # Fitur Terpisah per Menu Tab
│       ├── home.lua               # Tab Information
│       ├── main_farm.lua          # Tab Main Farm (Level, Mastery, Bone, Boss, Material)
│       ├── sea_events.lua         # Tab Sea Events (Kitsune, Leviathan, Mirage, Draco)
│       ├── item_farm.lua          # Tab Item Farm (Saber, CDK, Soul Guitar, Yama, Tushita)
│       ├── settings.lua           # Tab Farm Settings & Keybinds
│       ├── status.lua             # Tab Status & Server Info
│       ├── stats.lua              # Tab Stats Auto-Allocate
│       ├── player.lua             # Tab Player (Teleport, WaterWalk, PvP)
│       ├── teleport.lua           # Tab Island Teleportation
│       ├── visuals.lua            # Tab Fake Stats
│       ├── fruit.lua              # Tab Fruit & ESP (Sniper, Gacha, Store)
│       ├── raid.lua               # Tab Raid & Dungeon (Chips, Law Raid, Awaken)
│       ├── race.lua               # Tab Race V4 (Temple of Time, Trials, Gear)
│       ├── shop.lua               # Tab Shop (Fighting Styles, Swords, Haki)
│       └── misc.lua               # Tab Misc (Server Hop, Codes, Anti-Ban)
│
├── package.json                   # Konfigurasi NPM build
└── README.md                      # Dokumentasi Proyek
```

---

## 🛠️ Cara Edit & Compile Script

1. Buka dan edit file modul yang Anda inginkan di folder `src/`.
2. Jalankan perintah bundler:
   ```bash
   npm run build
   ```
   *(Atau `node scripts/build.js`)*
3. Commit dan push ke GitHub:
   ```bash
   git add .
   git commit -m "Update feature"
   git push
   ```
