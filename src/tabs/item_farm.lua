-- Tab: Item Farm (Saber, Pole, Shark Saw, Warden, Hallow Scythe, Yama, Tushita, Torches, CDK, Soul Guitar)
v3.ITM:AddToggle("ToggleAutoSaber", {
    ["Title"] = "Auto Get Saber",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p602)
    _G.Auto_Saber = p602
end)
v4.ToggleAutoSaber:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.Auto_Saber and game.Players.LocalPlayer.Data.Level.Value >= 200 then
            pcall(function()
                if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency ~= 0 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
                        local v603, v604, v605 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v606
                            v605, v606 = v603(v604, v605)
                            if v605 == nil then
                                break
                            end
                            if v606:FindFirstChild("Humanoid") and (v606:FindFirstChild("HumanoidRootPart") and (v606.Humanoid.Health > 0 and v606.Name == "Saber Expert")) then
                                repeat
                                    task.task.wait(_G.Fast_Delay)
                                    EquipTool(SelectWeapon)
                                    Tween(v606.HumanoidRootPart.CFrame * Pos)
                                    v606.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v606.HumanoidRootPart.Transparency = 1
                                    v606.Humanoid.JumpPower = 0
                                    v606.Humanoid.WalkSpeed = 0
                                    v606.HumanoidRootPart.CanCollide = false
                                    bringmob = true
                                    FarmPos = v606.HumanoidRootPart.CFrame
                                    MonFarm = v606.Name
                                    AttackNoCoolDown()
                                until v606.Humanoid.Health <= 0 or not _G.Auto_Saber
                                bringmob = true
                                if v606.Humanoid.Health <= 0 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                                end
                            end
                        end
                    end
                elseif game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency ~= 0 then
                    if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency ~= 0 then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") == 0 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") ~= nil then
                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") ~= 0 then
                                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                                        task.wait(0.5)
                                        EquipTool("Relic")
                                        task.wait(0.5)
                                        Tween(CFrame.new(- 1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.6690688e-9, 0.481375456, 2.53852e-8, 1, - 5.799956e-8, - 0.481375456, 6.3057264e-8, 0.876514494))
                                    end
                                elseif game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                    Tween(CFrame.new(- 2967.59521, - 4.91089821, 5328.70703, 0.342208564, - 0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, - 0.939287126, 0.0184739735, 0.342634559))
                                    local v607, v608, v609 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                                    while true do
                                        local v610
                                        v609, v610 = v607(v608, v609)
                                        if v609 == nil then
                                            break
                                        end
                                        if v610.Name == "Mob Leader" then
                                            if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") and (v610:FindFirstChild("Humanoid") and (v610:FindFirstChild("HumanoidRootPart") and v610.Humanoid.Health > 0)) then
                                                repeat
                                                    task.task.wait(_G.Fast_Delay)
                                                    AutoHaki()
                                                    EquipTool(SelectWeapon)
                                                    v610.HumanoidRootPart.CanCollide = false
                                                    v610.Humanoid.WalkSpeed = 0
                                                    v610.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                    Tween(v610.HumanoidRootPart.CFrame * Pos)
                                                    AttackNoCoolDown()
                                                until v610.Humanoid.Health <= 0 or not _G.Auto_Saber
                                            end
                                            if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                            end
                                        end
                                    end
                                end
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                            end
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                            task.wait(0.5)
                            EquipTool("Cup")
                            task.wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", game:GetService("Players").LocalPlayer.Character.Cup)
                            task.wait(0)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                        end
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                        EquipTool("Torch")
                        Tween(CFrame.new(1114.61475, 5.04679728, 4350.22803, - 0.648466587, - 1.2879909e-9, 0.761243105, - 5.706529e-10, 1, 1.2058454e-9, - 0.761243105, 3.4754488e-10, - 0.648466587))
                    else
                        Tween(CFrame.new(- 1610.00757, 11.5049858, 164.001587, 0.984807551, - 0.167722285, - 0.0449818149, 0.17364943, 0.951244235, 0.254912198, 0.00003423728, - 0.258850515, 0.965917408))
                    end
                elseif (CFrame.new(- 1612.55884, 36.9774132, 148.719543, 0.37091279, 3.071715e-9, - 0.928667724, 3.970995e-8, 1, 1.9167935e-8, 0.928667724, - 4.398698e-8, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 100 then
                    Tween(CFrame.new(- 1612.55884, 36.9774132, 148.719543, 0.37091279, 3.071715e-9, - 0.928667724, 3.970995e-8, 1, 1.9167935e-8, 0.928667724, - 4.398698e-8, 0.37091279))
                else
                    Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                    task.wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                    task.wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                    task.wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                    task.wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                    task.wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                    task.wait(1)
                end
            end)
        end
    end
end)
v3.ITM:AddToggle("ToggleAutoPoleV1", {
    ["Title"] = "Auto Get Pole V1",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p611)
    _G.Auto_PoleV1 = p611
end)
v4.ToggleAutoPoleV1:SetValue(false)
local vu612 = CFrame.new(- 7748.0185546875, 5606.80615234375, - 2305.898681640625)
task.spawn(function()
	-- upvalues: (ref) vu612
    while task.task.wait() do
        if _G.Auto_PoleV1 then
            pcall(function()
				-- upvalues: (ref) vu612
                if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                    local v613, v614, v615 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v616
                        v615, v616 = v613(v614, v615)
                        if v615 == nil then
                            break
                        end
                        if v616.Name == "Thunder God" and (v616:FindFirstChild("Humanoid") and (v616:FindFirstChild("HumanoidRootPart") and v616.Humanoid.Health > 0)) then
                            repeat
                                task.task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v616.HumanoidRootPart.CanCollide = false
                                v616.Humanoid.WalkSpeed = 0
                                v616.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                Tween(v616.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_PoleV1 or (not v616.Parent or v616.Humanoid.Health <= 0)
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vu612.Position).Magnitude < 1500 then
                    Tween(vu612)
                end
                Tween(CFrame.new(- 7748.0185546875, 5606.80615234375, - 2305.898681640625))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)
v3.ITM:AddToggle("ToggleAutoSaw", {
    ["Title"] = "Auto Get Shark Saw",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p617)
    _G.Auto_Saw = p617
end)
v4.ToggleAutoSaw:SetValue(false)
local vu618 = CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094)
task.spawn(function()
	-- upvalues: (ref) vu618
    while task.task.wait() do
        if _G.Auto_Saw then
            pcall(function()
				-- upvalues: (ref) vu618
                if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
                    local v619, v620, v621 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v622
                        v621, v622 = v619(v620, v621)
                        if v621 == nil then
                            break
                        end
                        if v622.Name == "The Saw" and (v622:FindFirstChild("Humanoid") and (v622:FindFirstChild("HumanoidRootPart") and v622.Humanoid.Health > 0)) then
                            repeat
                                task.task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v622.HumanoidRootPart.CanCollide = false
                                v622.Humanoid.WalkSpeed = 0
                                v622.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                Tween(v622.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Saw or (not v622.Parent or v622.Humanoid.Health <= 0)
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vu618.Position).Magnitude < 1500 then
                    Tween(vu618)
                end
                Tween(CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094))
                if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)
v3.ITM:AddToggle("ToggleAutoWarden", {
    ["Title"] = "Auto Get Warden Sword",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p623)
    _G.Auto_Warden = p623
end)
v4.ToggleAutoWarden:SetValue(false)
local vu624 = CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562)
task.spawn(function()
	-- upvalues: (ref) vu624
    while task.task.wait() do
        if _G.Auto_Warden then
            pcall(function()
				-- upvalues: (ref) vu624
                if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
                    local v625, v626, v627 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v628
                        v627, v628 = v625(v626, v627)
                        if v627 == nil then
                            break
                        end
                        if v628.Name == "Chief Warden" and (v628:FindFirstChild("Humanoid") and (v628:FindFirstChild("HumanoidRootPart") and v628.Humanoid.Health > 0)) then
                            repeat
                                task.task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v628.HumanoidRootPart.CanCollide = false
                                v628.Humanoid.WalkSpeed = 0
                                v628.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                Tween(v628.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Warden or (not v628.Parent or v628.Humanoid.Health <= 0)
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vu624.Position).Magnitude < 1500 then
                    Tween(vu624)
                end
                Tween(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)
if Sea3 then
    v3.ITM:AddToggle("ToggleHallow", {
        ["Title"] = "Auto Get Hallow Scythe",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p629)
        AutoHallowSycthe = p629
    end)
    v4.ToggleHallow:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if AutoHallowSycthe then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                        local v630, v631, v632 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v633
                            v632, v633 = v630(v631, v632)
                            if v632 == nil then
                                break
                            end
                            if string.find(v633.Name, "Soul Reaper") then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v633.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v633.HumanoidRootPart.CFrame * Pos)
                                    v633.HumanoidRootPart.Transparency = 1
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until v633.Humanoid.Health <= 0 or AutoHallowSycthe == false
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
                        repeat
                            Tween(CFrame.new(- 8932.322265625, 146.83154296875, 6062.55078125))
                            task.wait()
                        until (CFrame.new(- 8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
                        task.wait()
                        EquipTool("Hallow Essence")
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end)
            end
        end
    end)
    task.spawn(function()
        while task.task.wait() do
            if AutoHallowSycthe then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "Bones",
                    "Buy",
                    1,
                    1
                }))
            end
        end
    end)
    v3.ITM:AddToggle("ToggleYama", {
        ["Title"] = "Auto Get Yama",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p634)
        _G.AutoYama = p634
    end)
    v4.ToggleYama:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if _G.AutoYama and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
                repeat
                    task.wait()
                    fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
            end
        end
    end)
    v3.ITM:AddToggle("ToggleTushita", {
        ["Title"] = "Auto Get Tushita",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p635)
        AutoTushita = p635
    end)
    v4.ToggleTushita:SetValue(false)
    task.spawn(function()
		-- ::l0::
        while true do
            repeat
                if not task.wait() then
                    return
                end
            until AutoTushita
            if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                break
            end
            Tween(CFrame.new(- 10238.875976563, 389.7912902832, - 9549.7939453125))
        end
        local v636, v637, v638 = pairs(game:GetService("Workspace").Enemies:GetChildren())
		-- ::l9::
        local v639
        v638, v639 = v636(v637, v638)
        if v638 ~= nil then
			-- goto l10
        end
		-- goto l0
		-- ::l10::
        if v639.Name == ("Longma" or v639.Name == "Longma") and (v639.Humanoid.Health > 0 and (v639:IsA("Model") and (v639:FindFirstChild("Humanoid") and v639:FindFirstChild("HumanoidRootPart")))) then
			-- goto l5
        else
			-- goto l9
        end
		-- ::l5::
		-- ::l26::
        task.wait(_G.Fast_Delay)
        AttackNoCoolDown()
        AutoHaki()
        if not game.Players.LocalPlayer.Character:FindFirstChild(SelectWeapon) then
            task.wait()
            EquipTool(SelectWeapon)
        end
        FarmPos = v639.HumanoidRootPart.CFrame
        v639.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        v639.Humanoid.JumpPower = 0
        v639.Humanoid.WalkSpeed = 0
        v639.HumanoidRootPart.CanCollide = false
        v639.Humanoid:ChangeState(11)
        Tween(v639.HumanoidRootPart.CFrame * Pos)
        if AutoTushita and (v639.Parent and v639.Humanoid.Health > 0) then
			-- goto l26
        else
			-- goto l9
        end
    end)
    v3.ITM:AddToggle("ToggleHoly", {
        ["Title"] = "Auto Light Torches",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p640)
        _G.Auto_Holy_Torch = p640
    end)
    v4.ToggleHoly:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if _G.Auto_Holy_Torch then
                pcall(function()
                    task.wait()
                    repeat
                        Tween(CFrame.new(- 10752, 417, - 9366))
                        task.wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 10752, 417, - 9366)).Magnitude <= 10
                    task.wait()
                    repeat
                        Tween(CFrame.new(- 11672, 334, - 9474))
                        task.wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 11672, 334, - 9474)).Magnitude <= 10
                    task.wait()
                    repeat
                        Tween(CFrame.new(- 12132, 521, - 10655))
                        task.wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 12132, 521, - 10655)).Magnitude <= 10
                    task.wait()
                    repeat
                        Tween(CFrame.new(- 13336, 486, - 6985))
                        task.wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13336, 486, - 6985)).Magnitude <= 10
                    task.wait()
                    repeat
                        Tween(CFrame.new(- 13489, 332, - 7925))
                        task.wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13489, 332, - 7925)).Magnitude <= 10
                end)
            end
        end
    end)
end
v3.ITM:AddToggle("ToggleAutoCanvander", {
    ["Title"] = "Auto Get Canvander",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p641)
    _G.Auto_Canvander = p641
end)
v4.ToggleAutoCanvander:SetValue(false)
local vu642 = CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875)
task.spawn(function()
	-- upvalues: (ref) vu642
    while task.task.wait() do
        if _G.Auto_Canvander then
            pcall(function()
				-- upvalues: (ref) vu642
                if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                    local v643, v644, v645 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v646
                        v645, v646 = v643(v644, v645)
                        if v645 == nil then
                            break
                        end
                        if v646.Name == "Beautiful Pirate" and (v646:FindFirstChild("Humanoid") and (v646:FindFirstChild("HumanoidRootPart") and v646.Humanoid.Health > 0)) then
                            repeat
                                task.task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v646.HumanoidRootPart.CanCollide = false
                                v646.Humanoid.WalkSpeed = 0
                                v646.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                Tween(v646.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Canvander or (not v646.Parent or v646.Humanoid.Health <= 0)
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vu642.Position).Magnitude < 1500 then
                    Tween(vu642)
                end
                Tween(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)
v3.ITM:AddToggle("ToggleAutoMusketeerHat", {
    ["Title"] = "Auto Get Musketeer Hat",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p647)
    _G.Auto_MusketeerHat = p647
end)
v4.ToggleAutoMusketeerHat:SetValue(false)
task.spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if _G.Auto_MusketeerHat then
                if game:GetService("Players").LocalPlayer.Data.Level.Value < 1800 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits ~= false then
                    if game:GetService("Players").LocalPlayer.Data.Level.Value < 1800 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss ~= false then
                        if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2 then
                            Tween(CFrame.new(- 12512.138671875, 340.39279174805, - 9872.8203125))
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            local v648, v649, v650 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local vu651
                                v650, vu651 = v648(v649, v650)
                                if v650 == nil then
                                    break
                                end
                                if vu651.Name == "Captain Elephant" then
                                    OldCFrameElephant = vu651.HumanoidRootPart.CFrame
                                    repeat
                                        task.task.wait(_G.Fast_Delay)
                                        pcall(function()
											-- upvalues: (ref) vu651
                                            EquipTool(SelectWeapon)
                                            AutoHaki()
                                            vu651.HumanoidRootPart.CanCollide = false
                                            vu651.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            Tween(vu651.HumanoidRootPart.CFrame * Pos)
                                            vu651.HumanoidRootPart.CanCollide = false
                                            vu651.HumanoidRootPart.CFrame = OldCFrameElephant
                                            AttackNoCoolDown()
                                        end)
                                    until _G.Auto_MusketeerHat == false or (vu651.Humanoid.Health <= 0 or not vu651.Parent) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            Tween(CFrame.new(- 13374.889648438, 421.27752685547, - 8225.208984375))
                        end
                    else
                        Tween(CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125))
                        if (CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                            task.wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                        end
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                        local v652, v653, v654 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local vu655
                            v654, vu655 = v652(v653, v654)
                            if v654 == nil then
                                break
                            end
                            if vu655.Name == "Forest Pirate" then
                                repeat
                                    task.task.wait(_G.Fast_Delay)
                                    pcall(function()
										-- upvalues: (ref) vu655
                                        EquipTool(SelectWeapon)
                                        AutoHaki()
                                        vu655.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        Tween(vu655.HumanoidRootPart.CFrame * Pos)
                                        vu655.HumanoidRootPart.CanCollide = false
                                        AttackNoCoolDown()
                                        PosMon = vu655.HumanoidRootPart.CFrame
                                        MonFarm = vu655.Name
                                        bringmob = true
                                    end)
                                until _G.Auto_MusketeerHat == false or (not vu655.Parent or vu655.Humanoid.Health <= 0) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                bringmob = false
                            end
                        end
                    else
                        bringmob = false
                        Tween(CFrame.new(- 13206.452148438, 425.89199829102, - 7964.5537109375))
                    end
                else
                    Tween(CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125))
                    if (Vector3.new(- 12443.8671875, 332.40396118164, - 7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                        task.wait(1.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
                    end
                end
            end
        end
    end)
end)
v3.ITM:AddToggle("ToggleAutoObservationV2", {
    ["Title"] = "Auto Get Observation Haki V2",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p656)
    _G.Auto_ObservationV2 = p656
end)
v4.ToggleAutoObservationV2:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.Auto_ObservationV2 then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") ~= 3 then
                    _G.Auto_MusketeerHat = true
                else
                    _G.Auto_MusketeerHat = false
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple")) then
                        repeat
                            Tween(CFrame.new(- 12444.78515625, 332.40396118164, - 7673.1806640625))
                            task.wait()
                        until not _G.Auto_ObservationV2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 12444.78515625, 332.40396118164, - 7673.1806640625)).Magnitude <= 10
                        task.wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
                        repeat
                            Tween(CFrame.new(- 10920.125, 624.20275878906, - 10266.995117188))
                            task.wait()
                        until not _G.Auto_ObservationV2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 10920.125, 624.20275878906, - 10266.995117188)).Magnitude <= 10
                        task.wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start")
                        task.wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
                    else
                        local v657, v658, v659 = pairs(game:GetService("Workspace"):GetDescendants())
                        while true do
                            local v660
                            v659, v660 = v657(v658, v659)
                            if v659 == nil then
                                break
                            end
                            if v660.Name == "Apple" or (v660.Name == "Banana" or v660.Name == "Pineapple") then
                                v660.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                                task.wait()
                                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v660.Handle, 0)
                                task.wait()
                            end
                        end
                    end
                end
            end
        end)
    end
end)
v3.ITM:AddToggle("ToggleAutoRainbowHaki", {
    ["Title"] = "Auto Get Rainbow Haki",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p661)
    _G.Auto_RainbowHaki = p661
end)
v4.ToggleAutoRainbowHaki:SetValue(false)
task.spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if _G.Auto_RainbowHaki then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
                            local v662, v663, v664 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v665
                                v664, v665 = v662(v663, v664)
                                if v664 == nil then
                                    break
                                end
                                if v665.Name == "Stone" then
                                    OldCFrameRainbow = v665.HumanoidRootPart.CFrame
                                    repeat
                                        task.task.wait(_G.Fast_Delay)
                                        EquipTool(SelectWeapon)
                                        Tween(v665.HumanoidRootPart.CFrame * Pos)
                                        v665.HumanoidRootPart.CanCollide = false
                                        v665.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v665.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        AttackNoCoolDown()
                                    until not _G.Auto_RainbowHaki or (v665.Humanoid.Health <= 0 or not v665.Parent) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                end
                            end
                        else
                            Tween(CFrame.new(- 1086.11621, 38.8425903, 6768.71436))
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Hydra Leader") then
                            local v666, v667, v668 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v669
                                v668, v669 = v666(v667, v668)
                                if v668 == nil then
                                    break
                                end
                                if v669.Name == "Hydra Leader" then
                                    OldCFrameRainbow = v669.HumanoidRootPart.CFrame
                                    repeat
                                        task.task.wait(_G.Fast_Delay)
                                        EquipTool(SelectWeapon)
                                        Tween(v669.HumanoidRootPart.CFrame * Pos)
                                        v669.HumanoidRootPart.CanCollide = false
                                        v669.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v669.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        AttackNoCoolDown()
                                    until not _G.Auto_RainbowHaki or (v669.Humanoid.Health <= 0 or not v669.Parent) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                end
                            end
                        else
                            Tween(CFrame.new(5713.98877, 601.922974, 202.751251))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
                            local v670, v671, v672 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v673
                                v672, v673 = v670(v671, v672)
                                if v672 == nil then
                                    break
                                end
                                if v673.Name == "Kilo Admiral" then
                                    OldCFrameRainbow = v673.HumanoidRootPart.CFrame
                                    repeat
                                        task.task.wait(_G.Fast_Delay)
                                        EquipTool(SelectWeapon)
                                        Tween(v673.HumanoidRootPart.CFrame * Pos)
                                        v673.HumanoidRootPart.CanCollide = false
                                        v673.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v673.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        AttackNoCoolDown()
                                    until not _G.Auto_RainbowHaki or (v673.Humanoid.Health <= 0 or not v673.Parent) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                end
                            end
                        else
                            Tween(CFrame.new(2877.61743, 423.558685, - 7207.31006))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            local v674, v675, v676 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v677
                                v676, v677 = v674(v675, v676)
                                if v676 == nil then
                                    break
                                end
                                if v677.Name == "Captain Elephant" then
                                    OldCFrameRainbow = v677.HumanoidRootPart.CFrame
                                    repeat
                                        task.task.wait(_G.Fast_Delay)
                                        EquipTool(SelectWeapon)
                                        Tween(v677.HumanoidRootPart.CFrame * Pos)
                                        v677.HumanoidRootPart.CanCollide = false
                                        v677.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v677.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        AttackNoCoolDown()
                                    until not _G.Auto_RainbowHaki or (v677.Humanoid.Health <= 0 or not v677.Parent) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                end
                            end
                        else
                            Tween(CFrame.new(- 13485.0283, 331.709259, - 8012.4873))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                            local v678, v679, v680 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v681
                                v680, v681 = v678(v679, v680)
                                if v680 == nil then
                                    break
                                end
                                if v681.Name == "Beautiful Pirate" then
                                    OldCFrameRainbow = v681.HumanoidRootPart.CFrame
                                    repeat
                                        task.task.wait(_G.Fast_Delay)
                                        EquipTool(SelectWeapon)
                                        Tween(v681.HumanoidRootPart.CFrame * Pos)
                                        v681.HumanoidRootPart.CanCollide = false
                                        v681.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v681.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        AttackNoCoolDown()
                                    until not _G.Auto_RainbowHaki or (v681.Humanoid.Health <= 0 or not v681.Parent) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                end
                            end
                        else
                            Tween(CFrame.new(5312.3598632813, 20.141201019287, - 10.158538818359))
                        end
                    else
                        Tween(CFrame.new(- 11892.0703125, 930.57672119141, - 8760.1591796875))
                        if (Vector3.new(- 11892.0703125, 930.57672119141, - 8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            task.wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                        end
                    end
                else
                    Tween(CFrame.new(- 11892.0703125, 930.57672119141, - 8760.1591796875))
                    if (Vector3.new(- 11892.0703125, 930.57672119141, - 8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                        task.wait(1.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                    end
                end
            end
        end
    end)
end)
v3.ITM:AddToggle("ToggleAutoSkullGuitar", {
    ["Title"] = "Auto Soul Guitar",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p682)
    _G.Auto_SkullGuitar = p682
end)
v4.ToggleAutoSkullGuitar:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.Auto_SkullGuitar and GetWeaponInventory("Skull Guitar") == false then
                if (CFrame.new(- 9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 5000 then
                    Tween(CFrame.new(- 9681.458984375, 6.139880657196045, 6341.3720703125))
                elseif game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy", true)
                elseif game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency ~= 0 then
                    if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Error") then
                        Tween(CFrame.new(- 8653.2060546875, 140.98487854003906, 6160.033203125))
                    elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Nothing") then
                        Tween("Wait Full Moon")
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                    end
                elseif game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency ~= 0 then
                    if game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector") then
                        if game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1:FindFirstChild("ClickDetector") then
                            Quest4 = true
                            repeat
                                task.wait()
                                Tween(CFrame.new(- 9553.5986328125, 65.62338256835938, 6041.58837890625))
                            until (CFrame.new(- 9553.5986328125, 65.62338256835938, 6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_SkullGuitar
                            task.wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                            task.wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                            task.wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                            task.wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                            task.wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                            task.wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                            task.wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                            task.wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                            task.wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                            task.wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                            task.wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                            task.wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                            task.wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                            task.wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                            task.wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                        else
                            Quest3 = true
                        end
                    else
                        if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "GuitarPuzzleProgress",
                                "Ghost"
                            }))
                        end
                        if game.Workspace.Enemies:FindFirstChild("Living Zombie") then
                            local v683, v684, v685 = pairs(game.Workspace.Enemies:GetChildren())
                            while true do
                                local v686
                                v685, v686 = v683(v684, v685)
                                if v685 == nil then
                                    break
                                end
                                if v686:FindFirstChild("HumanoidRootPart") and (v686:FindFirstChild("Humanoid") and (v686.Humanoid.Health > 0 and v686.Name == "Living Zombie")) then
                                    EquipTool(SelectWeapon)
                                    v686.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v686.HumanoidRootPart.Transparency = 1
                                    v686.Humanoid.JumpPower = 0
                                    v686.Humanoid.WalkSpeed = 0
                                    v686.HumanoidRootPart.CanCollide = false
                                    v686.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                                    Tween(CFrame.new(- 10160.787109375, 138.6616973876953, 5955.03076171875))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                end
                            end
                        else
                            Tween(CFrame.new(- 10160.787109375, 138.6616973876953, 5955.03076171875))
                        end
                    end
                else
                    Quest2 = true
                    repeat
                        task.wait()
                        Tween(CFrame.new(- 8762.69140625, 176.84783935546875, 6171.3076171875))
                    until (CFrame.new(- 8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_SkullGuitar
                    task.wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
                    task.wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
                    task.wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
                    task.wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
                    task.wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
                    task.wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
                    task.wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
                    task.wait(1)
                end
            end
        end)
    end
end)
v3.ITM:AddToggle("ToggleAutoBuddy", {
    ["Title"] = "Auto Get Buddy Sword",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p687)
    _G.Auto_Buddy = p687
end)
v4.ToggleAutoBuddy:SetValue(false)
local vu688 = CFrame.new(- 731.2034301757812, 381.5658874511719, - 11198.4951171875)
task.spawn(function()
	-- upvalues: (ref) vu688
    while task.task.wait() do
        if _G.Auto_Buddy then
            pcall(function()
				-- upvalues: (ref) vu688
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                    local v689, v690, v691 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v692
                        v691, v692 = v689(v690, v691)
                        if v691 == nil then
                            break
                        end
                        if v692.Name == "Cake Queen" and (v692:FindFirstChild("Humanoid") and (v692:FindFirstChild("HumanoidRootPart") and v692.Humanoid.Health > 0)) then
                            repeat
                                task.task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v692.HumanoidRootPart.CanCollide = false
                                v692.Humanoid.WalkSpeed = 0
                                v692.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                Tween(v692.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Buddy or (not v692.Parent or v692.Humanoid.Health <= 0)
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vu688.Position).Magnitude < 1500 then
                    Tween(vu688)
                end
                Tween(CFrame.new(- 731.2034301757812, 381.5658874511719, - 11198.4951171875))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)
v3.ITM:AddToggle("ToggleAutoDualKatana", {
    ["Title"] = "Auto Get Cursed Dual Katana (CDK)",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p693)
    _G.Auto_DualKatana = p693
end)
v4.ToggleAutoDualKatana:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.Auto_DualKatana then
                if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") or (game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama"))) then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
                            EquipTool("Tushita")
                        end
                    elseif (game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama")) and game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
                        EquipTool("Yama")
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", "Tushita")
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.Auto_DualKatana then
                if GetMaterial("Alucard Fragment") ~= 0 then
                    if GetMaterial("Alucard Fragment") ~= 1 then
                        if GetMaterial("Alucard Fragment") ~= 2 then
                            if GetMaterial("Alucard Fragment") ~= 3 then
                                if GetMaterial("Alucard Fragment") ~= 4 then
                                    if GetMaterial("Alucard Fragment") ~= 5 then
                                        if GetMaterial("Alucard Fragment") == 6 then
                                            if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").ReplicatedStorage:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") then
                                                Auto_Quest_Yama_1 = false
                                                Auto_Quest_Yama_2 = false
                                                Auto_Quest_Yama_3 = false
                                                Auto_Quest_Tushita_1 = false
                                                Auto_Quest_Tushita_2 = false
                                                Auto_Quest_Tushita_3 = false
                                                if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") then
                                                    local v694, v695, v696 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                                                    while true do
                                                        local v697
                                                        v696, v697 = v694(v695, v696)
                                                        if v696 == nil then
                                                            break
                                                        end
                                                        if (v697.Name == "Cursed Skeleton Boss" or v697.Name == "Cursed Skeleton") and v697.Humanoid.Health > 0 then
                                                            EquipTool(Sword)
                                                            Tween(v697.HumanoidRootPart.CFrame * pos)
                                                            v697.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                            v697.HumanoidRootPart.Transparency = 1
                                                            v697.Humanoid.JumpPower = 0
                                                            v697.Humanoid.WalkSpeed = 0
                                                            v697.HumanoidRootPart.CanCollide = false
                                                            bringmob = true
                                                            FarmPos = v697.HumanoidRootPart.CFrame
                                                            MonFarm = v697.Name
                                                            AttackNoCoolDown()
                                                        end
                                                    end
                                                end
                                            elseif (CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 100 then
                                                Tween(CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875))
                                            else
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                                                task.wait(1)
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                                                task.wait(1)
                                                Tween(CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875))
                                                task.wait(1.5)
                                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                                task.wait(1.5)
                                                Tween(CFrame.new(- 12253.5419921875, 598.8999633789062, - 6546.8388671875))
                                            end
                                        end
                                    else
                                        Auto_Quest_Yama_1 = false
                                        Auto_Quest_Yama_2 = false
                                        Auto_Quest_Yama_3 = false
                                        Auto_Quest_Tushita_1 = false
                                        Auto_Quest_Tushita_2 = false
                                        Auto_Quest_Tushita_3 = true
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                                    end
                                else
                                    Auto_Quest_Yama_1 = false
                                    Auto_Quest_Yama_2 = false
                                    Auto_Quest_Yama_3 = false
                                    Auto_Quest_Tushita_1 = false
                                    Auto_Quest_Tushita_2 = true
                                    Auto_Quest_Tushita_3 = false
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                                end
                            else
                                Auto_Quest_Yama_1 = false
                                Auto_Quest_Yama_2 = false
                                Auto_Quest_Yama_3 = false
                                Auto_Quest_Tushita_1 = true
                                Auto_Quest_Tushita_2 = false
                                Auto_Quest_Tushita_3 = false
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                            end
                        else
                            Auto_Quest_Yama_1 = false
                            Auto_Quest_Yama_2 = false
                            Auto_Quest_Yama_3 = true
                            Auto_Quest_Tushita_1 = false
                            Auto_Quest_Tushita_2 = false
                            Auto_Quest_Tushita_3 = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                        end
                    else
                        Auto_Quest_Yama_1 = false
                        Auto_Quest_Yama_2 = true
                        Auto_Quest_Yama_3 = false
                        Auto_Quest_Tushita_1 = false
                        Auto_Quest_Tushita_2 = false
                        Auto_Quest_Tushita_3 = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                    end
                else
                    Auto_Quest_Yama_1 = true
                    Auto_Quest_Yama_2 = false
                    Auto_Quest_Yama_3 = false
                    Auto_Quest_Tushita_1 = false
                    Auto_Quest_Tushita_2 = false
                    Auto_Quest_Tushita_3 = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.task.wait() do
        if Auto_Quest_Yama_1 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") then
                    local v698, v699, v700 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v701
                        v700, v701 = v698(v699, v700)
                        if v700 == nil then
                            break
                        end
                        if v701.Name == "Mythological Pirate" then
                            repeat
                                task.wait()
                                Tween(v701.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 2))
                            until _G.Auto_DualKatana == false or Auto_Quest_Yama_1 == false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                        end
                    end
                else
                    Tween(CFrame.new(- 13451.46484375, 543.712890625, - 6961.0029296875))
                end
            end)
        end
    end
end)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if Auto_Quest_Yama_2 then
                local v702, v703, v704 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    local v705
                    v704, v705 = v702(v703, v704)
                    if v704 == nil then
                        break
                    end
                    if v705:FindFirstChild("HazeESP") then
                        v705.HazeESP.Size = UDim2.new(50, 50, 50, 50)
                        v705.HazeESP.MaxDistance = "inf"
                    end
                end
                local v706, v707, v708 = pairs(game:GetService("ReplicatedStorage"):GetChildren())
                while true do
                    local v709
                    v708, v709 = v706(v707, v708)
                    if v708 == nil then
                        break
                    end
                    if v709:FindFirstChild("HazeESP") then
                        v709.HazeESP.Size = UDim2.new(50, 50, 50, 50)
                        v709.HazeESP.MaxDistance = "inf"
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            local v710, v711, v712 = pairs(game:GetService("Workspace").Enemies:GetChildren())
            while true do
                local v713
                v712, v713 = v710(v711, v712)
                if v712 == nil then
                    break
                end
                if Auto_Quest_Yama_2 and (v713:FindFirstChild("HazeESP") and (v713.HumanoidRootPart.Position - FarmPossEsp.Position).magnitude <= 300) then
                    v713.HumanoidRootPart.CFrame = FarmPossEsp
                    v713.HumanoidRootPart.CanCollide = false
                    v713.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                    if not v713.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                        local v714 = Instance.new("BodyVelocity", v713.HumanoidRootPart)
                        v714.MaxForce = Vector3.new(1, 1, 1) * math.huge
                        v714.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.task.wait() do
        if Auto_Quest_Yama_2 then
            pcall(function()
                local v715, v716, v717 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    while true do
                        local v718
                        v717, v718 = v715(v716, v717)
                        if v717 == nil then
                            return
                        end
                        if v718:FindFirstChild("HazeESP") then
                            break
                        end
                        local v719, v720, v721 = pairs(game:GetService("ReplicatedStorage"):GetChildren())
                        while true do
                            local v722
                            v721, v722 = v719(v720, v721)
                            if v721 == nil then
                                break
                            end
                            if v722:FindFirstChild("HazeESP") then
                                if (v722.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                                    Tween(v722.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                else
                                    Tween(v722.HumanoidRootPart.CFrameMon * CFrame.new(2, 20, 2))
                                end
                            end
                        end
                    end
                    if true then
                        task.wait()
                        if (v718.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                            EquipTool(Sword)
                            Tween(v718.HumanoidRootPart.CFrame * Pos)
                            v718.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v718.HumanoidRootPart.Transparency = 1
                            v718.Humanoid.JumpPower = 0
                            v718.Humanoid.WalkSpeed = 0
                            v718.HumanoidRootPart.CanCollide = false
                            FarmPos = v718.HumanoidRootPart.CFrame
                            MonFarm = v718.Name
                            AttackNoCoolDown()
                            if v718.Humanoid.Health <= 0 and v718.Humanoid:FindFirstChild("Animator") then
                                v718.Humanoid.Animator:Destroy()
                            end
                        else
                            Tween(v718.HumanoidRootPart.CFrame * Pos)
                        end
                    end
                    if _G.Auto_DualKatana ~= false and (Auto_Quest_Yama_2 ~= false and (v718.Parent and (v718.Humanoid.Health > 0 and v718:FindFirstChild("HazeESP")))) then
                        break
                    end
                end
            end)
        end
    end
end)
task.spawn(function()
    while task.task.wait() do
        if Auto_Quest_Yama_3 then
            pcall(function()
				-- block 66
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
                    Tween(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
					-- goto l4
                end
                if not game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                            local v723, v724, v725 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v726
                                v725, v726 = v723(v724, v725)
                                if v725 == nil then
                                    break
                                end
                                if v726.Name == "Soul Reaper" and v726.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        Tween(v726.HumanoidRootPart.CFrame * Pos)
                                    until _G.Auto_DualKatana == false or Auto_Quest_Yama_3 == false or game:GetService("Workspace").Map:FindFirstChild("HellDimension")
                                end
                            end
                        else
                            Tween(CFrame.new(- 9570.033203125, 315.9346923828125, 6726.89306640625))
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    end
					-- ::l4::
                    return
                end
				-- goto l6
				-- ::l9::
                task.wait()
                if not (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Hell\'s Messenger [Lv. 2200] [Boss]"))) then
                    task.wait(5)
                    Tween(game:GetService("Workspace").Map.HellDimension.Torch1.CFrame)
                    task.wait(1.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    task.wait(1.5)
                    Tweem(game:GetService("Workspace").Map.HellDimension.Torch2.CFrame)
                    task.wait(1.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    task.wait(1.5)
                    Tween(game:GetService("Workspace").Map.HellDimension.Torch3.CFrame)
                    task.wait(1.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    task.wait(1.5)
                    Tween(game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
					-- goto l37
                end
                local v727, v728, v729 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- goto l15
				-- ::l10::
				-- goto l9
				-- ::l15::
                local v730
                v729, v730 = v727(v728, v729)
                if v729 == nil then
					-- goto l37
                end
                if v730.Name ~= "Cursed Skeleton" and (v730.Name ~= "Cursed Skeleton" and v730.Name ~= "Hell\'s Messenger") or v730.Humanoid.Health <= 0 then
					-- goto l15
                end
				-- ::l24::
                task.wait()
                EquipTool(Sword)
                Tween(v730.HumanoidRootPart.CFrame * Pos)
                v730.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                v730.HumanoidRootPart.Transparency = 1
                v730.Humanoid.JumpPower = 0
                v730.Humanoid.WalkSpeed = 0
                v730.HumanoidRootPart.CanCollide = false
                FarmPos = v730.HumanoidRootPart.CFrame
                MonFarm = v730.Name
                AttackNoCoolDown()
                if v730.Humanoid.Health <= 0 and v730.Humanoid:FindFirstChild("Animator") then
                    v730.Humanoid.Animator:Destroy()
                end
                if v730.Humanoid.Health <= 0 or (not v730.Parent or Auto_Quest_Yama_3 == false) then
					-- goto l15
                else
					-- goto l24
                end
				-- ::l37::
                if _G.Auto_DualKatana == false or (Auto_Quest_Yama_3 == false or GetMaterial("Alucard Fragment") == 3) then
					-- goto l4
                end
				-- ::l6::
                if true then
					-- goto l10
                else
					-- goto l37
                end
            end)
        end
    end
end)
task.spawn(function()
    while task.task.wait() do
        if Auto_Quest_Tushita_1 then
            Tween(CFrame.new(- 9546.990234375, 21.139892578125, 4686.1142578125))
            task.wait(5)
            Tween(CFrame.new(- 6120.0576171875, 16.455780029296875, - 2250.697265625))
            task.wait(5)
            Tween(CFrame.new(- 9533.2392578125, 7.254445552825928, - 8372.69921875))
        end
    end
end)
task.spawn(function()
    while task.task.wait() do
        if Auto_Quest_Tushita_2 then
            pcall(function()
				-- block 30
                if (CFrame.new(- 5539.3115234375, 313.800537109375, - 2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                    Tween(CFrame.new(- 5545.1240234375, 313.800537109375, - 2976.616455078125))
					-- ::l28::
                    return
                end
                local v731, v732, v733 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- goto l4
				-- ::l2::
				-- goto l15
				-- ::l15::
                task.wait()
                EquipTool(Sword)
                Tween(v734.HumanoidRootPart.CFrame * Pos)
                v734.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                v734.HumanoidRootPart.Transparency = 1
                v734.Humanoid.JumpPower = 0
                v734.Humanoid.WalkSpeed = 0
                v734.HumanoidRootPart.CanCollide = false
                FarmPos = v734.HumanoidRootPart.CFrame
                MonFarm = v734.Name
                AttackNoCoolDown()
                if v734.Humanoid.Health <= 0 and v734.Humanoid:FindFirstChild("Animator") then
                    v734.Humanoid.Animator:Destroy()
                end
                if v734.Humanoid.Health > 0 and (v734.Parent and Auto_Quest_Tushita_2 ~= false) then
					-- goto l15
                end
				-- ::l4::
                local v734
                v733, v734 = v731(v732, v733)
                if v733 == nil then
					-- goto l28
                end
                if Auto_Quest_Tushita_2 and (v734:FindFirstChild("HumanoidRootPart") and (v734:FindFirstChild("Humanoid") and (v734.Humanoid.Health > 0 and (v734.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000))) then
					-- goto l2
                else
					-- goto l4
                end
            end)
        end
    end
end)
task.spawn(function()
    while task.task.wait() do
        if Auto_Quest_Tushita_3 then
            pcall(function()
				-- block 66
                if not (game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") or game.ReplicatedStorage:FindFirstChild("Cake Queen [Lv. 2175] [Boss]")) then
					-- goto l5
                end
                if not game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                    Tween(CFrame.new(- 709.3132934570312, 381.6005859375, - 11011.396484375))
					-- goto l27
                end
                local v735, v736, v737 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- ::l9::
                local v738
                v737, v738 = v735(v736, v737)
                if v737 == nil then
					-- goto l27
                end
                if v738.Name ~= "Cake Queen" or v738.Humanoid.Health <= 0 then
					-- goto l9
                end
                while true do
                    task.wait()
                    EquipTool(Sword)
                    Tween(v738.HumanoidRootPart.CFrame * Pos)
                    v738.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    v738.HumanoidRootPart.Transparency = 1
                    v738.Humanoid.JumpPower = 0
                    v738.Humanoid.WalkSpeed = 0
                    v738.HumanoidRootPart.CanCollide = false
                    FarmPos = v738.HumanoidRootPart.CFrame
                    MonFarm = v738.Name
                    AttackNoCoolDown()
                    if v738.Humanoid.Health <= 0 and v738.Humanoid:FindFirstChild("Animator") then
                        v738.Humanoid.Animator:Destroy()
                    end
                    if _G.Auto_DualKatana == false or Auto_Quest_Tushita_3 == false or game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
						-- goto l9
                    end
                end
				-- ::l9::
				-- ::l14::
				-- ::l37::
                local v739, v740 = v741(v742, v739)
                if v739 == nil then
					-- goto l59
                end
                if v740.Name ~= "Cursed Skeleton" and (v740.Name ~= "Cursed Skeleton" and v740.Name ~= "Heaven\'s Guardian") or v740.Humanoid.Health <= 0 then
					-- goto l37
                end
				-- ::l46::
                task.wait()
                EquipTool(Sword)
                Tween(v740.HumanoidRootPart.CFrame * Pos)
                v740.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                v740.HumanoidRootPart.Transparency = 1
                v740.Humanoid.JumpPower = 0
                v740.Humanoid.WalkSpeed = 0
                v740.HumanoidRootPart.CanCollide = false
                FarmPos = v740.HumanoidRootPart.CFrame
                MonFarm = v740.Name
                AttackNoCoolDown()
                if v740.Humanoid.Health <= 0 and v740.Humanoid:FindFirstChild("Animator") then
                    v740.Humanoid.Animator:Destroy()
                end
                if v740.Humanoid.Health <= 0 or (not v740.Parent or Auto_Quest_Tushita_3 == false) then
					-- goto l9
                else
					-- goto l46
                end
				-- ::l59::
                if not _G.Auto_DualKatana or (not Auto_Quest_Tushita_3 or GetMaterial("Alucard Fragment") == 6) then
					-- goto l27
                end
				-- ::l29::
                if true then
					-- goto l41
                else
					-- goto l59
                end
				-- ::l41::
                task.wait()
                if not (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Heaven\'s Guardian [Lv. 2200] [Boss]"))) then
                    task.wait(5)
                    Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch1.CFrame)
                    task.wait(1.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    task.wait(1.5)
                    Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch2.CFrame)
                    task.wait(1.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    task.wait(1.5)
                    Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch3.CFrame)
                    task.wait(1.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    task.wait(1.5)
                    Tween(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
					-- goto l59
                end
                local v741, v742
                v741, v742, v739 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- goto l37
				-- ::l5::
                if not game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
					-- ::l27::
                    return
                end
				-- goto l29
            end)
        end
    end
end)
if Sea2 then
    v3.ITM:AddToggle("ToggleFactory", {
        ["Title"] = "Auto Factory",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p743)
        _G.Factory = p743
    end)
    v4.ToggleFactory:SetValue(false)
    task.spawn(function()
		-- ::l0::
        while true do
            repeat
                if not task.wait() then
                    return
                end
            until _G.Factory
            if game.Workspace.Enemies:FindFirstChild("Core") then
                break
            end
            if game.ReplicatedStorage:FindFirstChild("Core") then
                Tween(CFrame.new(448.46756, 199.356781, - 441.389252))
                task.wait()
                if _G.Factory and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, - 441.389252)).Magnitude > 10 then
                    break
                end
            end
        end
        local v744, v745, v746 = pairs(game.Workspace.Enemies:GetChildren())
		-- goto l9
		-- ::l7::
		-- goto l14
		-- ::l10::
        if v747.Name == "Core" and v747.Humanoid.Health > 0 then
			-- goto l19
        end
		-- ::l9::
        local v747
        v746, v747 = v744(v745, v746)
        if v746 ~= nil then
			-- goto l10
        end
		-- goto l0
		-- ::l14::
        task.wait(_G.Fast_Delay)
        AttackNoCoolDown()
        repeat
            Tween(CFrame.new(448.46756, 199.356781, - 441.389252))
            task.wait()
        until not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, - 441.389252)).Magnitude <= 10
        EquipTool(SelectWeapon)
        AutoHaki()
        Tween(v747.HumanoidRootPart.CFrame * Pos)
        v747.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        v747.HumanoidRootPart.Transparency = 1
        v747.Humanoid.JumpPower = 0
        v747.Humanoid.WalkSpeed = 0
        v747.HumanoidRootPart.CanCollide = false
        FarmPos = v747.HumanoidRootPart.CFrame
        MonFarm = v747.Name
        if v747.Parent and (v747.Humanoid.Health > 0 and _G.Factory ~= false) then
			-- goto l14
        end
		-- goto l9
		-- ::l19::
		-- goto l7
    end)
end
v3.ITM:AddToggle("ToggleAutoFarmSwan", {
    ["Title"] = "Auto Kill Don Swan",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p748)
    _G.Auto_FarmSwan = p748
end)
v4.ToggleAutoFarmSwan:SetValue(false)
task.spawn(function()
    pcall(function()
        while task.task.wait() do
            if _G.AutoFarmSwan then
                if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan") then
                    local v749, v750, v751 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local vu752
                        v751, vu752 = v749(v750, v751)
                        if v751 == nil then
                            break
                        end
                        if vu752.Name == "Don Swan" and (vu752.Humanoid.Health > 0 and (vu752:IsA("Model") and (vu752:FindFirstChild("Humanoid") and vu752:FindFirstChild("HumanoidRootPart")))) then
                            repeat
                                task.task.wait()
                                pcall(function()
									-- upvalues: (ref) vu752
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    vu752.HumanoidRootPart.CanCollide = false
                                    vu752.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Tween(vu752.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCoolDown()
                                end)
                            until _G.AutoFarmSwan == false or vu752.Humanoid.Health <= 0
                        end
                    end
                else
                    task.task.wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
                    if (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 4 and _G.AutoFarmSwan ~= false then
                        break
                    end
                end
            end
        end
    end)
end)
v3.ITM:AddToggle("ToggleAutoRengoku", {
    ["Title"] = "Auto Get Rengoku",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p753)
    _G.Auto_Regoku = p753
end)
v4.ToggleAutoRengoku:SetValue(false)
task.spawn(function()
    pcall(function()
        while task.task.wait() do
            if _G.Auto_Regoku then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
                    EquipTool("Hidden Key")
                    Tween(CFrame.new(6571.1201171875, 299.23028564453, - 6967.841796875))
                elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") then
                    local v754, v755, v756 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v757
                        v756, v757 = v754(v755, v756)
                        if v756 == nil then
                            break
                        end
                        if (v757.Name == "Snow Lurker" or v757.Name == "Arctic Warrior") and v757.Humanoid.Health > 0 then
                            repeat
                                task.task.wait(_G.Fast_Delay)
                                EquipTool(SelectWeapon)
                                AutoHaki()
                                v757.HumanoidRootPart.CanCollide = false
                                v757.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                FarmPos = v757.HumanoidRootPart.CFrame
                                MonFarm = v757.Name
                                Tween(v757.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                                bringmob = true
                            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or (_G.Auto_Regoku == false or (not v757.Parent or v757.Humanoid.Health <= 0))
                            bringmob = false
                        end
                    end
                else
                    bringmob = false
                    Tween(CFrame.new(5439.716796875, 84.420944213867, - 6715.1635742188))
                end
            end
        end
    end)
end)
if Sea2 or Sea3 then
    v3.ITM:AddToggle("ToggleHakiColor", {
        ["Title"] = "Buy Color Haki",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p758)
        _G.Auto_Buy_Enchancement = p758
    end)
    v4.ToggleHakiColor:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if _G.Auto_Buy_Enchancement then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "ColorsDealer",
                    "2"
                }))
            end
        end
    end)
end
if Sea2 then
