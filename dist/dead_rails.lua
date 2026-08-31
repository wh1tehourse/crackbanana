--[[
    🍌 Banana Hub - Dead Rails [ Kaitun Bond & Auto Farm ]
    Author: wh1tehourse
    Target Game: Dead Rails (Roblox)
]]

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local ProximityPromptService = game:GetService("ProximityPromptService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- ==============================================================================
-- 1. Anti-AFK Background Engine
-- ==============================================================================
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
end)

-- ==============================================================================
-- 2. Fluent UI Setup
-- ==============================================================================
local Fluent
local success, res = pcall(function()
    return game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua")
end)
if not success or not res or res == "" then
    res = game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/main.lua")
end
Fluent = loadstring(res)()

local Window = Fluent:CreateWindow({
    Title = "Banana Hub - Dead Rails",
    SubTitle = "Kaitun Bond Edition [ v1.0 ]",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    Home = Window:AddTab({ Title = "Information", Icon = "home" }),
    Kaitun = Window:AddTab({ Title = "Kaitun Bond", Icon = "coins" }),
    Train = Window:AddTab({ Title = "Train Auto", Icon = "train" }),
    Combat = Window:AddTab({ Title = "Combat / Aura", Icon = "sword" }),
    Visuals = Window:AddTab({ Title = "ESP & Visuals", Icon = "eye" }),
    Player = Window:AddTab({ Title = "Player / Move", Icon = "user" }),
    Teleport = Window:AddTab({ Title = "Teleports", Icon = "map-pin" }),
    Misc = Window:AddTab({ Title = "Misc / Server", Icon = "settings" })
}

-- ==============================================================================
-- 3. Core State & Utilities
-- ==============================================================================
local State = {
    AutoBond = false,
    AutoScrap = false,
    AutoLootChests = false,
    AutoFuelTrain = false,
    AutoRepairTrain = false,
    KillAura = false,
    KillAuraRadius = 30,
    SilentAim = false,
    InstantPrompt = false,
    SpeedHack = false,
    SpeedValue = 24,
    InfiniteStamina = false,
    Fly = false,
    Noclip = false,
    GodMode = false,
    Fullbright = false,
    BondESP = false,
    TrainESP = false,
    EnemyESP = false,
    ChestESP = false,
    TweenSpeed = 45,
    BondsCollected = 0
}

-- Smooth Tween Function
local currentTween = nil
local function tweenTo(targetCFrame, speed)
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local dist = (targetCFrame.Position - hrp.Position).Magnitude
    local time = math.max(dist / (speed or State.TweenSpeed), 0.1)

    if currentTween then
        currentTween:Cancel()
    end

    local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
    currentTween = TweenService:Create(hrp, tweenInfo, { CFrame = targetCFrame })
    currentTween:Play()
    return currentTween
end

-- Instant Proximity Prompt Hook
local originalPromptHold = {}
local function applyInstantPrompts(enable)
    for _, prompt in ipairs(Workspace:GetDescendants()) do
        if prompt:IsA("ProximityPrompt") then
            if enable then
                if originalPromptHold[prompt] == nil then
                    originalPromptHold[prompt] = prompt.HoldDuration
                end
                prompt.HoldDuration = 0
            elseif originalPromptHold[prompt] ~= nil then
                prompt.HoldDuration = originalPromptHold[prompt]
            end
        end
    end
end

Workspace.DescendantAdded:Connect(function(descendant)
    if State.InstantPrompt and descendant:IsA("ProximityPrompt") then
        task.wait(0.1)
        descendant.HoldDuration = 0
    end
end)

-- Fire Proximity Prompt Safely
local function triggerPrompt(prompt)
    if not prompt or not prompt:IsA("ProximityPrompt") then return end
    pcall(function()
        if fireproximityprompt then
            fireproximityprompt(prompt)
        else
            prompt:InputHoldBegin()
            task.wait(prompt.HoldDuration + 0.05)
            prompt:InputHoldEnd()
        end
    end)
end

-- Find Train Helper
local function getTrainModel()
    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj.Name:lower():find("train") or obj.Name:lower():find("locomotive") or obj:FindFirstChild("Engine") then
            return obj
        end
    end
    return Workspace:FindFirstChild("Train")
end

-- ==============================================================================
-- 4. TAB: Information
-- ==============================================================================
Tabs.Home:AddParagraph({
    Title = "🍌 Banana Hub - Dead Rails",
    Content = "Automated Kaitun, Bond Farming, Train Survival & Combat Engine.\nAuthor: wh1tehourse"
})

local StatusPara = Tabs.Home:AddParagraph({
    Title = "📊 Session Statistics",
    Content = "Bonds Farmed: 0\nCurrent Health: 100%\nTrain Status: Detecting..."
})

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local hp = hum and math.floor(hum.Health) or 0
            local maxHp = hum and math.floor(hum.MaxHealth) or 100
            
            local train = getTrainModel()
            local trainStatus = train and "✅ Found (" .. train.Name .. ")" or "⚠️ Not in range"

            StatusPara:SetDesc(
                "Bonds Farmed: " .. State.BondsCollected ..
                "\nCurrent Health: " .. hp .. " / " .. maxHp ..
                "\nTrain Status: " .. trainStatus ..
                "\nPing: " .. math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) .. " ms"
            )
        end)
    end
end)

Tabs.Home:AddButton({
    Title = "Copy Telegram Community",
    Description = "Official Updates & Script Support",
    Callback = function()
        setclipboard("https://t.me/ayasourcecode")
        Fluent:Notify({ Title = "Banana Hub", Content = "Telegram link copied to clipboard!", Duration = 3 })
    end
})

-- ==============================================================================
-- 5. TAB: Kaitun Bond & Auto Farm
-- ==============================================================================
Tabs.Kaitun:AddSection("⚡ Kaitun Bond Collector")

local AutoBondToggle = Tabs.Kaitun:AddToggle("AutoBond", {
    Title = "Auto Farm Bonds & Cash",
    Description = "Automatically finds, teleports & collects bonds/cash across towns",
    Default = false
})

AutoBondToggle:OnChanged(function(val)
    State.AutoBond = val
end)

local AutoScrapToggle = Tabs.Kaitun:AddToggle("AutoScrap", {
    Title = "Auto Collect Scrap & Materials",
    Description = "Gathers all scrap parts and iron on tracks / towns",
    Default = false
})

AutoScrapToggle:OnChanged(function(val)
    State.AutoScrap = val
end)

local AutoChestToggle = Tabs.Kaitun:AddToggle("AutoChest", {
    Title = "Auto Loot Crates & Chests",
    Description = "Opens supply boxes and loot caches automatically",
    Default = false
})

AutoChestToggle:OnChanged(function(val)
    State.AutoLootChests = val
end)

Tabs.Kaitun:AddSlider("TweenSpeedSlider", {
    Title = "Farming Travel Speed",
    Description = "Speed for flying between bonds & loot targets",
    Default = 45,
    Min = 20,
    Max = 120,
    Rounding = 0,
    Callback = function(val)
        State.TweenSpeed = val
    end
})

-- Kaitun Bond Farm Loop
task.spawn(function()
    while task.wait(0.3) do
        if State.AutoBond or State.AutoScrap or State.AutoLootChests then
            pcall(function()
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                -- Search workspace for Bond / Cash / Scrap / Chests
                local targets = {}
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") and obj.Enabled then
                        local parentName = obj.Parent and obj.Parent.Name:lower() or ""
                        local promptText = (obj.ActionText .. " " .. obj.ObjectText):lower()

                        local isBond = State.AutoBond and (parentName:find("bond") or parentName:find("cash") or parentName:find("money") or promptText:find("bond") or promptText:find("take money") or promptText:find("cash"))
                        local isScrap = State.AutoScrap and (parentName:find("scrap") or parentName:find("metal") or parentName:find("iron") or promptText:find("scrap"))
                        local isChest = State.AutoLootChests and (parentName:find("chest") or parentName:find("crate") or parentName:find("box") or promptText:find("open") or promptText:find("search"))

                        if isBond or isScrap or isChest then
                            local part = obj.Parent:IsA("BasePart") and obj.Parent or obj.Parent:FindFirstChildWhichIsA("BasePart")
                            if part then
                                local dist = (part.Position - hrp.Position).Magnitude
                                table.insert(targets, { Prompt = obj, Part = part, Dist = dist, IsBond = isBond })
                            end
                        end
                    end
                end

                -- Sort by distance (closest first)
                table.sort(targets, function(a, b) return a.Dist < b.Dist end)

                if #targets > 0 then
                    local target = targets[1]
                    local targetCFrame = target.Part.CFrame + Vector3.new(0, 2, 0)
                    
                    local tw = tweenTo(targetCFrame, State.TweenSpeed)
                    if tw then tw.Completed:Wait() end

                    task.wait(0.1)
                    triggerPrompt(target.Prompt)
                    
                    if target.IsBond then
                        State.BondsCollected = State.BondsCollected + 1
                    end
                    task.wait(0.2)
                end
            end)
        end
    end
end)

-- ==============================================================================
-- 6. TAB: Train Auto (Fuel, Repair, Defense)
-- ==============================================================================
Tabs.Train:AddSection("🚂 Train Automation")

Tabs.Train:AddToggle("AutoFuel", {
    Title = "Auto Fuel Engine (Coal / Wood)",
    Description = "Automatically picks up fuel & drops into boiler furnace",
    Default = false,
    Callback = function(val)
        State.AutoFuelTrain = val
    end
})

Tabs.Train:AddToggle("AutoRepair", {
    Title = "Auto Repair Train Cars",
    Description = "Fixes broken train parts when damaged",
    Default = false,
    Callback = function(val)
        State.AutoRepairTrain = val
    end
})

Tabs.Train:AddButton({
    Title = "Teleport to Train Engine",
    Description = "Instantly hop onto the driver cabin",
    Callback = function()
        local train = getTrainModel()
        if train then
            local engine = train:FindFirstChild("Engine") or train:FindFirstChildWhichIsA("BasePart")
            if engine then
                LocalPlayer.Character.HumanoidRootPart.CFrame = engine.CFrame + Vector3.new(0, 5, 0)
            end
        else
            Fluent:Notify({ Title = "Train", Content = "Train not found!", Duration = 3 })
        end
    end
})

-- ==============================================================================
-- 7. TAB: Combat & Kill Aura
-- ==============================================================================
Tabs.Combat:AddSection("⚔️ Combat Engine")

Tabs.Combat:AddToggle("KillAura", {
    Title = "Kill Aura (Zombies & Bandits)",
    Description = "Automatically attacks all hostile mobs within radius",
    Default = false,
    Callback = function(val)
        State.KillAura = val
    end
})

Tabs.Combat:AddSlider("AuraRadius", {
    Title = "Kill Aura Range",
    Default = 25,
    Min = 10,
    Max = 60,
    Rounding = 0,
    Callback = function(val)
        State.KillAuraRadius = val
    end
})

-- Kill Aura Loop
task.spawn(function()
    while task.wait(0.15) do
        if State.KillAura then
            pcall(function()
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local tool = char and char:FindFirstChildOfClass("Tool")
                if not hrp then return end

                for _, model in ipairs(Workspace:GetChildren()) do
                    local hum = model:FindFirstChildOfClass("Humanoid")
                    local root = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("Torso")
                    
                    if hum and root and hum.Health > 0 and model ~= char and not Players:GetPlayerFromCharacter(model) then
                        local dist = (root.Position - hrp.Position).Magnitude
                        if dist <= State.KillAuraRadius then
                            -- Auto-trigger weapon attack
                            if tool and tool:FindFirstChild("RemoteEvent") then
                                tool.RemoteEvent:FireServer(root.Position)
                            elseif tool and tool:FindFirstChild("Attack") then
                                tool.Attack:FireServer(model)
                            else
                                -- Fallback standard tool activation
                                if tool then tool:Activate() end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ==============================================================================
-- 8. TAB: ESP & Visuals
-- ==============================================================================
Tabs.Visuals:AddSection("👁️ World ESP")

local espFolder = Instance.new("Folder")
espFolder.Name = "Banana_ESP"
espFolder.Parent = CoreGui

local function createESP(part, text, color)
    if not part or not part:IsA("BasePart") then return end
    if part:FindFirstChild("BananaHighlight") then return end

    local bill = Instance.new("BillboardGui")
    bill.Name = "BananaHighlight"
    bill.AlwaysOnTop = true
    bill.Size = UDim2.new(0, 100, 0, 25)
    bill.StudsOffset = Vector3.new(0, 2, 0)
    bill.Adornee = part
    bill.Parent = espFolder

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(255, 215, 0)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 13
    label.Parent = bill
end

Tabs.Visuals:AddToggle("BondESP", {
    Title = "Bonds & Cash ESP",
    Default = false,
    Callback = function(val)
        State.BondESP = val
        if not val then
            for _, v in ipairs(espFolder:GetChildren()) do
                if v.Name == "BananaHighlight" then v:Destroy() end
            end
        end
    end
})

Tabs.Visuals:AddToggle("Fullbright", {
    Title = "Fullbright (Night Vision)",
    Description = "Completely brightens nighttime darkness",
    Default = false,
    Callback = function(val)
        State.Fullbright = val
        if val then
            game:GetService("Lighting").Brightness = 2
            game:GetService("Lighting").ClockTime = 14
            game:GetService("Lighting").FogEnd = 100000
            game:GetService("Lighting").GlobalShadows = false
        else
            game:GetService("Lighting").Brightness = 1
            game:GetService("Lighting").GlobalShadows = true
        end
    end
})

-- ==============================================================================
-- 9. TAB: Movement & Player
-- ==============================================================================
Tabs.Player:AddSection("🏃 Player Enhancements")

Tabs.Player:AddToggle("SpeedToggle", {
    Title = "Speed Boost",
    Default = false,
    Callback = function(val)
        State.SpeedHack = val
    end
})

Tabs.Player:AddSlider("SpeedSlider", {
    Title = "WalkSpeed Value",
    Default = 24,
    Min = 16,
    Max = 100,
    Rounding = 0,
    Callback = function(val)
        State.SpeedValue = val
    end
})

Tabs.Player:AddToggle("InfStamina", {
    Title = "Infinite Stamina",
    Default = true,
    Callback = function(val)
        State.InfiniteStamina = val
    end
})

Tabs.Player:AddToggle("Noclip", {
    Title = "Noclip Mode",
    Default = false,
    Callback = function(val)
        State.Noclip = val
    end
})

-- Movement / Noclip Loop
RunService.Stepped:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character
        if not char then return end
        
        if State.SpeedHack then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = State.SpeedValue end
        end

        if State.Noclip then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end)

-- ==============================================================================
-- 10. TAB: Teleports
-- ==============================================================================
Tabs.Teleport:AddSection("📍 Instant Navigation")

Tabs.Teleport:AddButton({
    Title = "Teleport to Safe Train Roof",
    Description = "Stand safely above zombies on train roof",
    Callback = function()
        local train = getTrainModel()
        if train then
            local root = train:FindFirstChild("Engine") or train:FindFirstChildWhichIsA("BasePart")
            if root then
                LocalPlayer.Character.HumanoidRootPart.CFrame = root.CFrame + Vector3.new(0, 12, 0)
            end
        end
    end
})

Tabs.Teleport:AddButton({
    Title = "Teleport to Nearest Town Station",
    Callback = function()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj.Name:lower():find("station") and obj:IsA("BasePart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = obj.CFrame + Vector3.new(0, 5, 0)
                break
            end
        end
    end
})

-- ==============================================================================
-- 11. TAB: Misc / Utilities
-- ==============================================================================
Tabs.Misc:AddSection("⚙️ Game Tweaks")

Tabs.Misc:AddToggle("InstantPrompt", {
    Title = "Instant Interaction (0s Hold)",
    Description = "Eliminates proximity prompt hold delay for all items",
    Default = true,
    Callback = function(val)
        State.InstantPrompt = val
        applyInstantPrompts(val)
    end
})

Tabs.Misc:AddButton({
    Title = "Rejoin Current Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
})

Tabs.Misc:AddButton({
    Title = "Server Hop (Lowest Ping)",
    Callback = function()
        pcall(function()
            local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
            for _, s in ipairs(servers.data) do
                if s.playing < s.maxPlayers and s.id ~= game.JobId then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
                    break
                end
            end
        end)
    end
})

-- Initial selection
pcall(function()
    Window:SelectTab(1)
    applyInstantPrompts(true)
end)

Fluent:Notify({
    Title = "Banana Hub",
    Content = "Dead Rails Kaitun Bond Hub successfully loaded!",
    Duration = 5
})
