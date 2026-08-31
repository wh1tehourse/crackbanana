--[[
    Banana Crack Hub - Movement & Tween Engine
    Bypasses anti-cheat for smooth flying and island navigation.
]]

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

