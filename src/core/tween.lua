--[[
    Banana Crack Hub - Movement & Tween Engine
    Bypasses anti-cheat for smooth flying and island navigation.
]]

-- Flying offset loop: rotasi CFrame offset agar anti-cheat tidak detect posisi statis
task.spawn(function()
    while task.wait() do
        if Type == 1 then
            Pos = CFrame.new(0, 40, 0)
        elseif Type == 2 then
            Pos = CFrame.new(-40, 40, 0)
        elseif Type == 3 then
            Pos = CFrame.new(40, 40, 0)
        elseif Type == 4 then
            Pos = CFrame.new(0, 40, 40)
        elseif Type == 5 then
            Pos = CFrame.new(0, 40, -40)
        end
    end
end)

-- Type cycling loop
task.spawn(function()
    while task.wait() do
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

-- Fungsi teleport jarak jauh dengan bypass anti-cheat
function to(targetCFrame)
    pcall(function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChild("Humanoid")
        if not hrp or not hum then return end
        if hum.Health <= 0 then return end
        if Auto_Raid then return end

        local dist = (targetCFrame.Position - hrp.Position).Magnitude
        if dist < 2000 then return end

        -- Cek apakah perlu requestEntrance untuk area khusus
        if NameMon == "FishmanQuest" then
            Tween(hrp.CFrame)
            task.wait()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            return
        elseif Mon == "God's Guard" then
            Tween(hrp.CFrame)
            task.wait()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
            return
        elseif NameMon == "SkyExp1Quest" then
            Tween(hrp.CFrame)
            task.wait()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            return
        elseif NameMon == "ShipQuest1" or NameMon == "ShipQuest2" then
            Tween(hrp.CFrame)
            task.wait()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            return
        elseif NameMon == "FrostQuest" then
            Tween(hrp.CFrame)
            task.wait()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            return
        end

        -- Teleport terbang biasa untuk jarak jauh (>= 2000 studs)
        repeat
            task.wait(_G.Fast_Delay or 0.1)
            char = lp.Character
            if not char then break end
            hrp = char:FindFirstChild("HumanoidRootPart")
            hum = char:FindFirstChild("Humanoid")
            if not hrp or not hum then break end
            if hum.Health <= 0 then break end
            hum:ChangeState(15) -- Physics bypass / jump state
            hrp.CFrame = targetCFrame
            task.wait()
            hrp.CFrame = targetCFrame
        until not hrp or (targetCFrame.Position - hrp.Position).Magnitude <= 5
    end)
end
