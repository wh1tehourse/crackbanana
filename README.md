# 🍌 Banana Crack Hub

Script Blox Fruits premium & modular untuk **Blox Fruits (Sea 1, Sea 2, Sea 3)**.

---

## 🚀 Fast Loader (Recommended)

Gunakan **Ultra-Lightweight Loader** untuk eksekusi yang cepat, anti-lag, dan otomatis mendeteksi Sea:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/wh1tehourse/crackbanana/main/loader.lua"))()
```

---

## ⚡ Direct Execution

Atau jalankan script utama secara langsung:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/wh1tehourse/crackbanana/main/banana.lua?t=" .. tostring(tick())))()
```

---

## 📁 Struktur File Modular (`src/`)

Proyek ini telah dibagi menjadi modul-modul terpisah agar sangat mudah diedit dan dikembangkan:

```text
crackbanana/
├── loader.lua                  # Ultra-lightweight loader (entrypoint utama)
├── banana.lua                  # Bundled script (dihasilkan oleh build.js)
├── build.js                    # Automated bundler (menggabungkan src/ -> banana.lua)
├── package.json                # NPM build script
└── src/
    ├── core/
    │   ├── services.lua        # PlaceId (Sea 1/2/3), Services, Anti-Idle
    │   ├── quests.lua          # Database Quest, Monster & Level CFrame
    │   ├── utils.lua           # Tweening, FastAttack, NoClip, Combat
    │   └── esp.lua             # ESP Logic (Mob, Sea, Npc, Player, Fruit)
    ├── ui/
    │   ├── window.lua          # Fluent UI Window, Theme & Tab Setup
    │   └── toggle_button.lua   # Floating Banana Button (Drag & Toggle)
    └── tabs/
        ├── home.lua            # Tab Information
        ├── main_farm.lua       # Tab Main Farm (Level, Mastery, Bone, Boss, Material)
        ├── sea_events.lua      # Tab Sea Events (Kitsune, Leviathan, Mirage, Draco)
        ├── item_farm.lua       # Tab Item Farm (Saber, CDK, Soul Guitar, Yama, Tushita)
        ├── settings.lua        # Tab Farm Settings & Keybinds
        ├── status.lua          # Tab Status & Server Info
        ├── stats.lua           # Tab Stats Auto-Allocate
        ├── player.lua          # Tab Player (Teleport, WaterWalk, PvP)
        ├── teleport.lua        # Tab Island Teleportation
        ├── visuals.lua         # Tab Fake Stats
        ├── fruit.lua           # Tab Fruit & ESP (Sniper, Gacha, Store)
        ├── raid.lua            # Tab Raid & Dungeon (Chips, Law Raid, Awaken)
        ├── race.lua            # Tab Race V4 (Temple of Time, Trials, Gear)
        ├── shop.lua            # Tab Shop (Fighting Styles, Swords, Haki)
        └── misc.lua            # Tab Misc (Server Hop, Codes, Anti-Ban)
```

---

## 🛠️ Cara Edit & Compile Script

1. Buka dan edit file modul yang Anda inginkan di dalam folder `src/tabs/`, `src/core/`, atau `src/ui/`.
2. Setelah selesai mengedit, jalankan perintah bundler di terminal:
   ```bash
   node build.js
   ```
   *(Atau `npm run build`)*
3. Commit dan push ke GitHub:
   ```bash
   git add .
   git commit -m "Update feature"
   git push
   ```
