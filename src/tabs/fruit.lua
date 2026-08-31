-- Tab: Fruit & ESP (Sniper, Gacha, Store, Fruit TP/Tween)
local v861 = v3.Fruit:AddDropdown("DropdownFruit", {
    ["Title"] = "Select Fruit",
    ["Description"] = "",
    ["Values"] = Table_DevilFruitSniper,
    ["Multi"] = false,
    ["Default"] = 1
})
v861:SetValue(_G.SelectFruit)
v861:OnChanged(function(p862)
    _G.SelectFruit = p862
end)
v3.Fruit:AddToggle("ToggleFruit", {
    ["Title"] = "Buy Fruit",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p863)
    if p863 then
        _G.AutoBuyFruitSniper = true
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", _G.SelectFruit, false)
        end)
        _G.AutoBuyFruitSniper = false
    end
end)
v4.ToggleFruit:SetValue(false)
local v864 = v3.Fruit:AddDropdown("DropdownPermanentFruit", {
    ["Title"] = "Select Permanent Fruit",
    ["Description"] = "",
    ["Values"] = Table_DevilFruitSniper,
    ["Multi"] = false,
    ["Default"] = 1
})
v864:SetValue(_G.PermanentFruit)
v864:OnChanged(function(p865)
    _G.PermanentFruit = p865
end)
v3.Fruit:AddToggle("TogglePermanentFruit", {
    ["Title"] = "Equip Permanent Fruit",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p866)
    if p866 then
        _G.AutoSwitchPermanentFruit = true
        pcall(function()
            local v867 = {
                "SwitchFruit",
                _G.PermanentFruit
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v867))
        end)
        _G.AutoSwitchPermanentFruit = false
    end
end)
v4.TogglePermanentFruit:SetValue(false)
v3.Fruit:AddToggle("ToggleStore", {
    ["Title"] = "Store Fruit",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p868)
    _G.AutoStoreFruit = p868
end)
v4.ToggleStore:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoStoreFruit then
            pcall(function()
                if _G.AutoStoreFruit then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bomb-Bomb", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spike-Spike", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Chop-Chop", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Blade Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spring-Spring", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rocket-Rocket", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Smoke-Smoke", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spin-Spin", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Flame-Flame", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Falcon Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Falcon", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("alcon Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ice-Ice", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Sand-Sand", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dark-Dark", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ghost-Ghost", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Diamond-Diamond", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Light-Light", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Love-Love", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rubber-Rubber", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Barrier-Barrier", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Magma-Magma", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Door-Door", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Quake-Quake", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buddha", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spider-Spider", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Phoenix", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rumble-Rumble", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Pain-Pain", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Gravity-Gravity", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dough-Dough", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Shadow-Shadow", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Venom-Venom", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Control-Control", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Soul-Soul", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dragon-Dragon", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"))
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Leopard-Leopard", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit"))
                        end
                    end
                end
            end)
        end
        task.wait()
    end
end)
v3.Fruit:AddToggle("ToggleRandomFruit", {
    ["Title"] = "Random Fruit (Gacha)",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p869)
    _G.Random_Auto = p869
end)
v4.ToggleRandomFruit:SetValue(false)
task.spawn(function()
    pcall(function()
        while task.task.wait() do
            if _G.Random_Auto then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
            end
        end
    end)
end)
v3.Fruit:AddToggle("ToggleCollectTP", {
    ["Title"] = "Collect Fruit (Teleport)",
    ["Description"] = "Risk (May Kick)",
    ["Default"] = false
}):OnChanged(function(p870)
    _G.CollectFruitTP = p870
end)
v4.ToggleCollectTP:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.CollectFruitTP then
            local v871, v872, v873 = pairs(game.Workspace:GetChildren())
            while true do
                local v874
                v873, v874 = v871(v872, v873)
                if v873 == nil then
                    break
                end
                if string.find(v874.Name, "Fruit") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v874.Handle.CFrame
                end
            end
        end
    end
end)
v3.Fruit:AddToggle("ToggleCollect", {
    ["Title"] = "Collect Fruit (Tween)",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p875)
    _G.Tweenfruit = p875
end)
v4.ToggleCollect:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.Tweenfruit then
            local v876, v877, v878 = pairs(game.Workspace:GetChildren())
            while true do
                local v879
                v878, v879 = v876(v877, v878)
                if v878 == nil then
                    break
                end
                if string.find(v879.Name, "Fruit") then
                    Tween(v879.Handle.CFrame)
                end
            end
        end
    end
end)
v3.Fruit:AddSection("Esp")
v3.Fruit:AddToggle("ToggleEspPlayer", {
    ["Title"] = "ESP Players",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p880)
    ESPPlayer = p880
    UpdatePlayerChams()
end)
v4.ToggleEspPlayer:SetValue(false)
v3.Fruit:AddToggle("ToggleEspFruit", {
    ["Title"] = "Blox Fruit",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p881)
    DevilFruitESP = p881
    while DevilFruitESP do
        task.wait()
        UpdateDevilChams()
    end
end)
v4.ToggleEspFruit:SetValue(false)
v3.Fruit:AddToggle("ToggleEspIsland", {
    ["Title"] = "ESP Islands",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p882)
    IslandESP = p882
    while IslandESP do
        task.wait()
        UpdateIslandESP()
    end
end)
v4.ToggleEspIsland:SetValue(false)
v3.Fruit:AddToggle("ToggleEspFlower", {
    ["Title"] = "ESP Flowers",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p883)
    FlowerESP = p883
    UpdateFlowerChams()
end)
v4.ToggleEspFlower:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if FlowerESP then
            UpdateFlowerChams()
        end
        if DevilFruitESP then
            UpdateDevilChams()
        end
        if ChestESP then
            UpdateChestChams()
        end
        if ESPPlayer then
            UpdatePlayerChams()
        end
        if RealFruitESP then
            UpdateRealFruitChams()
        end
    end
end)
v3.Fruit:AddToggle("ToggleEspRealFruit", {
    ["Title"] = "ESP Dropped Fruit",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p884)
    RealFruitEsp = p884
    while RealFruitEsp do
        task.wait()
        UpdateRealFruitEsp()
    end
end)
v4.ToggleEspRealFruit:SetValue(false)
function UpdateRealFruitEsp()
	-- upvalues: (ref) vu813
    local v885, v886, v887 = pairs(game.Workspace.AppleSpawner:GetChildren())
    while true do
        local v888
        v887, v888 = v885(v886, v887)
        if v887 == nil then
            break
        end
        if v888:IsA("Tool") then
            if RealFruitEsp then
                if v888.Handle:FindFirstChild("NameEsp" .. Number) then
                    v888.Handle["NameEsp" .. Number].TextLabel.Text = v888.Name .. " " .. vu813((game:GetService("Players").LocalPlayer.Character.Head.Position - v888.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v889 = Instance.new("BillboardGui", v888.Handle)
                    v889.Name = "NameEsp" .. Number
                    v889.ExtentsOffset = Vector3.new(0, 1, 0)
                    v889.Size = UDim2.new(1, 200, 1, 30)
                    v889.Adornee = v888.Handle
                    v889.AlwaysOnTop = true
                    local v890 = Instance.new("TextLabel", v889)
                    v890.Font = Enum.Font.GothamSemibold
                    v890.FontSize = "Size14"
                    v890.TextWrapped = true
                    v890.Size = UDim2.new(1, 0, 1, 0)
                    v890.TextYAlignment = "Top"
                    v890.BackgroundTransparency = 1
                    v890.TextStrokeTransparency = 0.5
                    v890.TextColor3 = Color3.fromRGB(255, 0, 0)
                    v890.Text = v888.Name .. " \n" .. vu813((game:GetService("Players").LocalPlayer.Character.Head.Position - v888.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v888.Handle:FindFirstChild("NameEsp" .. Number) then
                v888.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    local v891, v892, v893 = pairs(game.Workspace.PineappleSpawner:GetChildren())
    while true do
        local v894
        v893, v894 = v891(v892, v893)
        if v893 == nil then
            break
        end
        if v894:IsA("Tool") then
            if RealFruitEsp then
                if v894.Handle:FindFirstChild("NameEsp" .. Number) then
                    v894.Handle["NameEsp" .. Number].TextLabel.Text = v894.Name .. " " .. vu813((game:GetService("Players").LocalPlayer.Character.Head.Position - v894.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v895 = Instance.new("BillboardGui", v894.Handle)
                    v895.Name = "NameEsp" .. Number
                    v895.ExtentsOffset = Vector3.new(0, 1, 0)
                    v895.Size = UDim2.new(1, 200, 1, 30)
                    v895.Adornee = v894.Handle
                    v895.AlwaysOnTop = true
                    local v896 = Instance.new("TextLabel", v895)
                    v896.Font = Enum.Font.GothamSemibold
                    v896.FontSize = "Size14"
                    v896.TextWrapped = true
                    v896.Size = UDim2.new(1, 0, 1, 0)
                    v896.TextYAlignment = "Top"
                    v896.BackgroundTransparency = 1
                    v896.TextStrokeTransparency = 0.5
                    v896.TextColor3 = Color3.fromRGB(255, 174, 0)
                    v896.Text = v894.Name .. " \n" .. vu813((game:GetService("Players").LocalPlayer.Character.Head.Position - v894.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v894.Handle:FindFirstChild("NameEsp" .. Number) then
                v894.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    local v897, v898, v899 = pairs(game.Workspace.BananaSpawner:GetChildren())
    while true do
        local v900
        v899, v900 = v897(v898, v899)
        if v899 == nil then
            break
        end
        if v900:IsA("Tool") then
            if RealFruitEsp then
                if v900.Handle:FindFirstChild("NameEsp" .. Number) then
                    v900.Handle["NameEsp" .. Number].TextLabel.Text = v900.Name .. " " .. vu813((game:GetService("Players").LocalPlayer.Character.Head.Position - v900.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v901 = Instance.new("BillboardGui", v900.Handle)
                    v901.Name = "NameEsp" .. Number
                    v901.ExtentsOffset = Vector3.new(0, 1, 0)
                    v901.Size = UDim2.new(1, 200, 1, 30)
                    v901.Adornee = v900.Handle
                    v901.AlwaysOnTop = true
                    local v902 = Instance.new("TextLabel", v901)
                    v902.Font = Enum.Font.GothamSemibold
                    v902.FontSize = "Size14"
                    v902.TextWrapped = true
                    v902.Size = UDim2.new(1, 0, 1, 0)
                    v902.TextYAlignment = "Top"
                    v902.BackgroundTransparency = 1
                    v902.TextStrokeTransparency = 0.5
                    v902.TextColor3 = Color3.fromRGB(251, 255, 0)
                    v902.Text = v900.Name .. " \n" .. vu813((game:GetService("Players").LocalPlayer.Character.Head.Position - v900.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v900.Handle:FindFirstChild("NameEsp" .. Number) then
                v900.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
end
v3.Fruit:AddToggle("ToggleIslandMirageEsp", {
    ["Title"] = "ESP Mirage Island",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p903)
    IslandMirageEsp = p903
    while IslandMirageEsp do
        task.wait()
        UpdateIslandMirageEsp()
    end
end)
v4.ToggleIslandMirageEsp:SetValue(false)
function isnil(p904)
    return p904 == nil
end
local function vu906(p905)
    return math.floor(tonumber(p905) + 0.5)
end
Number = math.random(1, 1000000)
function UpdateIslandMirageEsp()
	-- upvalues: (ref) vu906
    local v907, v908, v909 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
    while true do
        local vu910
        v909, vu910 = v907(v908, v909)
        if v909 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu910, (ref) vu906
            if MirageIslandESP then
                if vu910.Name == "Mirage Island" then
                    if vu910:FindFirstChild("NameEsp") then
                        vu910.NameEsp.TextLabel.Text = vu910.Name .. "   \n" .. vu906((game:GetService("Players").LocalPlayer.Character.Head.Position - vu910.Position).Magnitude / 3) .. " M"
                    else
                        local v911 = Instance.new("BillboardGui", vu910)
                        v911.Name = "NameEsp"
                        v911.ExtentsOffset = Vector3.new(0, 1, 0)
                        v911.Size = UDim2.new(1, 200, 1, 30)
                        v911.Adornee = vu910
                        v911.AlwaysOnTop = true
                        local v912 = Instance.new("TextLabel", v911)
                        v912.Font = Enum.Font.Code
                        v912.FontSize = Enum.FontSize.Size14
                        v912.TextWrapped = true
                        v912.Size = UDim2.new(1, 0, 1, 0)
                        v912.TextYAlignment = Enum.TextYAlignment.Top
                        v912.BackgroundTransparency = 1
                        v912.TextStrokeTransparency = 0.5
                        v912.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif vu910:FindFirstChild("NameEsp") then
                vu910:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
