-- Tab: Race V4 (Temple of Time, Lever, Trials, Gear)
v3.Race:AddButton({
    ["Title"] = "Temple of Time",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    end
})
v3.Race:AddButton({
    ["Title"] = "Auto Pull Lever",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end
})
v3.Race:AddButton({
    ["Title"] = "TP to Ancient One (Buy Gear)",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        Tween2(CFrame.new(28981.552734375, 14888.4267578125, - 120.245849609375))
    end
})
v3.Race:AddSection("Race")
v3.Race:AddButton({
    ["Title"] = "Select Race Door",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Human" then
            if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Skypiea" then
                if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Fishman" then
                    if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Cyborg" then
                        if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Ghoul" then
                            if game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                                Tween2(CFrame.new(29012.341796875, 14890.9755859375, - 380.1492614746094))
                            end
                        else
                            Tween2(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
                        end
                    else
                        Tween2(CFrame.new(28502.681640625, 14895.9755859375, - 423.7279357910156))
                    end
                else
                    Tween2(CFrame.new(28231.17578125, 14890.9755859375, - 211.64173889160156))
                end
            else
                Tween2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
            end
        else
            Tween2(CFrame.new(29221.822265625, 14890.9755859375, - 205.99114990234375))
        end
    end
})
v3.Race:AddToggle("ToggleHumanandghoul", {
    ["Title"] = "Complete Trial [Human / Ghoul]",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p930)
    KillAura = p930
end)
v4.ToggleHumanandghoul:SetValue(false)
v3.Race:AddToggle("ToggleAutotrial", {
    ["Title"] = "Complete Trial",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p931)
    _G.AutoQuestRace = p931
end)
v4.ToggleAutotrial:SetValue(false)
task.spawn(function()
    pcall(function()
        while task.task.wait() do
            if _G.AutoQuestRace then
                if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Human" then
                    if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Skypiea" then
                        if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Fishman" then
                            if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Cyborg" then
                                if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Ghoul" then
                                    if game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                                        local v932, v933, v934 = pairs(game:GetService("Workspace"):GetDescendants())
                                        while true do
                                            local v935
                                            v934, v935 = v932(v933, v934)
                                            if v934 == nil then
                                                break
                                            end
                                            if v935.Name == "StartPoint" then
                                                Tween(v935.CFrame * CFrame.new(0, 10, 0))
                                            end
                                        end
                                    end
                                else
                                    local v936, v937, v938 = pairs(game.Workspace.Enemies:GetDescendants())
                                    while true do
                                        local vu939
                                        v938, vu939 = v936(v937, v938)
                                        if v938 == nil then
                                            break
                                        end
                                        if vu939:FindFirstChild("Humanoid") and (vu939:FindFirstChild("HumanoidRootPart") and vu939.Humanoid.Health > 0) then
                                            pcall(function()
												-- upvalues: (ref) vu939
                                                repeat
                                                    task.wait()
                                                    vu939.Humanoid.Health = 0
                                                    vu939.HumanoidRootPart.CanCollide = false
                                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                                until not _G.AutoQuestRace or (not vu939.Parent or vu939.Humanoid.Health <= 0)
                                            end)
                                        end
                                    end
                                end
                            else
                                Tween(CFrame.new(28654, 14898.7832, - 30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                            end
                        else
                            local v940, v941, v942 = pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants())
                            while true do
                                local v943
                                v942, v943 = v940(v941, v942)
                                if v942 == nil then
                                    break
                                end
                                if v943.Name == "HumanoidRootPart" then
                                    Tween(v943.CFrame * Pos)
                                    local v944, v945, v946 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                                    while true do
                                        local v947
                                        v946, v947 = v944(v945, v946)
                                        if v946 == nil then
                                            break
                                        end
                                        if v947:IsA("Tool") and v947.ToolTip == "Melee" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v947)
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    task.wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    task.wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    local v948, v949, v950 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                                    while true do
                                        local v951
                                        v950, v951 = v948(v949, v950)
                                        if v950 == nil then
                                            break
                                        end
                                        if v951:IsA("Tool") and v951.ToolTip == "Blox Fruit" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v951)
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    task.wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    task.wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    task.wait()
                                    local v952, v953, v954 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                                    while true do
                                        local v955
                                        v954, v955 = v952(v953, v954)
                                        if v954 == nil then
                                            break
                                        end
                                        if v955:IsA("Tool") and v955.ToolTip == "Sword" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v955)
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    task.wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    task.wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    task.wait()
                                    local v956, v957, v958 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                                    while true do
                                        local v959
                                        v958, v959 = v956(v957, v958)
                                        if v958 == nil then
                                            break
                                        end
                                        if v959:IsA("Tool") and v959.ToolTip == "Gun" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v959)
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    task.wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    task.wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                end
                            end
                        end
                    else
                        local v960, v961, v962 = pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants())
                        while true do
                            local v963
                            v962, v963 = v960(v961, v962)
                            if v962 == nil then
                                break
                            end
                            if v963.Name == "snowisland_Cylinder.081" then
                                BTPZ(v963.CFrame * CFrame.new(0, 0, 0))
                            end
                        end
                    end
                else
                    local v964, v965, v966 = pairs(game.Workspace.Enemies:GetDescendants())
                    while true do
                        local vu967
                        v966, vu967 = v964(v965, v966)
                        if v966 == nil then
                            break
                        end
                        if vu967:FindFirstChild("Humanoid") and (vu967:FindFirstChild("HumanoidRootPart") and vu967.Humanoid.Health > 0) then
                            pcall(function()
								-- upvalues: (ref) vu967
                                repeat
                                    task.wait()
                                    vu967.Humanoid.Health = 0
                                    vu967.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoQuestRace or (not vu967.Parent or vu967.Humanoid.Health <= 0)
                            end)
                        end
                    end
                end
            end
        end
    end)
end)
v3.Race:AddToggle("ToggleKillTrial", {
    ["Title"] = "Auto Kill Players in Trial",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p968)
    _G.AutoKillTrial = p968
end)
v4.ToggleKillTrial:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.AutoKillTrial then
                local v969, v970, v971 = pairs(game:GetService("Players"):GetChildren())
                while true do
                    local v972
                    v971, v972 = v969(v970, v971)
                    if v971 == nil then
                        break
                    end
                    if v972.Name and (v972.Name ~= game.Players.LocalPlayer.Name and ((v972.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 and v972.Character.Humanoid.Health > 0)) then
                        repeat
                            task.wait(_G.Fast_Delay)
                            EquipTool(SelectWeapon)
                            AutoHaki()
                            Tween(v972.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
                            v972.Character.HumanoidRootPart.CanCollide = false
                            v972.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            AttackNoCoolDown()
                        until not _G.AutoKillTrial or (not v972.Parent or v972.Character.Humanoid.Health <= 0)
                    end
                end
            end
        end)
    end
end)
v3.Race:AddSection("")
local v973 = v3.Race:AddToggle("ToggleFarmRace", {
    ["Title"] = "Auto Train Race V4",
    ["Description"] = "",
    ["Default"] = false
})
local vu974 = false
v973:OnChanged(function(p975)
	-- upvalues: (ref) vu974
    vu974 = p975
end)
v4.ToggleFarmRace:SetValue(false)
task.spawn(function()
	-- upvalues: (ref) vu974
    while task.task.wait() do
        if vu974 then
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
                    if game.Players.LocalPlayer.Character.RaceTransformed.Value ~= true then
                        if game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                            _G.AutoBoneNoQuest = true
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                            task.wait()
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
                        end
                    else
                        _G.AutoBoneNoQuest = false
                        Tween(CFrame.new(- 9698.4736328125, 445.09442138671875, 6545.8525390625))
                    end
                end
            end)
        else
            _G.AutoBoneNoQuest = false
        end
    end
end)
v3.Race:AddToggle("ToggleUpgrade", {
    ["Title"] = "Buy Gear",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p976)
    _G.AutoUpgrade = p976
    if _G.AutoUpgrade then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
    end
end)
v4.ToggleUpgrade:SetValue(false)
