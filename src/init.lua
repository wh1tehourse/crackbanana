--[[
    Banana Crack Hub [ Freemium ]
    By: wh1tehourse
    Main Entrypoint (Modular)
]]

-- 1. UI Window & Setup
-- (Includes Fluent UI, Window, Tabs, Options)

-- 2. Core Engine
-- (Services, Quests, ESP, Utils)

-- 3. UI Controls
-- (Floating Banana Toggle Button)

-- 4. Tab Modules
-- (Home, Main Farm, Sea Events, Item Farm, Settings, Status, Stats, Player, Teleport, Visuals, Fruit, Raid, Race, Shop, Misc)

-- 5. Finalize
pcall(function()
    if Window and Window.SelectTab then
        Window:SelectTab(1)
    end
end)
