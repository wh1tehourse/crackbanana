-- ESP Visuals & Tracers
        end
    end
    local v98, v99, v100 = pairs(game.Workspace.PineappleSpawner:GetChildren())
    while true do
        local v101
        v100, v101 = v98(v99, v100)
        if v100 == nil then
            break
        end
        if v101:IsA("Tool") then
            if RealFruitESP then
                if v101.Handle:FindFirstChild("NameEsp" .. Number) then
                    v101.Handle["NameEsp" .. Number].TextLabel.Text = v101.Name .. " " .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - v101.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v102 = Instance.new("BillboardGui", v101.Handle)
                    v102.Name = "NameEsp" .. Number
                    v102.ExtentsOffset = Vector3.new(0, 1, 0)
                    v102.Size = UDim2.new(1, 200, 1, 30)
                    v102.Adornee = v101.Handle
                    v102.AlwaysOnTop = true
                    local v103 = Instance.new("TextLabel", v102)
                    v103.Font = Enum.Font.GothamSemibold
                    v103.FontSize = "Size14"
                    v103.TextWrapped = true
                    v103.Size = UDim2.new(1, 0, 1, 0)
                    v103.TextYAlignment = "Top"
                    v103.BackgroundTransparency = 1
                    v103.TextStrokeTransparency = 0.5
                    v103.TextColor3 = Color3.fromRGB(255, 174, 0)
                    v103.Text = v101.Name .. " \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - v101.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v101.Handle:FindFirstChild("NameEsp" .. Number) then
                v101.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    local v104, v105, v106 = pairs(game.Workspace.BananaSpawner:GetChildren())
    while true do
        local v107
        v106, v107 = v104(v105, v106)
        if v106 == nil then
            break
        end
        if v107:IsA("Tool") then
            if RealFruitESP then
                if v107.Handle:FindFirstChild("NameEsp" .. Number) then
                    v107.Handle["NameEsp" .. Number].TextLabel.Text = v107.Name .. " " .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - v107.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v108 = Instance.new("BillboardGui", v107.Handle)
                    v108.Name = "NameEsp" .. Number
                    v108.ExtentsOffset = Vector3.new(0, 1, 0)
                    v108.Size = UDim2.new(1, 200, 1, 30)
                    v108.Adornee = v107.Handle
                    v108.AlwaysOnTop = true
                    local v109 = Instance.new("TextLabel", v108)
                    v109.Font = Enum.Font.GothamSemibold
                    v109.FontSize = "Size14"
                    v109.TextWrapped = true
                    v109.Size = UDim2.new(1, 0, 1, 0)
                    v109.TextYAlignment = "Top"
                    v109.BackgroundTransparency = 1
                    v109.TextStrokeTransparency = 0.5
                    v109.TextColor3 = Color3.fromRGB(251, 255, 0)
                    v109.Text = v107.Name .. " \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - v107.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v107.Handle:FindFirstChild("NameEsp" .. Number) then
                v107.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
end
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if MobESP then
                local v110, v111, v112 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    local v113
                    v112, v113 = v110(v111, v112)
                    if v112 == nil then
                        break
                    end
                    if v113:FindFirstChild("HumanoidRootPart") then
                        if not v113:FindFirstChild("MobEap") then
                            local v114 = Instance.new("BillboardGui")
                            local v115 = Instance.new("TextLabel")
                            v114.Parent = v113
                            v114.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            v114.Active = true
                            v114.Name = "MobEap"
                            v114.AlwaysOnTop = true
                            v114.LightInfluence = 1
                            v114.Size = UDim2.new(0, 200, 0, 50)
                            v114.StudsOffset = Vector3.new(0, 2.5, 0)
                            v115.Parent = v114
                            v115.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v115.BackgroundTransparency = 1
                            v115.Size = UDim2.new(0, 200, 0, 50)
                            v115.Font = Enum.Font.GothamBold
                            v115.TextColor3 = Color3.fromRGB(7, 236, 240)
                            v115.Text.Size = 35
                        end
                        local v116 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v113.HumanoidRootPart.Position).Magnitude)
                        v113.MobEap.TextLabel.Text = v113.Name .. "-" .. v116 .. " Distance"
                    end
                end
            else
                local v117, v118, v119 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    local v120
                    v119, v120 = v117(v118, v119)
                    if v119 == nil then
                        break
                    end
                    if v120:FindFirstChild("MobEap") then
                        v120.MobEap:Destroy()
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if SeaESP then
                local v121, v122, v123 = pairs(game:GetService("Workspace").SeaBeasts:GetChildren())
                while true do
                    local v124
                    v123, v124 = v121(v122, v123)
                    if v123 == nil then
                        break
                    end
                    if v124:FindFirstChild("HumanoidRootPart") then
                        if not v124:FindFirstChild("Seaesps") then
                            local v125 = Instance.new("BillboardGui")
                            local v126 = Instance.new("TextLabel")
                            v125.Parent = v124
                            v125.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            v125.Active = true
                            v125.Name = "Seaesps"
                            v125.AlwaysOnTop = true
                            v125.LightInfluence = 1
                            v125.Size = UDim2.new(0, 200, 0, 50)
                            v125.StudsOffset = Vector3.new(0, 2.5, 0)
                            v126.Parent = v125
                            v126.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v126.BackgroundTransparency = 1
                            v126.Size = UDim2.new(0, 200, 0, 50)
                            v126.Font = Enum.Font.GothamBold
                            v126.TextColor3 = Color3.fromRGB(7, 236, 240)
                            v126.Text.Size = 35
                        end
                        local v127 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v124.HumanoidRootPart.Position).Magnitude)
                        v124.Seaesps.TextLabel.Text = v124.Name .. "-" .. v127 .. " Distance"
                    end
                end
            else
                local v128, v129, v130 = pairs(game:GetService("Workspace").SeaBeasts:GetChildren())
                while true do
                    local v131
                    v130, v131 = v128(v129, v130)
                    if v130 == nil then
                        break
                    end
                    if v131:FindFirstChild("Seaesps") then
                        v131.Seaesps:Destroy()
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if NpcESP then
                local v132, v133, v134 = pairs(game:GetService("Workspace").NPCs:GetChildren())
                while true do
                    local v135
                    v134, v135 = v132(v133, v134)
                    if v134 == nil then
                        break
                    end
                    if v135:FindFirstChild("HumanoidRootPart") then
                        if not v135:FindFirstChild("NpcEspes") then
                            local v136 = Instance.new("BillboardGui")
                            local v137 = Instance.new("TextLabel")
                            v136.Parent = v135
                            v136.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            v136.Active = true
                            v136.Name = "NpcEspes"
                            v136.AlwaysOnTop = true
                            v136.LightInfluence = 1
                            v136.Size = UDim2.new(0, 200, 0, 50)
                            v136.StudsOffset = Vector3.new(0, 2.5, 0)
                            v137.Parent = v136
                            v137.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v137.BackgroundTransparency = 1
                            v137.Size = UDim2.new(0, 200, 0, 50)
                            v137.Font = Enum.Font.GothamBold
                            v137.TextColor3 = Color3.fromRGB(7, 236, 240)
                            v137.Text.Size = 35
                        end
                        local v138 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v135.HumanoidRootPart.Position).Magnitude)
                        v135.NpcEspes.TextLabel.Text = v135.Name .. "-" .. v138 .. " Distance"
                    end
                end
            else
                local v139, v140, v141 = pairs(game:GetService("Workspace").NPCs:GetChildren())
                while true do
                    local v142
                    v141, v142 = v139(v140, v141)
                    if v141 == nil then
                        break
                    end
                    if v142:FindFirstChild("NpcEspes") then
                        v142.NpcEspes:Destroy()
                    end
                end
            end
        end)
    end
end)
function isnil(p143)
    return p143 == nil
end
local function vu145(p144)
    return math.floor(tonumber(p144) + 0.5)
end
Number = math.random(1, 1000000)
function UpdateIslandMirageESP()
	-- upvalues: (ref) vu145
    local v146, v147, v148 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
    while true do
        local vu149
        v148, vu149 = v146(v147, v148)
        if v148 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu149, (ref) vu145
            if MirageIslandESP then
                if vu149.Name == "Mirage Island" then
                    if vu149:FindFirstChild("NameEsp") then
                        vu149.NameEsp.TextLabel.Text = vu149.Name .. "   \n" .. vu145((game:GetService("Players").LocalPlayer.Character.Head.Position - vu149.Position).Magnitude / 3) .. " M"
                    else
                        local v150 = Instance.new("BillboardGui", vu149)
                        v150.Name = "NameEsp"
                        v150.ExtentsOffset = Vector3.new(0, 1, 0)
                        v150.Size = UDim2.new(1, 200, 1, 30)
                        v150.Adornee = vu149
                        v150.AlwaysOnTop = true
                        local v151 = Instance.new("TextLabel", v150)
                        v151.Font = "Code"
                        v151.FontSize = "Size14"
                        v151.TextWrapped = true
                        v151.Size = UDim2.new(1, 0, 1, 0)
                        v151.TextYAlignment = "Top"
                        v151.BackgroundTransparency = 1
                        v151.TextStrokeTransparency = 0.5
                        v151.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif vu149:FindFirstChild("NameEsp") then
                vu149:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
function UpdateAuraESP()
	-- upvalues: (ref) vu145
    local v152, v153, v154 = pairs(game:GetService("Workspace").NPCs:GetChildren())
    while true do
        local vu155
        v154, vu155 = v152(v153, v154)
        if v154 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu155, (ref) vu145
            if AuraESP then
                if vu155.Name == "Master of Enhancement" then
                    if vu155:FindFirstChild("NameEsp") then
                        vu155.NameEsp.TextLabel.Text = vu155.Name .. "   \n" .. vu145((game:GetService("Players").LocalPlayer.Character.Head.Position - vu155.Position).Magnitude / 3) .. " M"
                    else
                        local v156 = Instance.new("BillboardGui", vu155)
                        v156.Name = "NameEsp"
                        v156.ExtentsOffset = Vector3.new(0, 1, 0)
                        v156.Size = UDim2.new(1, 200, 1, 30)
                        v156.Adornee = vu155
                        v156.AlwaysOnTop = true
                        local v157 = Instance.new("TextLabel", v156)
                        v157.Font = "Code"
                        v157.FontSize = "Size14"
                        v157.TextWrapped = true
                        v157.Size = UDim2.new(1, 0, 1, 0)
                        v157.TextYAlignment = "Top"
                        v157.BackgroundTransparency = 1
                        v157.TextStrokeTransparency = 0.5
                        v157.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif vu155:FindFirstChild("NameEsp") then
                vu155:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
function UpdateLSDESP()
	-- upvalues: (ref) vu145
    local v158, v159, v160 = pairs(game:GetService("Workspace").NPCs:GetChildren())
    while true do
        local vu161
        v160, vu161 = v158(v159, v160)
        if v160 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu161, (ref) vu145
            if LADESP then
                if vu161.Name == "Legendary Sword Dealer" then
                    if vu161:FindFirstChild("NameEsp") then
                        vu161.NameEsp.TextLabel.Text = vu161.Name .. "   \n" .. vu145((game:GetService("Players").LocalPlayer.Character.Head.Position - vu161.Position).Magnitude / 3) .. " M"
                    else
                        local v162 = Instance.new("BillboardGui", vu161)
                        v162.Name = "NameEsp"
                        v162.ExtentsOffset = Vector3.new(0, 1, 0)
                        v162.Size = UDim2.new(1, 200, 1, 30)
                        v162.Adornee = vu161
                        v162.AlwaysOnTop = true
                        local v163 = Instance.new("TextLabel", v162)
                        v163.Font = "Code"
                        v163.FontSize = "Size14"
                        v163.TextWrapped = true
                        v163.Size = UDim2.new(1, 0, 1, 0)
                        v163.TextYAlignment = "Top"
                        v163.BackgroundTransparency = 1
                        v163.TextStrokeTransparency = 0.5
                        v163.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif vu161:FindFirstChild("NameEsp") then
                vu161:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
function UpdateGeaESP()
	-- upvalues: (ref) vu145
    local v164, v165, v166 = pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren())
    while true do
        local vu167
        v166, vu167 = v164(v165, v166)
        if v166 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu167, (ref) vu145
            if GearESP then
                if vu167.Name == "MeshPart" then
                    if vu167:FindFirstChild("NameEsp") then
                        vu167.NameEsp.TextLabel.Text = vu167.Name .. "   \n" .. vu145((game:GetService("Players").LocalPlayer.Character.Head.Position - vu167.Position).Magnitude / 3) .. " M"
                    else
                        local v168 = Instance.new("BillboardGui", vu167)
                        v168.Name = "NameEsp"
                        v168.ExtentsOffset = Vector3.new(0, 1, 0)
                        v168.Size = UDim2.new(1, 200, 1, 30)
                        v168.Adornee = vu167
                        v168.AlwaysOnTop = true
                        local v169 = Instance.new("TextLabel", v168)
                        v169.Font = "Code"
                        v169.FontSize = "Size14"
                        v169.TextWrapped = true
                        v169.Size = UDim2.new(1, 0, 1, 0)
                        v169.TextYAlignment = "Top"
                        v169.BackgroundTransparency = 1
                        v169.TextStrokeTransparency = 0.5
                        v169.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif vu167:FindFirstChild("NameEsp") then
                vu167:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
function Tween2(p170)
    -- Tween2: smooth tween ke titik tujuan, await hingga selesai, safe noclip
    pcall(function()
        local lp = game:GetService("Players").LocalPlayer
        local char = lp.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local dist = (p170.Position - hrp.Position).Magnitude
        if dist < 1 then return end -- Sudah di tempat tujuan

        local speed = 350
        local duration = dist / speed

        local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
        local tween = game:GetService("TweenService"):Create(hrp, tweenInfo, { CFrame = p170 })

        _G.Clip2 = true
        _G.ActiveTween2 = tween
        tween:Play()

        -- Cancel check loop selama tween berjalan
        local elapsed = 0
        local step = 0.05
        while elapsed < duration do
            task.wait(step)
            elapsed = elapsed + step
            if _G.CancelTween2 then
                tween:Cancel()
                _G.CancelTween2 = false
                break
            end
        end

        _G.Clip2 = false
        _G.ActiveTween2 = nil
    end)
end

function BTPZ(p175)
    -- Instant teleport (no tween)
    pcall(function()
        local hrp = game.Players.LocalPlayer.Character
            and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = p175
            task.wait()
            hrp.CFrame = p175
        end
    end)
end

TweenSpeed = 350

function Tween(p176)
    -- Tween tanpa await (fire-and-forget), untuk dipakai di dalam loop farming
    pcall(function()
        local lp = game:GetService("Players").LocalPlayer
        local char = lp.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local dist = (p176.Position - hrp.Position).Magnitude
        if dist < 1 then return end

        local speed = math.max(TweenSpeed, 50) -- floor 50 agar tidak terlalu lambat
        local duration = dist / speed

        -- Batalkan tween sebelumnya jika ada
        if _G.ActiveTween then
            pcall(function() _G.ActiveTween:Cancel() end)
        end

        local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
        local tween = game:GetService("TweenService"):Create(hrp, tweenInfo, { CFrame = p176 })
        _G.ActiveTween = tween
        tween:Play()

        if _G.StopTween then
            tween:Cancel()
            _G.ActiveTween = nil
        end
    end)
end

function CancelTween()
    -- Cancel semua tween aktif dan hentikan pergerakan
    _G.StopTween = true
    if _G.ActiveTween then
        pcall(function() _G.ActiveTween:Cancel() end)
        _G.ActiveTween = nil
    end
    if _G.ActiveTween2 then
        pcall(function() _G.ActiveTween2:Cancel() end)
        _G.CancelTween2 = true
        _G.ActiveTween2 = nil
    end
    task.wait()
    _G.StopTween = false
end

function EquipTool(p182)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(p182) then
        local v183 = game.Players.LocalPlayer.Backpack:FindFirstChild(p182)
        task.wait()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v183)
    end
end
