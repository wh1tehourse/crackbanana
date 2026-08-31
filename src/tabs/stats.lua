-- Tab: Stats Auto-Allocation
v3.Stats:AddToggle("ToggleMelee", {
    ["Title"] = "Melee",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p805)
    _G.Auto_Stats_Melee = p805
end)
v4.ToggleMelee:SetValue(false)
v3.Stats:AddToggle("ToggleDe", {
    ["Title"] = "Defense",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p806)
    _G.Auto_Stats_Defense = p806
end)
v4.ToggleDe:SetValue(false)
v3.Stats:AddToggle("ToggleSword", {
    ["Title"] = "Sword",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p807)
    _G.Auto_Stats_Sword = p807
end)
v4.ToggleSword:SetValue(false)
v3.Stats:AddToggle("ToggleGun", {
    ["Title"] = "Gun",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p808)
    _G.Auto_Stats_Gun = p808
end)
v4.ToggleGun:SetValue(false)
v3.Stats:AddToggle("ToggleFruit", {
    ["Title"] = "Blox Fruit",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p809)
    _G.Auto_Stats_Devil_Fruit = p809
end)
v4.ToggleFruit:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.Auto_Stats_Devil_Fruit then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "AddPoint",
                "Demon Fruit",
                3
            }))
        end
    end
end)
task.spawn(function()
    while task.task.wait() do
        if _G.Auto_Stats_Gun then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "AddPoint",
                "Gun",
                3
            }))
        end
    end
end)
task.spawn(function()
    while task.task.wait() do
        if _G.Auto_Stats_Sword then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "AddPoint",
                "Sword",
                3
            }))
        end
    end
end)
task.spawn(function()
    while task.task.wait() do
        if _G.Auto_Stats_Defense then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "AddPoint",
                "Defense",
                3
            }))
        end
    end
end)
task.spawn(function()
    while task.task.wait() do
        if _G.Auto_Stats_Melee then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "AddPoint",
                "Melee",
                3
            }))
        end
    end
end)
local v810, v811, v812 = pairs(game:GetService("Players"):GetChildren())
local vu813 = vu145
local vu814 = {}
while true do
    local v815
    v812, v815 = v810(v811, v812)
    if v812 == nil then
        break
    end
    table.insert(vu814, v815.Name)
end
