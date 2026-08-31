-- Fluent UI Window & Tab Initialization
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    ["Title"] = "Banana Crack Hub-Blox Fruit [ Freemium ]",
    ["SubTitle"] = "By wh1tehourse",
    ["TabWidth"] = 160,
    ["Theme"] = "Dark",
    ["Acrylic"] = false,
    ["Size"] = UDim2.fromOffset(500, 320),
    ["MinimizeKey"] = Enum.KeyCode.End
})

local Tabs = {
    ["Home"] = Window:AddTab({ ["Title"] = "Information" }),
    ["Main"] = Window:AddTab({ ["Title"] = "Main Farm" }),
    ["Sea"] = Window:AddTab({ ["Title"] = "Sea Events" }),
    ["ITM"] = Window:AddTab({ ["Title"] = "Item Farm" }),
    ["Setting"] = Window:AddTab({ ["Title"] = "Farm Settings" }),
    ["Status"] = Window:AddTab({ ["Title"] = "Status & Server" }),
    ["Stats"] = Window:AddTab({ ["Title"] = "Stats" }),
    ["Player"] = Window:AddTab({ ["Title"] = "Player" }),
    ["Teleport"] = Window:AddTab({ ["Title"] = "Teleport" }),
    ["Visual"] = Window:AddTab({ ["Title"] = "Visuals" }),
    ["Fruit"] = Window:AddTab({ ["Title"] = "Fruit & ESP" }),
    ["Raid"] = Window:AddTab({ ["Title"] = "Raid & Dungeon" }),
    ["Race"] = Window:AddTab({ ["Title"] = "Race V4" }),
    ["Shop"] = Window:AddTab({ ["Title"] = "Shop" }),
    ["Misc"] = Window:AddTab({ ["Title"] = "Misc" })
}

pcall(function() Window:SelectTab(1) end)

local Options = Fluent.Options
