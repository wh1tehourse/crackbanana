--[[
    Banana Crack Hub - Movement & Tween Engine
    Bypasses anti-cheat for smooth flying and island navigation.
]]

-- Inisialisasi Pos dengan nilai default agar tidak nil di frame pertama
Pos = CFrame.new(0, 40, 0)
Type = 1

-- Flying offset loop: rotasi CFrame offset agar anti-cheat tidak detect posisi statis
task.spawn(function()
    while task.wait(0.05) do
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

-- Type cycling loop (0.2s per step = 1 full cycle per detik)
task.spawn(function()
    while task.wait(0.2) do
        if Type >= 5 then
            Type = 1
        else
            Type = Type + 1
        end
    end
end)

--[[
    to(targetCFrame):
    Fungsi teleport universal yang dipakai oleh auto-farm loop.
    - Jarak dekat (< 2000 studs): pakai Tween2 (smooth, await selesai)
    - Jarak jauh (>= 2000 studs): pakai force-CFrame + ChangeState(15) bypass
    - Area khusus (quest tertentu): pakai requestEntrance dulu
    - Aman: pcall + nil-check setiap iterasi + max iteration safety
]]
function to(targetCFrame)
    pcall(function()
        local lp = game:GetService("Players").LocalPlayer
        local char = lp.Character
        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChild("Humanoid")
        if not hrp or not hum then return end
        if hum.Health <= 0 then return end
        if Auto_Raid then return end

        local dist = (targetCFrame.Position - hrp.Position).Magnitude

        -- Jarak sangat dekat, tidak perlu teleport
        if dist <= 5 then return end

        -- Jarak pendek / menengah → pakai smooth Tween2 (await blocking)
        if dist < 2000 then
            Tween2(targetCFrame)
            return
        end

        -- Cek apakah perlu requestEntrance untuk area khusus (jarak jauh)
        if NameMon == "FishmanQuest" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                "requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            return
        elseif Mon == "God's Guard" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                "requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
            return
        elseif NameMon == "SkyExp1Quest" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                "requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            return
        elseif NameMon == "ShipQuest1" or NameMon == "ShipQuest2" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                "requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            return
        elseif NameMon == "FrostQuest" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                "requestEntrance", Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            return
        end

        -- Jarak jauh (>= 2000 studs): force-CFrame + ChangeState anti-cheat bypass
        -- Fast_Delay di-floor 0.05 agar tidak terlalu kecil → CPU spike
        local delay = math.max(_G.Fast_Delay or 0.05, 0.05)
        local maxIter = 200 -- safety: maksimal 200 iterasi (~10 detik)
        local iter = 0

        repeat
            iter = iter + 1
            task.wait(delay)

            -- Re-fetch referensi setiap iterasi (karakter bisa respawn)
            char = lp.Character
            if not char then break end
            hrp = char:FindFirstChild("HumanoidRootPart")
            hum = char:FindFirstChild("Humanoid")
            if not hrp or not hum then break end
            if hum.Health <= 0 then break end

            -- Bypass gravity dan physics
            hum:ChangeState(11) -- PlatformStanding (lebih stabil dari 15)
            hrp.CFrame = targetCFrame
            task.wait()
            hrp.CFrame = targetCFrame

        until iter >= maxIter
            or not hrp
            or (targetCFrame.Position - hrp.Position).Magnitude <= 5
    end)
end
