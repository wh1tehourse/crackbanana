-- Tab: Main Farm (Level, Mob Aura, Castle Raid, Mastery, Bones, Cake Prince, Boss, Material)
})
_G.FastAttackStrix_Mode = "Super Fast Attack"
task.spawn(function()
    while task.task.wait() do
        if _G.FastAttackStrix_Mode then
            pcall(function()
                if _G.FastAttackStrix_Mode == "Super Fast Attack" then
                    _G.Fast_Delay = 1e-9
                end
            end)
        end
    end
end)
local v239 = v3.Main:AddDropdown("DropdownSelectWeapon", {
    ["Title"] = "Select Weapon",
    ["Description"] = "",
    ["Values"] = {
        "Melee",
        "Sword",
        "Blox Fruits"
    },
    ["Multi"] = false,
    ["Default"] = 1
})
v239:SetValue("Melee")
v239:OnChanged(function(p240)
    ChooseWeapon = p240
end)
task.task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if ChooseWeapon ~= "Melee" then
                if ChooseWeapon ~= "Sword" then
                    if ChooseWeapon == "Blox Fruit" then
                        local v241, v242, v243 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v244
                            v243, v244 = v241(v242, v243)
                            if v243 == nil then
                                break
                            end
                            if v244.ToolTip == "Blox Fruit" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v244.Name)) then
                                SelectWeapon = v244.Name
                            end
                        end
                    end
                else
                    local v245, v246, v247 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                    while true do
                        local v248
                        v247, v248 = v245(v246, v247)
                        if v247 == nil then
                            break
                        end
                        if v248.ToolTip == "Sword" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v248.Name)) then
                            SelectWeapon = v248.Name
                        end
                    end
                end
            else
                local v249, v250, v251 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                while true do
                    local v252
                    v251, v252 = v249(v250, v251)
                    if v251 == nil then
                        break
                    end
                    if v252.ToolTip == "Melee" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v252.Name)) then
                        SelectWeapon = v252.Name
                    end
                end
            end
        end)
    end
end)
v3.Main:AddToggle("ToggleLevel", {
    ["Title"] = "Auto Farm Level",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p253)
    _G.AutoLevel = p253
    if p253 == false then
        task.wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        task.wait()
    end
end)
v4.ToggleLevel:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoLevel then
            pcall(function()
                CheckLevel()
                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        local v254, v255, v256 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v257
                            v256, v257 = v254(v255, v256)
                            if v256 == nil then
                                break
                            end
                            if v257:FindFirstChild("Humanoid") and (v257:FindFirstChild("HumanoidRootPart") and (v257.Humanoid.Health > 0 and v257.Name == Ms)) then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    bringmob = true
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v257.HumanoidRootPart.CFrame * Pos)
                                    v257.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v257.HumanoidRootPart.Transparency = 1
                                    v257.Humanoid.JumpPower = 0
                                    v257.Humanoid.WalkSpeed = 0
                                    v257.HumanoidRootPart.CanCollide = false
                                    FarmPos = v257.HumanoidRootPart.CFrame
                                    MonFarm = v257.Name
                                until not _G.AutoLevel or (not v257.Parent or v257.Humanoid.Health <= 0) or (not game:GetService("Workspace").Enemies:FindFirstChild(v257.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false)
                                bringmob = false
                            end
                        end
                        local v258, v259, v260 = pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren())
                        while true do
                            local v261
                            v260, v261 = v258(v259, v260)
                            if v260 == nil then
                                break
                            end
                            if string.find(v261.Name, NameMon) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v261.Position).Magnitude >= 10 then
                                Tween(v261.HumanoidRootPart.CFrame * Pos)
                            end
                        end
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    Tween(CFrameQ)
                    if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                    end
                end
            end)
        end
    end
end)
v3.Main:AddToggle("ToggleMobAura", {
    ["Title"] = "Attack Nearest Mob (Mob Aura)",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p262)
    _G.AutoNear = p262
    if p262 == false then
        task.wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        task.wait()
    end
end)
v4.ToggleMobAura:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoNear then
            pcall(function()
                local v263, v264, v265 = pairs(game.Workspace.Enemies:GetChildren())
                while true do
                    local v266
                    v265, v266 = v263(v264, v265)
                    if v265 == nil then
                        break
                    end
                    if v266:FindFirstChild("Humanoid") and (v266:FindFirstChild("HumanoidRootPart") and (v266.Humanoid.Health > 0 and (v266.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v266:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000))) then
                        repeat
                            task.wait(_G.Fast_Delay)
                            AttackNoCoolDown()
                            bringmob = true
                            AutoHaki()
                            EquipTool(SelectWeapon)
                            Tween(v266.HumanoidRootPart.CFrame * Pos)
                            v266.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v266.HumanoidRootPart.Transparency = 1
                            v266.Humanoid.JumpPower = 0
                            v266.Humanoid.WalkSpeed = 0
                            v266.HumanoidRootPart.CanCollide = false
                            FarmPos = v266.HumanoidRootPart.CFrame
                            MonFarm = v266.Name
                        until not _G.AutoNear or (not v266.Parent or v266.Humanoid.Health <= 0) or not game.Workspace.Enemies:FindFirstChild(v266.Name)
                        bringmob = false
                    end
                end
            end)
        end
    end
end)
v3.Main:AddToggle("ToggleCastleRaid", {
    ["Title"] = "Auto Castle Raid",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p267)
    _G.CastleRaid = p267
end)
v4.ToggleCastleRaid:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.CastleRaid then
            pcall(function()
                local v268 = CFrame.new(- 5496.17432, 313.768921, - 2841.53027, 0.924894512, 7.37058e-9, 0.380223751, 3.588102e-8, 1, - 1.06665446e-7, - 0.380223751, 1.1229711e-7, 0.924894512)
                if (CFrame.new(- 5539.3115234375, 313.800537109375, - 2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                    Tween(v268)
                else
                    local v269, v270, v271 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v272
                        v271, v272 = v269(v270, v271)
                        if v271 == nil then
                            break
                        end
                        if _G.CastleRaid and (v272:FindFirstChild("HumanoidRootPart") and (v272:FindFirstChild("Humanoid") and (v272.Humanoid.Health > 0 and (v272.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000))) then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v272.HumanoidRootPart.CanCollide = false
                                v272.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                Tween(v272.HumanoidRootPart.CFrame * Pos)
                            until v272.Humanoid.Health <= 0 or not (v272.Parent and _G.CastleRaid)
                        end
                    end
                end
            end)
        end
    end
end)
v3.Main:AddToggle("ToggleHakiFortress", {
    ["Title"] = "Activate Color Haki (Fortress)",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p273)
    _G.EnableHakiFortress = p273
end)
v4.ToggleHakiFortress:SetValue(false)
local function vu277(p274, p275)
    local v276 = {
        {
            ["StorageName"] = p274,
            ["Type"] = "AuraSkin",
            ["Context"] = "Equip"
        }
    }
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/FruitCustomizerRF"):InvokeServer(unpack(v276))
    Tween2(p275)
end
local function vu281(p278, p279)
    local v280 = game.Players.LocalPlayer.Character
    if v280 and v280:FindFirstChild("HumanoidRootPart") then
        return (v280.HumanoidRootPart.Position - p278).Magnitude < p279
    else
        return false
    end
end
task.spawn(function()
	-- upvalues: (ref) vu277, (ref) vu281
    while true do
        if _G.EnableHakiFortress then
            vu277("Snow White", Vector3.new(- 4971.71826171875, 335.9582214355469, - 3720.0595703125))
            while not vu281(Vector3.new(- 4971.71826171875, 335.9582214355469, - 3720.0595703125), 1) do
                task.wait(0.1)
            end
            task.wait(0.5)
            vu277("Pure Red", Vector3.new(- 5414.92041015625, 314.2582092285156, - 2212.20166015625))
            while not vu281(Vector3.new(- 5414.92041015625, 314.2582092285156, - 2212.20166015625), 1) do
                task.wait(0.1)
            end
            task.wait(0.5)
            vu277("Winter Sky", Vector3.new(- 5420.26318359375, 1089.3582763671875, - 2666.8193359375))
            while not vu281(Vector3.new(- 5420.26318359375, 1089.3582763671875, - 2666.8193359375), 1) do
                task.wait(0.1)
            end
            task.wait(0.5)
            _G.EnableHakiFortress = false
        end
        task.wait(0.5)
    end
end)
v3.Main:AddToggle("ToggleCollectChest", {
    ["Title"] = "Auto Collect Chests",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p282)
    _G.AutoCollectChest = p282
end)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoCollectChest then
            local v283 = game:GetService("Players").LocalPlayer
            local v284 = (v283.Character or v283.CharacterAdded:Wait()):GetPivot().Position
            local v285 = game:GetService("CollectionService"):GetTagged("_ChestTagged")
            local v286 = math.huge
            local v287 = nil
            for v288 = 1, # v285 do
                local v289 = v285[v288]
                local v290 = (v289:GetPivot().Position - v284).Magnitude
                if not v289:GetAttribute("IsDisabled") then
                    if v290 < v286 then
                        v287 = v289
                        v286 = v290
                    end
                end
            end
            if v287 then
                local v291 = v287:GetPivot().Position
                local v292 = CFrame.new(v291)
                Tween2(v292)
            end
        end
    end
end)
v3.Main:AddSection("Mastery")
local v293 = v3.Main:AddDropdown("DropdownMastery", {
    ["Title"] = "Auto Farm Mastery",
    ["Description"] = "",
    ["Values"] = {
        "Near Mobs"
    },
    ["Multi"] = false,
    ["Default"] = 1
})
v293:SetValue(TypeMastery)
v293:OnChanged(function(p294)
    TypeMastery = p294
end)
v3.Main:AddToggle("ToggleMasteryFruit", {
    ["Title"] = "Auto Farm Fruit Mastery",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p295)
    AutoFarmMasDevilFruit = p295
end)
v4.ToggleMasteryFruit:SetValue(false)
local v297 = v3.Main:AddSlider("SliderHealt", {
    ["Title"] = "Mob Health %",
    ["Description"] = "",
    ["Default"] = 20,
    ["Min"] = 0,
    ["Max"] = 100,
    ["Rounding"] = 1,
    ["Callback"] = function(p296)
        KillPercent = p296
    end
})
v297:OnChanged(function(p298)
    KillPercent = p298
end)
v297:SetValue(20)
task.spawn(function()
    while task.task.wait() do
        if _G.UseSkill then
            pcall(function()
				-- block 48
                if not _G.UseSkill then
					-- ::l3::
                    return
                end
                local v299, v300, v301 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- ::l4::
                local v302
                v301, v302 = v299(v300, v301)
                if v301 == nil then
					-- goto l3
                end
                if v302.Name ~= MonFarm or (not v302:FindFirstChild("Humanoid") or (not v302:FindFirstChild("HumanoidRootPart") or v302.Humanoid.Health > v302.Humanoid.MaxHealth * KillPercent / 100)) then
					-- goto l4
                end
				-- ::l13::
                game:GetService("RunService").Heartbeat:task.wait()
                EquipTool(game.Players.LocalPlayer.Data.DevilFruit.Value)
                Tween(v302.HumanoidRootPart.CFrame * Pos)
                PositionSkillMasteryDevilFruit = v302.HumanoidRootPart.Position
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = PositionSkillMasteryDevilFruit
                    local v303 = game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value
                    if SkillZ and 1 <= v303 then
                        game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                        task.wait()
                        game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                    end
                    if SkillX and 2 <= v303 then
                        game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                        task.wait()
                        game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                    end
                    if SkillC and 3 <= v303 then
                        game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                        task.wait()
                        game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                    end
                    if SkillV and 4 <= v303 then
                        game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                        task.wait()
                        game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                    end
                    if SkillF and 5 <= v303 then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                        task.wait()
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                    end
                end
                if AutoFarmMasDevilFruit and (_G.UseSkill and v302.Humanoid.Health ~= 0) then
					-- goto l13
                else
					-- goto l3
                end
				-- ::l3::
				-- ::l2::
				-- goto l4
            end)
        end
    end
end)
task.spawn(function()
    while task.task.wait(0.1) do
        if AutoFarmMasDevilFruit and TypeMastery == "Near Mobs" then
            pcall(function()
                local v304, v305, v306 = pairs(game.Workspace.Enemies:GetChildren())
                while true do
                    local v307
                    v306, v307 = v304(v305, v306)
                    if v306 == nil then
                        return
                    end
                    if v307.Name and (v307:FindFirstChild("Humanoid") and (v307:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v307:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000)) then
                        repeat
                            if true then
                                task.wait(_G.Fast_Delay)
                                if v307.Humanoid.Health > v307.Humanoid.MaxHealth * KillPercent / 100 then
                                    _G.UseSkill = false
                                    AutoHaki()
                                    bringmob = true
                                    EquipTool(SelectWeapon)
                                    Tween(v307.HumanoidRootPart.CFrame * Pos)
                                    v307.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v307.HumanoidRootPart.Transparency = 1
                                    v307.Humanoid.JumpPower = 0
                                    v307.Humanoid.WalkSpeed = 0
                                    v307.HumanoidRootPart.CanCollide = false
                                    FarmPos = v307.HumanoidRootPart.CFrame
                                    MonFarm = v307.Name
                                    AttackNoCoolDown()
                                else
                                    _G.UseSkill = true
                                end
                            end
                        until not AutoFarmMasDevilFruit or (not MasteryType == "Near Mobs" or (not v307.Parent or v307.Humanoid.Health == 0))
                        bringmob = false
                        _G.UseSkill = false
                    end
                end
            end)
        end
    end
end)
if Sea3 then
    v3.Main:AddSection("Bones")
    local vu308 = v3.Main:AddParagraph({
        ["Title"] = "Bone Status",
        ["Content"] = ""
    })
    task.spawn(function()
		-- upvalues: (ref) vu308
        pcall(function()
			-- upvalues: (ref) vu308
            while task.task.wait(2.5) do
                local v309 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
                vu308:SetDesc("You have: " .. tostring(v309) .. " Bones")
            end
        end)
    end)
    v3.Main:AddToggle("ToggleBone", {
        ["Title"] = "Auto Farm Bones",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p310)
        _G.AutoBone = p310
        if p310 == false then
            task.wait()
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            task.wait()
        end
    end)
    v4.ToggleBone:SetValue(false)
    local vu311 = CFrame.new(- 9515.75, 174.8521728515625, 6079.40625)
    task.spawn(function()
		-- upvalues: (ref) vu311
        while task.task.wait() do
            if _G.AutoBone then
                pcall(function()
					-- upvalues: (ref) vu311
                    local v312 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(v312, "Demonic Soul") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or (game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or (game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")))) then
                            local v313, v314, v315 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v316
                                v315, v316 = v313(v314, v315)
                                if v315 == nil then
                                    break
                                end
                                if v316:FindFirstChild("HumanoidRootPart") and (v316:FindFirstChild("Humanoid") and (v316.Humanoid.Health > 0 and (v316.Name == "Reborn Skeleton" or (v316.Name == "Living Zombie" or (v316.Name == "Demonic Soul" or v316.Name == "Posessed Mummy"))))) then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                        repeat
                                            task.wait(_G.Fast_Delay)
                                            AttackNoCoolDown()
                                            AutoHaki()
                                            bringmob = true
                                            EquipTool(SelectWeapon)
                                            Tween(v316.HumanoidRootPart.CFrame * Pos)
                                            v316.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v316.HumanoidRootPart.Transparency = 1
                                            v316.Humanoid.JumpPower = 0
                                            v316.Humanoid.WalkSpeed = 0
                                            v316.HumanoidRootPart.CanCollide = false
                                            FarmPos = v316.HumanoidRootPart.CFrame
                                            MonFarm = v316.Name
                                        until not _G.AutoBone or (v316.Humanoid.Health <= 0 or not v316.Parent) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    else
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        bringmob = false
                                    end
                                end
                            end
                        end
                    else
                        Tween(vu311)
                        if (vu311.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
                        end
                    end
                end)
            end
        end
    end)
    local vu317 = CFrame.new(- 9515.75, 174.8521728515625, 6079.40625)
    task.spawn(function()
		-- upvalues: (ref) vu317
        while task.task.wait() do
            if _G.AutoBoneNoQuest then
                pcall(function()
					-- upvalues: (ref) vu317
                    Tween(vu317)
                    local _ = (vu317.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3
                    if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or (game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or (game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy"))) then
                        local v318, v319, v320 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v321
                            v320, v321 = v318(v319, v320)
                            if v320 == nil then
                                break
                            end
                            if v321:FindFirstChild("HumanoidRootPart") and (v321:FindFirstChild("Humanoid") and (v321.Humanoid.Health > 0 and (v321.Name == "Reborn Skeleton" or (v321.Name == "Living Zombie" or (v321.Name == "Demonic Soul" or v321.Name == "Posessed Mummy"))))) then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    bringmob = true
                                    EquipTool(SelectWeapon)
                                    Tween(v321.HumanoidRootPart.CFrame * Pos)
                                    v321.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v321.HumanoidRootPart.Transparency = 1
                                    v321.Humanoid.JumpPower = 0
                                    v321.Humanoid.WalkSpeed = 0
                                    v321.HumanoidRootPart.CanCollide = false
                                    FarmPos = v321.HumanoidRootPart.CFrame
                                    MonFarm = v321.Name
                                until not _G.AutoBoneNoQuest or (v321.Humanoid.Health <= 0 or not v321.Parent)
                            end
                        end
                    end
                end)
            end
        end
    end)
    v3.Main:AddToggle("ToggleRandomBone", {
        ["Title"] = "Random Surprise (Bone)",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p322)
        _G.AutoRandomBone = p322
    end)
    v4.ToggleRandomBone:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if _G.AutoRandomBone then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "Bones",
                    "Buy",
                    1,
                    1
                }))
            end
        end
    end)
end
if Sea3 then
    v3.Main:AddSection("Cake Prince")
    local vu323 = v3.Main:AddParagraph({
        ["Title"] = "Status",
        ["Content"] = ""
    })
    task.spawn(function()
		-- upvalues: (ref) vu323
        while task.task.wait(2) do
            pcall(function()
                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ~= 88 then
                    if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ~= 87 then
                        if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ~= 86 then
                            vu323:SetDesc("Cake Prince : ✅️")
                        else
    vu323:SetDesc("Remaining: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 39) .. " ")
                        end
                    else
    vu323:SetDesc("Remaining: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 40) .. "")
                    end
                else
                    vu323:SetDesc("Left: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41) .. "")
                end
            end)
        end
    end)
    local v324 = v3.Main:AddToggle("ToggleCake", {
        ["Title"] = "Auto Cake Prince",
        ["Description"] = "",
        ["Default"] = false
    })
    local vu325 = true
    v324:OnChanged(function(p326)
		-- upvalues: (ref) vu325
        _G.CakePrince = p326
        if p326 then
            if vu325 then
                vu325 = false
                local v327 = CFrame.new(- 2003.932861328125, 380.4824523925781, - 12561.0185546875)
                Tween(v327)
            end
        else
            vu325 = true
            task.wait()
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            task.wait()
        end
    end)
    v4.ToggleCake:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if _G.CakePrince then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        local v328, v329, v330 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v331
                            v330, v331 = v328(v329, v330)
                            if v330 == nil then
                                break
                            end
                            if v331.Name == "Cake Prince" and (v331:FindFirstChild("Humanoid") and (v331:FindFirstChild("HumanoidRootPart") and v331.Humanoid.Health > 0)) then
                                repeat
                                    task.task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v331.HumanoidRootPart.CanCollide = false
                                    v331.Humanoid.WalkSpeed = 0
                                    v331.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v331.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCoolDown()
                                until not _G.CakePrince or (not v331.Parent or v331.Humanoid.Health <= 0)
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    elseif game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 and (game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or (game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or (game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker")))) then
                        local v332, v333, v334 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v335
                            v334, v335 = v332(v333, v334)
                            if v334 == nil then
                                break
                            end
                            if (v335.Name == "Cookie Crafter" or (v335.Name == "Cake Guard" or (v335.Name == "Baking Staff" or v335.Name == "Head Baker"))) and (v335:FindFirstChild("Humanoid") and (v335:FindFirstChild("HumanoidRootPart") and v335.Humanoid.Health > 0)) then
                                repeat
                                    task.task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    bringmob = true
                                    EquipTool(SelectWeapon)
                                    v335.HumanoidRootPart.CanCollide = false
                                    v335.Humanoid.WalkSpeed = 0
                                    v335.Head.CanCollide = false
                                    v335.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    FarmPos = v335.HumanoidRootPart.CFrame
                                    MonFarm = v335.Name
                                    Tween(v335.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCoolDown()
                                until not _G.CakePrince or (not v335.Parent or v335.Humanoid.Health <= 0) or (game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or (game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")))
                                bringmob = false
                            end
                        end
                    end
                end)
            end
        end
    end)
    v3.Main:AddToggle("ToggleDoughKing", {
        ["Title"] = "Auto Dough King",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p336)
        _G.DoughKing = p336
        if p336 == false then
            task.wait()
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            task.wait()
        end
    end)
    v4.ToggleDoughKing:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if _G.DoughKing then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                        local v337, v338, v339 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v340
                            v339, v340 = v337(v338, v339)
                            if v339 == nil then
                                break
                            end
                            if v340.Name == "Dough King" and (v340:FindFirstChild("Humanoid") and (v340:FindFirstChild("HumanoidRootPart") and v340.Humanoid.Health > 0)) then
                                repeat
                                    task.task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v340.HumanoidRootPart.CanCollide = false
                                    v340.Humanoid.WalkSpeed = 0
                                    v340.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v340.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCoolDown()
                                until not _G.DoughKing or (not v340.Parent or v340.Humanoid.Health <= 0)
                            end
                        end
                    end
                end)
            end
        end
    end)
    v3.Main:AddToggle("ToggleSpawnCake", {
        ["Title"] = "Auto Spawn Cake Prince",
        ["Description"] = "",
        ["Default"] = true
    }):OnChanged(function(p341)
        _G.SpawnCakePrince = p341
    end)
    v4.ToggleSpawnCake:SetValue(true)
end
task.spawn(function()
    while task.task.wait() do
        if _G.SpawnCakePrince then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "CakePrinceSpawner",
                true
            }))
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "CakePrinceSpawner"
            }))
        end
    end
end)
if Sea2 then
    v3.Main:AddSection("Ectoplasm Farm")
    v3.Main:AddToggle("ToggleVatChatKiDi", {
        ["Title"] = "Auto Farm Ectoplasm",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p342)
        _G.Ectoplasm = p342
    end)
    v4.ToggleVatChatKiDi:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            pcall(function()
                if _G.Ectoplasm then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or (game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or (game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer"))) then
                        local v343, v344, v345 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v346
                            v345, v346 = v343(v344, v345)
                            if v345 == nil then
                                break
                            end
                            if (v346.Name == "Ship Steward" or (v346.Name == "Ship Engineer" or (v346.Name == "Ship Deckhand" or v346.Name == "Ship Officer" and v346:FindFirstChild("Humanoid")))) and v346.Humanoid.Health > 0 then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    bringmob = true
                                    EquipTool(SelectWeapon)
                                    Tween(v346.HumanoidRootPart.CFrame * Pos)
                                    v346.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v346.HumanoidRootPart.Transparency = 1
                                    v346.Humanoid.JumpPower = 0
                                    v346.Humanoid.WalkSpeed = 0
                                    v346.HumanoidRootPart.CanCollide = false
                                    FarmPos = v346.HumanoidRootPart.CFrame
                                    MonFarm = v346.Name
                                until _G.Ectoplasm == false or (not v346.Parent or v346.Humanoid.Health == 0) or not game:GetService("Workspace").Enemies:FindFirstChild(v346.Name)
                                bringmob = false
                            end
                        end
                    else
                        if (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end
                        Tween(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
                    end
                end
            end)
        end
    end)
end
v3.Main:AddSection("Boss")
if Sea1 then
    tableBoss = {
        "The Gorilla King",
        "Bobby",
        "Yeti",
        "Mob Leader",
        "Vice Admiral",
        "Warden",
        "Chief Warden",
        "Swan",
        "Magma Admiral",
        "Fishman Lord",
        "Wysper",
        "Thunder God",
        "Cyborg",
        "Saber Expert"
    }
elseif Sea2 then
    tableBoss = {
        "Diamond",
        "Jeremy",
        "Fajita",
        "Don Swan",
        "Smoke Admiral",
        "Cursed Captain",
        "Darkbeard",
        "Order",
        "Awakened Ice Admiral",
        "Tide Keeper"
    }
elseif Sea3 then
    tableBoss = {
        "Stone",
        "Hydra Leader",
        "Kilo Admiral",
        "Captain Elephant",
        "Beautiful Pirate",
        "rip_indra True Form",
        "Longma",
        "Soul Reaper",
        "Cake Queen"
    }
end
local v347 = v3.Main:AddDropdown("DropdownBoss", {
    ["Title"] = "Select Boss",
    ["Description"] = "",
    ["Values"] = tableBoss,
    ["Multi"] = false,
    ["Default"] = 1
})
v347:SetValue(_G.SelectBoss)
v347:OnChanged(function(p348)
    _G.SelectBoss = p348
end)
v3.Main:AddToggle("ToggleAutoFarmBoss", {
    ["Title"] = "Auto Farm Boss",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p349)
    _G.AutoBoss = p349
end)
v4.ToggleAutoFarmBoss:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoBoss then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                    local v350, v351, v352 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v353
                        v352, v353 = v350(v351, v352)
                        if v352 == nil then
                            break
                        end
                        if v353.Name == _G.SelectBoss and (v353:FindFirstChild("Humanoid") and (v353:FindFirstChild("HumanoidRootPart") and v353.Humanoid.Health > 0)) then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v353.HumanoidRootPart.CanCollide = false
                                v353.Humanoid.WalkSpeed = 0
                                v353.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                Tween(v353.HumanoidRootPart.CFrame * Pos)
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.AutoBoss or (not v353.Parent or v353.Humanoid.Health <= 0)
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                end
            end)
        end
    end
end)
v3.Main:AddSection("Material")
if Sea1 then
    MaterialList = {
        "Scrap Metal",
        "Leather",
        "Angel Wings",
        "Magma Ore",
        "Fish Tail"
    }
elseif Sea2 then
    MaterialList = {
        "Scrap Metal",
        "Leather",
        "Radioactive Material",
        "Mystic Droplet",
        "Magma Ore",
        "Vampire Fang"
    }
elseif Sea3 then
    MaterialList = {
        "Scrap Metal",
        "Leather",
        "Demonic Wisp",
        "Conjured Cocoa",
        "Dragon Scale",
        "Gunpowder",
        "Fish Tail",
        "Mini Tusk",
        "Hydra Enforcer",
        "Venomous Assailant"
    }
end
local v354 = v3.Main:AddDropdown("DropdownMaterial", {
    ["Title"] = "Select Material",
    ["Description"] = "",
    ["Values"] = MaterialList,
    ["Multi"] = false,
    ["Default"] = 1
})
v354:SetValue(SelectMaterial)
v354:OnChanged(function(p355)
    SelectMaterial = p355
end)
v3.Main:AddToggle("ToggleMaterial", {
    ["Title"] = "Auto Farm Material",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p356)
    _G.AutoMaterial = p356
    if p356 == false then
        task.wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        task.wait()
    end
end)
v4.ToggleMaterial:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoMaterial then
            pcall(function()
                MaterialMon(SelectMaterial)
                Tween(MPos)
                if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
                    local v357, v358, v359 = pairs(game.Workspace.Enemies:GetChildren())
                    while true do
                        local v360
                        v359, v360 = v357(v358, v359)
                        if v359 == nil then
                            break
                        end
                        if v360:FindFirstChild("Humanoid") and (v360:FindFirstChild("HumanoidRootPart") and (v360.Humanoid.Health > 0 and v360.Name == MMon)) then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                bringmob = true
                                EquipTool(SelectWeapon)
                                Tween(v360.HumanoidRootPart.CFrame * Pos)
                                v360.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v360.HumanoidRootPart.Transparency = 1
                                v360.Humanoid.JumpPower = 0
                                v360.Humanoid.WalkSpeed = 0
                                v360.HumanoidRootPart.CanCollide = false
                                FarmPos = v360.HumanoidRootPart.CFrame
                                MonFarm = v360.Name
                            until not _G.AutoMaterial or (not v360.Parent or v360.Humanoid.Health <= 0)
                            bringmob = false
                        end
                    end
                else
                    local v361, v362, v363 = pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren())
                    while true do
                        local v364
                        v363, v364 = v361(v362, v363)
                        if v363 == nil then
                            break
                        end
                        if string.find(v364.Name, Mon) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v364.Position).Magnitude >= 10 then
                            Tween(v364.HumanoidRootPart.CFrame * Pos)
                        end
                    end
                end
            end)
        end
    end
end)
if Sea3 then
    v3.Main:AddSection("Elite")
    local vu578 = v3.Main:AddParagraph({
        ["Title"] = "Elite Hunter Status",
        ["Content"] = ""
    })
    task.spawn(function()
		-- upvalues: (ref) vu578
        while task.task.wait(2) do
            pcall(function()
                if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or (game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or (game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or (game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or (game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban"))))) then
                    vu578:SetDesc("Elite Boss: ✅ | Killed:  " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
                else
                    vu578:SetDesc("Elite Boss: ❌ | Killed: " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
                end
            end)
        end
    end)
    v3.Main:AddToggle("ToggleElite", {
        ["Title"] = "Auto Elite Hunter",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p579)
        _G.AutoElite = p579
    end)
    v4.ToggleElite:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if _G.AutoElite then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")) then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or (game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) then
                            local v580, v581, v582 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v583
                                v582, v583 = v580(v581, v582)
                                if v582 == nil then
                                    break
                                end
                                if v583:FindFirstChild("Humanoid") and (v583:FindFirstChild("HumanoidRootPart") and (v583.Humanoid.Health > 0 and (v583.Name == "Diablo" or (v583.Name == "Deandre" or v583.Name == "Urban")))) then
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        AttackNoCoolDown()
                                        EquipTool(SelectWeapon)
                                        AutoHaki()
                                        Tween2(v583.HumanoidRootPart.CFrame * Pos)
                                        v583.Humanoid.WalkSpeed = 0
                                        v583.HumanoidRootPart.CanCollide = false
                                        v583.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    until _G.AutoElite == false or (v583.Humanoid.Health <= 0 or not v583.Parent)
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                            Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                            Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                            Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end)
            end
        end
    end)
end
if Sea3 then
    v3.Main:AddToggle("ToggleSwordLengend", {
        ["Title"] = "Auto Buy Legendary Sword",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p759)
        _G.BuyLengendSword = p759
    end)
    v4.ToggleSwordLengend:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            pcall(function()
                if _G.BuyLengendSword or Triple_A then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                        "LegendarySwordDealer",
                        "2"
                    }))
                else
                    task.wait()
                end
            end)
        end
    end)
end
if Sea2 then
    v3.Main:AddToggle("ToggleEvoRace", {
        ["Title"] = "Auto Upgrade Race V2",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p760)
        _G.AutoEvoRace = p760
    end)
    v4.ToggleEvoRace:SetValue(false)
    task.spawn(function()
        pcall(function()
            while task.wait(0.1) do
                if _G.AutoEvoRace and not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") ~= 0 then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") ~= 1 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                            end
                        else
                            pcall(function()
                                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                                        if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3")) then
                                            if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                                local v761, v762, v763 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                                                while true do
                                                    local v764
                                                    v763, v764 = v761(v762, v763)
                                                    if v763 == nil then
                                                        break
                                                    end
                                                    if v764.Name == "Zombie" then
                                                        repeat
                                                            task.task.wait(_G.Fast_Delay)
                                                            AutoHaki()
                                                            EquipTool(SelectWeapon)
                                                            Tween(v764.HumanoidRootPart.CFrame * Pos)
                                                            v764.HumanoidRootPart.CanCollide = false
                                                            v764.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                            AttackNoCoolDown()
                                                            FarmPos = v764.HumanoidRootPart.CFrame
                                                            MonFarm = v764.Name
                                                            bringmob = true
                                                        until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or (not v764.Parent or (v764.Humanoid.Health <= 0 or _G.AutoEvoRace == false))
                                                        bringmob = false
                                                    end
                                                end
                                            else
                                                Tween(CFrame.new(- 5685.9233398438, 48.480125427246, - 853.23724365234))
                                            end
                                        end
                                    else
                                        Tween(game:GetService("Workspace").Flower2.CFrame)
                                    end
                                else
                                    Tween(game:GetService("Workspace").Flower1.CFrame)
                                end
                            end)
                        end
                    else
                        Tween(CFrame.new(- 2779.83521, 72.9661407, - 3574.02002, - 0.730484903, 6.390141e-8, - 0.68292886, 3.5996322e-8, 1, 5.5066703e-8, 0.68292886, 1.5642467e-8, - 0.730484903))
                        if (Vector3.new(- 2779.83521, 72.9661407, - 3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                            task.wait(1.3)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
                        end
                    end
                end
            end
        end)
    end)
end
