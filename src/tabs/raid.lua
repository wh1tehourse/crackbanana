-- Tab: Raid & Dungeon (Chips, Law Raid, Awaken Fruit)
local v913 = v3.Raid:AddDropdown("DropdownRaid", {
    ["Title"] = "Select Raid Chip",
    ["Description"] = "",
    ["Values"] = {
        "Flame",
        "Ice",
        "Quake",
        "Light",
        "Dark",
        "Spider",
        "Rumble",
        "Magma",
        "Buddha",
        "Sand",
        "Phoenix",
        "Dough"
    },
    ["Multi"] = false,
    ["Default"] = 1
})
v913:SetValue(SelectChip)
v913:OnChanged(function(p914)
    SelectChip = p914
end)
v3.Raid:AddToggle("ToggleBuy", {
    ["Title"] = "Buy Raid Chip",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p915)
    _G.Auto_Buy_Chips_Dungeon = p915
end)
v4.ToggleBuy:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.Auto_Buy_Chips_Dungeon then
            pcall(function()
                local v916 = {
                    "RaidsNpc",
                    "Select",
                    SelectChip
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v916))
            end)
        end
    end
end)
v3.Raid:AddToggle("ToggleStart", {
    ["Title"] = "Auto Start Raid",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p917)
    _G.Auto_StartRaid = p917
end)
v4.ToggleStart:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.Auto_StartRaid and (game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false and (not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")))) then
                if Sea2 then
                    Tween2(CFrame.new(- 6438.73535, 250.645355, - 4501.50684))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                        "SetSpawnPoint"
                    }))
                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                elseif Sea3 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375))
                    Tween2(CFrame.new(- 5017.40869, 314.844055, - 2823.0127, - 0.925743818, 4.482175e-8, - 0.378151238, 4.5550315e-9, 1, 1.0737756e-7, 0.378151238, 9.768162e-8, - 0.925743818))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                        "SetSpawnPoint"
                    }))
                    fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                end
            end
        end)
    end
end)
v3.Raid:AddToggle("ToggleNextIsland", {
    ["Title"] = "Auto Attack Raid Mobs",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p918)
    AutoNextIsland = p918
    if not p918 then
        _G.AutoNear = false
    end
end)
v4.ToggleNextIsland:SetValue(false)
task.spawn(function()
    local vu919 = {}
    while task.task.wait() do
        if AutoNextIsland then
            pcall(function()
				-- upvalues: (ref) vu919
                local v920 = game.Players.LocalPlayer.Character
                if v920 and v920:FindFirstChild("HumanoidRootPart") then
                    local v921 = game:GetService("Workspace")._WorldOrigin.Locations
                    local v922 = v920.HumanoidRootPart.Position
                    if (v922 - Vector3.new(- 6438.73535, 250.645355, - 4501.50684)).Magnitude < 1 or (v922 - Vector3.new(- 5017.40869, 314.844055, - 2823.0127)).Magnitude < 1 then
                        vu919 = {}
                    end
                    if v921:FindFirstChild("Island 1") then
                        _G.AutoNear = true
                    end
                    if v921:FindFirstChild("Island 2") and not vu919["Island 2"] then
                        Tween(v921:FindFirstChild("Island 2").CFrame)
                        vu919["Island 2"] = true
                        AutoNextIsland = false
                        task.wait()
                        AutoNextIsland = true
                    elseif v921:FindFirstChild("Island 3") and not vu919["Island 3"] then
                        Tween(v921:FindFirstChild("Island 3").CFrame)
                        vu919["Island 3"] = true
                        AutoNextIsland = false
                        task.wait()
                        AutoNextIsland = true
                    elseif v921:FindFirstChild("Island 4") and not vu919["Island 4"] then
                        Tween(v921:FindFirstChild("Island 4").CFrame)
                        vu919["Island 4"] = true
                        AutoNextIsland = false
                        task.wait()
                        AutoNextIsland = true
                    elseif v921:FindFirstChild("Island 5") and not vu919["Island 5"] then
                        Tween(v921:FindFirstChild("Island 5").CFrame)
                        vu919["Island 5"] = true
                        AutoNextIsland = false
                        task.wait()
                        AutoNextIsland = true
                    end
                end
            end)
        end
    end
end)
v3.Raid:AddToggle("ToggleAwake", {
    ["Title"] = "Auto Awaken Fruit",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p923)
    AutoAwakenAbilities = p923
end)
v4.ToggleAwake:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if AutoAwakenAbilities then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
            end)
        end
    end
end)
v3.Raid:AddToggle("ToggleGetFruit", {
    ["Title"] = "Trade Fruit for Raid Chip",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p924)
    _G.Autofruit = p924
end)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.Autofruit then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Rocket-Rocket"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Spin-Spin"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Chop-Chop"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Spring-Spring"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Bomb-Bomb"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Smoke-Smoke"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Spike-Spike"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Flame-Flame"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Falcon-Falcon"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Ice-Ice"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Sand-Sand"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Dark-Dark"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Ghost-Ghost"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Diamond-Diamond"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Light-Light"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Rubber-Rubber"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Barrier-Barrier"
                }))
            end
        end)
    end
end)
if Sea2 then
    v3.Raid:AddButton({
        ["Title"] = "Teleport to Raid Lab",
        ["Description"] = "",
        ["Callback"] = function()
            Tween2(CFrame.new(- 6438.73535, 250.645355, - 4501.50684))
        end
    })
elseif Sea3 then
    v3.Raid:AddButton({
        ["Title"] = "Teleport to Raid Lab",
        ["Description"] = "",
        ["Callback"] = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375))
            Tween2(CFrame.new(- 5017.40869, 314.844055, - 2823.0127, - 0.925743818, 4.482175e-8, - 0.378151238, 4.5550315e-9, 1, 1.0737756e-7, 0.378151238, 9.768162e-8, - 0.925743818))
        end
    })
end
v3.Raid:AddSection("Law")
v3.Raid:AddToggle("ToggleLaw", {
    ["Title"] = "Auto Order Raid (Full)",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p925)
    Auto_Law = p925
end)
v4.ToggleLaw:SetValue(false)
task.spawn(function()
    pcall(function()
        while task.task.wait() do
            if Auto_Law and not (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") or (game:GetService("Workspace").Enemies:FindFirstChild("Order") or game:GetService("ReplicatedStorage"):FindFirstChild("Order")))) then
                task.wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
            end
        end
    end)
end)
task.spawn(function()
    pcall(function()
        while task.task.wait() do
            if Auto_Law then
                if not game:GetService("Workspace").Enemies:FindFirstChild("Order") and (not game:GetService("ReplicatedStorage"):FindFirstChild("Order") and (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip"))) then
                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                end
                if game:GetService("ReplicatedStorage"):FindFirstChild("Order") or game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                        local v926, v927, v928 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v929
                            v928, v929 = v926(v927, v928)
                            if v928 == nil then
                                break
                            end
                            if v929.Name == "Order" then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v929.HumanoidRootPart.CFrame * Pos)
                                    v929.HumanoidRootPart.CanCollide = false
                                    v929.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                until not v929.Parent or (v929.Humanoid.Health <= 0 or Auto_Law == false)
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                        Tween(CFrame.new(- 6217.2021484375, 28.047645568848, - 5053.1357421875))
                    end
                end
            end
        end
    end)
end)
