-- Movement, Combat & FastAttack Utilities
task.spawn(function()
    local v184 = getrawmetatable(game)
    local vu185 = v184.__namecall
    setreadonly(v184, false)
    v184.__namecall = newcclosure(function(...)
		-- upvalues: (ref) vu185
        local v186 = getnamecallmethod()
        local v187 = {
            ...
        }
        if tostring(v186) ~= "FireServer" or (tostring(v187[1]) ~= "RemoteEvent" or (tostring(v187[2]) == "true" or (tostring(v187[2]) == "false" or not _G.UseSkill))) then
            return vu185(...)
        end
        if type(v187[2]) ~= "vector" then
            v187[2] = CFrame.new(PositionSkillMasteryDevilFruit)
        else
            v187[2] = PositionSkillMasteryDevilFruit
        end
        return vu185(unpack(v187))
    end)
end)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.AutoEvoRace or (_G.CastleRaid or (_G.CollectAzure or (_G.TweenToKitsune or (_G.GhostShip or (_G.Ship or (_G.Auto_Holy_Torch or (_G.TeleportPly or (_G.Auto_Sea3 or (_G.Auto_Sea2 or (_G.Tweenfruit or (_G.AutoFishCrew or (_G.Auto_Saber or (_G.AutoShark or (_G.Auto_Warden or (_G.Auto_RainbowHaki or (AutoFarmRace or (_G.AutoQuestRace or (Auto_Law or (AutoTushita or (_G.AutoHolyTorch or (_G.AutoTerrorshark or (_G.farmpiranya or (_G.Auto_MusketeerHat or (_G.Auto_ObservationV2 or (_G.AutoNear or (_G.Auto_PoleV1 or (_G.Auto_Buddy or (_G.Ectoplasm or (AutoEvoRace or (AutoBartilo or (_G.Auto_Canvander or (_G.AutoLevel or (_G.Auto_DualKatana or (Auto_Quest_Yama_3 or (Auto_Quest_Yama_2 or (Auto_Quest_Yama_1 or (Auto_Quest_Tushita_1 or (Auto_Quest_Tushita_2 or (Auto_Quest_Tushita_3 or (_G.Clip2 or (_G.Auto_Regoku or (_G.AutoBone or (_G.AutoBoneNoQuest or (_G.AutoBoss or (AutoFarmMasDevilFruit or (AutoHallowSycthe or (AutoTushita or (_G.CakePrince or (_G.Auto_SkullGuitar or (_G.AutoFarmSwan or (_G.DoughKing or (_G.AutoEliteor or (AutoNextIsland or (Musketeer or (_G.AutoMaterial or (AutoFarmRaceQuest or (_G.Factory or (_G.Auto_Saw or (_G.AutoFrozenDimension or (_G.AutoKillTrial or (_G.AutoUpgrade or _G.TweenToFrozenDimension))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local v188 = Instance.new("BodyVelocity")
                    v188.Name = "BodyClip"
                    v188.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    v188.MaxForce = Vector3.new(100000, 100000, 100000)
                    v188.Velocity = Vector3.new(0, 0, 0)
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)
task.spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoEvoRace or (_G.Auto_RainbowHaki or (_G.Auto_SkullGuitar or (_G.CastleRaid or (_G.CollectAzure or (_G.TweenToKitsune or (_G.Auto_Sea3 or (_G.Auto_Sea2 or (_G.GhostShip or (_G.Ship or (_G.Auto_Holy_Torch or (_G.TeleportPly or (_G.Tweenfruit or (_G.Auto_Saber or (_G.Auto_PoleV1 or (_G.Auto_MusketeerHat or (_G.AutoFishCrew or (_G.AutoShark or (AutoFarmRace or (_G.AutoQuestRace or (_G.Auto_Warden or (Auto_Law or (_G.Auto_DualKatana or (Auto_Quest_Tushita_1 or (Auto_Quest_Tushita_2 or (Auto_Quest_Tushita_3 or (AutoTushita or (_G.AutoHolyTorch or (_G.Auto_Buddy or (_G.AutoTerrorshark or (_G.farmpiranya or (Auto_Quest_Yama_3 or (_G.Auto_ObservationV2 or (Auto_Quest_Yama_2 or (Auto_Quest_Yama_1 or (_G.AutoNear or (_G.Ectoplasm or (AutoEvoRace or (_G.AutoKillTrial or (AutoBartilo or (_G.Auto_Regoku or (_G.AutoLevel or (_G.Clip2 or (_G.AutoBone or (_G.Auto_Canvander or (_G.AutoBoneNoQuest or (_G.AutoBoss or (_G.Auto_Saw or (AutoFarmMasDevilFruit or (AutoHallowSycthe or (AutoTushita or (_G.CakePrince or (_G.DoughKing or (_G.AutoFarmSwan or (_G.AutoEliteor or (AutoNextIsland or (Musketeer or (_G.AutoMaterial or (_G.Factory or (_G.AutoFrozenDimension or (AutoFarmRaceQuest or (_G.AutoUpgrade or _G.TweenToFrozenDimension))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) then
                local v189, v190, v191 = pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())
                while true do
                    local v192
                    v191, v192 = v189(v190, v191)
                    if v191 == nil then
                        break
                    end
                    if v192:IsA("BasePart") then
                        v192.CanCollide = false
                    end
                end
            end
        end)
    end)
end)
task.task.spawn(function()
    if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
        game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                    game.Players.LocalPlayer.Character.Stun.Value = 0
                end
            end)
        end)
    end
end)
function CheckMaterial(p193)
    local v194, v195, v196 = pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory"))
    while true do
        local v197
        v196, v197 = v194(v195, v196)
        if v196 == nil then
            break
        end
        if type(v197) == "table" and (v197.Type == "Material" and v197.Name == p193) then
            return v197.Count
        end
    end
    return 0
end
function GetWeaponInventory(p198)
    local v199, v200, v201 = pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory"))
    while true do
        local v202
        v201, v202 = v199(v200, v201)
        if v201 == nil then
            break
        end
        if type(v202) == "table" and (v202.Type == "Sword" and v202.Name == p198) then
            return true
        end
    end
    return false
end
local vu203 = game.Players.LocalPlayer
function FindEnemiesInRange(p204, p205)
	-- upvalues: (ref) vu203
    local v206 = (vu203.Character or vu203.CharacterAdded:Wait()):GetPivot().Position
    local v207, v208, v209 = ipairs(p205)
    local v210 = nil
    while true do
        local v211
        v209, v211 = v207(v208, v209)
        if v209 == nil then
            break
        end
        if not v211:GetAttribute("IsBoat") and (v211:FindFirstChildOfClass("Humanoid") and v211.Humanoid.Health > 0) then
            local v212 = v211:FindFirstChild("Head")
            if v212 and ((v206 - v212.Position).Magnitude <= 60 and v211 ~= vu203.Character) then
                table.insert(p204, {
                    v211,
                    v212
                })
                v210 = v212
            end
        end
    end
    local v213, v214, v215 = ipairs(game.Players:GetPlayers())
    while true do
        local v216
        v215, v216 = v213(v214, v215)
        if v215 == nil then
            break
        end
        if v216.Character and v216 ~= vu203 then
            local v217 = v216.Character:FindFirstChild("Head")
            if v217 and (v206 - v217.Position).Magnitude <= 60 then
                table.insert(p204, {
                    v216.Character,
                    v217
                })
                v210 = v217
            end
        end
    end
    return v210
end
function GetEquippedTool()
	-- upvalues: (ref) vu203
    local v218 = vu203.Character
    if not v218 then
        return nil
    end
    local v219, v220, v221 = ipairs(v218:GetChildren())
    while true do
        local v222
        v221, v222 = v219(v220, v221)
        if v221 == nil then
            break
        end
        if v222:IsA("Tool") then
            return v222
        end
    end
    return nil
end
function AttackNoCoolDown()
    local vu223 = {}
    local v224 = game:GetService("Workspace").Enemies:GetChildren()
    local vu225 = FindEnemiesInRange(vu223, v224)
    if vu225 then
        if GetEquippedTool() then
            pcall(function()
				-- upvalues: (ref) vu223, (ref) vu225
                local v226 = game:GetService("ReplicatedStorage")
                local v227 = v226:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
                local v228 = v226:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
                if # vu223 <= 0 then
                    task.task.wait(1e-9)
                else
                    v227:FireServer(1e-9)
                    v228:FireServer(vu225, vu223)
                end
            end)
        end
    else
        return
    end
end
Type = 1
task.spawn(function()
    while task.task.wait() do
        if Type ~= 1 then
            if Type ~= 2 then
                if Type ~= 3 then
                    if Type ~= 4 then
                        if Type == 5 then
                            Pos = CFrame.new(0, 40, - 40)
                        end
                    else
                        Pos = CFrame.new(0, 40, 40)
                    end
                else
                    Pos = CFrame.new(40, 40, 0)
                end
            else
                Pos = CFrame.new(- 40, 40, 0)
            end
        else
            Pos = CFrame.new(0, 40, 0)
        end
    end
end)
task.spawn(function()
    while task.task.wait() do
        Type = 1
        task.wait(0.2)
        Type = 2
        task.wait(0.2)
        Type = 3
        task.wait(0.2)
        Type = 4
        task.wait(0.2)
        Type = 5
        task.wait(0.2)
    end
end)
function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end
function to(p229)
    repeat
        task.wait(_G.Fast_Delay)
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p229
        task.task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p229
    until (p229.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
end
function to(pu230)
    pcall(function()
		-- upvalues: (ref) pu230
        if (pu230.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 and (not Auto_Raid and game.Players.LocalPlayer.Character.Humanoid.Health > 0) then
            if NameMon ~= "FishmanQuest" then
                if Mon ~= "God\'s Guard" then
                    if NameMon ~= "SkyExp1Quest" then
                        if NameMon ~= "ShipQuest1" then
                            if NameMon ~= "ShipQuest2" then
                                if NameMon ~= "FrostQuest" then
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pu230
                                        task.wait(0.05)
                                        game.Players.LocalPlayer.Character.Head:Destroy()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pu230
                                    until (pu230.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
                                    task.wait()
                                else
                                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                                    task.wait()
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422))
                                end
                            else
                                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                                task.wait()
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                            end
                        else
                            Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                            task.wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end
                    else
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        task.wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047))
                    end
                else
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688))
                end
            else
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                task.wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        end
    end)
