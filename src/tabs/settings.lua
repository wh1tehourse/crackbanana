-- Tab: Farm Settings (Auto Ken, Spawn Point, Bring Mob, White Screen, Skill Keybinds)
v3.Setting:AddToggle("ToggleAutoT", {
    ["Title"] = "Auto Upgrade Race V3",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p765)
    _G.AutoT = p765
end)
v4.ToggleAutoT:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.AutoT then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
            end
        end)
    end
end)
v3.Setting:AddToggle("ToggleAutoY", {
    ["Title"] = "Auto Use Race V4",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p766)
    _G.AutoY = p766
end)
v4.ToggleAutoY:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.AutoY then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                task.wait()
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
            end
        end)
    end
end)
v3.Setting:AddToggle("ToggleAutoKen", {
    ["Title"] = "Auto Ken Haki",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p767)
    _G.AutoKen = p767
    if p767 then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
    else
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", false)
    end
end)
v4.ToggleAutoKen:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.AutoKen then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
            end
        end)
    end
end)
v3.Setting:AddToggle("ToggleSaveSpawn", {
    ["Title"] = "Auto Set Spawn Point",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p768)
    _G.SaveSpawn = p768
    if p768 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "SetSpawnPoint"
        }))
    end
end)
v4.ToggleSaveSpawn:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.SaveSpawn then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "SetSpawnPoint"
                }))
            end
        end)
    end
end)
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
v3.Setting:AddToggle("ToggleBringMob", {
    ["Title"] = "Bring Mobs (Mob Magnet)",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p769)
    _G.BringMob = p769
end)
v4.ToggleBringMob:SetValue(true)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            local v770, v771, v772 = pairs(game:GetService("Workspace").Enemies:GetChildren())
            while true do
                local v773
                v772, v773 = v770(v771, v772)
                if v772 == nil then
                    break
                end
                if _G.BringMob and (bringmob and (v773.Name == MonFarm and (v773:FindFirstChild("Humanoid") and v773.Humanoid.Health > 0))) then
                    if v773.Name ~= "Factory Staff" then
                        if v773.Name == MonFarm and (v773.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000 then
                            v773.HumanoidRootPart.CFrame = FarmPos
                            v773.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v773.HumanoidRootPart.Transparency = 1
                            v773.Humanoid.JumpPower = 0
                            v773.Humanoid.WalkSpeed = 0
                            if v773.Humanoid:FindFirstChild("Animator") then
                                v773.Humanoid.Animator:Destroy()
                            end
                            v773.HumanoidRootPart.CanCollide = false
                            v773.Head.CanCollide = false
                            v773.Humanoid:ChangeState(11)
                            v773.Humanoid:ChangeState(14)
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    elseif (v773.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000 then
                        v773.Head.CanCollide = false
                        v773.HumanoidRootPart.CanCollide = false
                        v773.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v773.HumanoidRootPart.CFrame = FarmPos
                        if v773.Humanoid:FindFirstChild("Animator") then
                            v773.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end
        end)
    end
end)
v3.Setting:AddToggle("ToggleRemoveNotify", {
    ["Title"] = "Remove Notifications",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p774)
    RemoveNotify = p774
end)
v4.ToggleRemoveNotify:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if RemoveNotify then
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
        else
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
        end
    end
end)
v3.Setting:AddToggle("ToggleWhite", {
    ["Title"] = "White Screen (Reduce Lag)",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p775)
    _G.WhiteScreen = p775
    if _G.WhiteScreen ~= true then
        if _G.WhiteScreen == false then
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    else
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    end
end)
v4.ToggleWhite:SetValue(false)
v3.Setting:AddSection("Skill")
v3.Setting:AddToggle("ToggleZ", {
    ["Title"] = "Z",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p776)
    SkillZ = p776
end)
v4.ToggleZ:SetValue(true)
v3.Setting:AddToggle("ToggleX", {
    ["Title"] = "X",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p777)
    SkillX = p777
end)
v4.ToggleX:SetValue(true)
v3.Setting:AddToggle("ToggleC", {
    ["Title"] = "C",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p778)
    SkillC = p778
end)
v4.ToggleC:SetValue(true)
v3.Setting:AddToggle("ToggleV", {
    ["Title"] = "V",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p779)
    SkillV = p779
end)
v4.ToggleV:SetValue(true)
v3.Setting:AddToggle("ToggleF", {
    ["Title"] = "F",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p780)
    SkillF = p780
end)
v4.ToggleF:SetValue(true)
local v781 = v3.Status
local v782 = v781
local v783 = v781.AddParagraph
local v784 = {
    ["Title"] = "Information",
    ["Content"] = "━━━━━━━━━━━━━━━━━━━━━\n" .. "Name : " .. game.Players.LocalPlayer.DisplayName .. " (@" .. game.Players.LocalPlayer.Name .. ")\n" .. "Level : " .. game:GetService("Players").LocalPlayer.Data.Level.Value .. "\n" .. "Beli : " .. game:GetService("Players").LocalPlayer.Data.Beli.Value .. "\n" .. "Fragments : " .. game:GetService("Players").LocalPlayer.Data.Fragments.Value .. "\n" .. "Bounty/Honor : " .. game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value .. "\n" .. "HP: " .. game.Players.LocalPlayer.Character.Humanoid.Health .. "/" .. game.Players.LocalPlayer.Character.Humanoid.MaxHealth .. "\n" .. "Energy : " .. game.Players.LocalPlayer.Character.Energy.Value .. "/" .. game.Players.LocalPlayer.Character.Energy.MaxValue .. "\n" .. "Race : " .. game:GetService("Players").LocalPlayer.Data.Race.Value .. "\n" .. "Fruit : " .. game:GetService("Players").LocalPlayer.Data.DevilFruit.Value .. "\n━━━━━━━━━━━━━━━━━━━━━"
}
v783(v782, v784)
