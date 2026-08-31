--[[
    🍌 Banana Hub - Dead Rails [ Instant Kaitun Bond & Fast Farm ]
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
local TeleportService = game:GetService("TeleportService")
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
    SubTitle = "Kaitun Bond [ Instant Farm ]",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    Home = Window:AddTab({ Title = "Information", Icon = "home" }),
    Kaitun = Window:AddTab({ Title = "Kaitun Bond", Icon = "coins" }),
    Combat = Window:AddTab({ Title = "Combat / Aura", Icon = "sword" }),
    Visuals = Window:AddTab({ Title = "ESP & Visuals", Icon = "eye" }),
    Player = Window:AddTab({ Title = "Player / Move", Icon = "user" }),
    Misc = Window:AddTab({ Title = "Misc / Server", Icon = "settings" })
}

-- ==============================================================================
-- 3. Core State & Utilities
-- ==============================================================================
local State = {
    AutoKaitun = false,
    AutoResetOnEmpty = true,
    AutoHopOnEmpty = false,
    IncludeScrap = false,
    IncludeChests = false,
    CollectDelay = 0.05,
    TeleportMethod = "Instant TP", -- "Instant TP" or "Smooth Tween"
    TweenSpeed = 60,
    KillAura = false,
    KillAuraRadius = 30,
    SpeedHack = false,
    SpeedValue = 24,
    InfiniteStamina = true,
    Noclip = false,
    Fullbright = false,
    BondESP = false,
    BondsCollected = 0,
    TotalResets = 0,
    CurrentBondsOnMap = 0
}

-- Trigger Proximity Prompt Instantly
local function triggerPrompt(prompt)
    if not prompt or not prompt:IsA("ProximityPrompt") then return end
    pcall(function()
        if fireproximityprompt then
            fireproximityprompt(prompt, 1, true)
        else
            prompt.HoldDuration = 0
            prompt:InputHoldBegin()
            task.wait(0.01)
            prompt:InputHoldEnd()
        end
    end)
end

-- Move / TP Helper
local currentTween = nil
local function moveTo(targetCFrame)
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if State.TeleportMethod == "Instant TP" then
        hrp.CFrame = targetCFrame
    else
        local dist = (targetCFrame.Position - hrp.Position).Magnitude
        local time = math.max(dist / State.TweenSpeed, 0.05)
        if currentTween then currentTween:Cancel() end
        currentTween = TweenService:Create(hrp, TweenInfo.new(time, Enum.EasingStyle.Linear), { CFrame = targetCFrame })
        currentTween:Play()
        currentTween.Completed:Wait()
    end
end

-- Scan Workspace for Bond / Cash / Scrap targets
local function scanCollectables()
    local targets = {}
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("ProximityPrompt") and obj.Enabled then
            local parent = obj.Parent
            local pName = parent and parent.Name:lower() or ""
            local pText = (obj.ActionText .. " " .. obj.ObjectText):lower()

            local isBond = (pName:find("bond") or pName:find("cash") or pName:find("money") or pName:find("dollar") or pText:find("bond") or pText:find("take money") or pText:find("cash"))
            local isScrap = State.IncludeScrap and (pName:find("scrap") or pName:find("metal") or pName:find("iron") or pText:find("scrap"))
            local isChest = State.IncludeChests and (pName:find("chest") or pName:find("crate") or pName:find("box") or pText:find("open") or pText:find("search"))

            if isBond or isScrap or isChest then
                local part = parent:IsA("BasePart") and parent or parent:FindFirstChildWhichIsA("BasePart")
                if part then
                    table.insert(targets, { Prompt = obj, Part = part, IsBond = isBond })
                end
            end
        end
    end
    return targets
end

-- Server Hop Function
local function hopServer()
    pcall(function()
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        local servers = HttpService:JSONDecode(game:HttpGet(url))
        for _, s in ipairs(servers.data) do
            if s.playing < s.maxPlayers and s.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
                break
            end
        end
    end)
end

-- Reset / Kill Character
local function resetCharacter()
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.Health = 0
        else
            char:BreakJoints()
        end
    end
end

-- ==============================================================================
-- 4. TAB: Information
-- ==============================================================================
Tabs.Home:AddParagraph({
    Title = "🍌 Banana Hub - Dead Rails Kaitun",
    Content = "Fast Kaitun Bond collector with automatic character reset & server loop.\nAuthor: wh1tehourse"
})

local StatusPara = Tabs.Home:AddParagraph({
    Title = "📊 Live Statistics",
    Content = "Bonds Collected: 0\nTotal Resets / Runs: 0\nBonds On Map: 0"
})

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local targets = scanCollectables()
            State.CurrentBondsOnMap = #targets
            StatusPara:SetDesc(
                "Bonds Farmed: " .. State.BondsCollected ..
                "\nTotal Resets / Runs: " .. State.TotalResets ..
                "\nCollectables On Map: " .. State.CurrentBondsOnMap ..
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
        Fluent:Notify({ Title = "Banana Hub", Content = "Telegram link copied!", Duration = 3 })
    end
})

-- ==============================================================================
-- 5. TAB: Kaitun Bond (Instant Farm & Auto Die/Reset)
-- ==============================================================================
Tabs.Kaitun:AddSection("⚡ Instant Kaitun Bond Farm")

local KaitunToggle = Tabs.Kaitun:AddToggle("AutoKaitun", {
    Title = "Auto Farm Bonds (Kaitun Mode)",
    Description = "Instantly teleports to all bonds on map, collects them, and resets character when done",
    Default = false
})

KaitunToggle:OnChanged(function(val)
    State.AutoKaitun = val
    if val then
        Fluent:Notify({
            Title = "Kaitun Bond",
            Content = "Auto Bond Farm started! Will auto-reset when all bonds are collected.",
            Duration = 4
        })
    end
end)

Tabs.Kaitun:AddToggle("AutoReset", {
    Title = "Auto Die / Reset Character When Done",
    Description = "Automatically respawns character to restart run when 0 bonds left",
    Default = true,
    Callback = function(val)
        State.AutoResetOnEmpty = val
    end
})

Tabs.Kaitun:AddToggle("AutoHop", {
    Title = "Auto Server Hop When Map Empty",
    Description = "Hops to a new server if no bonds are available after respawn",
    Default = false,
    Callback = function(val)
        State.AutoHopOnEmpty = val
    end
})

Tabs.Kaitun:AddDropdown("TPMethodDropdown", {
    Title = "Movement Method",
    Values = { "Instant TP", "Smooth Tween" },
    Default = "Instant TP",
    Callback = function(val)
        State.TeleportMethod = val
    end
})

Tabs.Kaitun:AddSlider("CollectDelaySlider", {
    Title = "Collect Delay (Seconds)",
    Description = "Delay between collecting each bond",
    Default = 0.05,
    Min = 0.01,
    Max = 0.5,
    Rounding = 2,
    Callback = function(val)
        State.CollectDelay = val
    end
})

Tabs.Kaitun:AddSection("📦 Extra Collectables")

Tabs.Kaitun:AddToggle("IncScrap", {
    Title = "Also Collect Scrap / Metal",
    Default = false,
    Callback = function(val)
        State.IncludeScrap = val
    end
})

Tabs.Kaitun:AddToggle("IncChests", {
    Title = "Also Loot Crates / Chests",
    Default = false,
    Callback = function(val)
        State.IncludeChests = val
    end
})

-- ==============================================================================
-- MAIN KAITUN BOND FARM LOOP
-- ==============================================================================
task.spawn(function()
    while true do
        task.wait(0.1)
        if State.AutoKaitun then
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")

            if char and hrp and hum and hum.Health > 0 then
                local targets = scanCollectables()

                if #targets > 0 then
                    for _, target in ipairs(targets) do
                        if not State.AutoKaitun then break end
                        if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then break end
                        
                        local targetPart = target.Part
                        if targetPart and targetPart:IsDescendantOf(Workspace) and target.Prompt and target.Prompt.Enabled then
                            -- Teleport to item
                            moveTo(targetPart.CFrame + Vector3.new(0, 1.5, 0))
                            
                            -- Instant interaction
                            triggerPrompt(target.Prompt)
                            
                            if target.IsBond then
                                State.BondsCollected = State.BondsCollected + 1
                            end

                            task.wait(State.CollectDelay)
                        end
                    end
                else
                    -- No more bonds/loot on map!
                    task.wait(0.5)
                    -- Re-verify if still 0
                    local recheck = scanCollectables()
                    if #recheck == 0 and State.AutoKaitun then
                        if State.AutoHopOnEmpty then
                            Fluent:Notify({ Title = "Kaitun", Content = "No bonds found! Hopping server...", Duration = 3 })
                            hopServer()
                            task.wait(5)
                        elseif State.AutoResetOnEmpty then
                            State.TotalResets = State.TotalResets + 1
                            Fluent:Notify({ Title = "Kaitun", Content = "All bonds collected! Resetting character...", Duration = 2 })
                            resetCharacter()
                            
                            -- Wait for respawn
                            LocalPlayer.CharacterAdded:Wait()
                            task.wait(1.5) -- wait for map assets to load
                        end
                    end
                end
            end
        end
    end
end)

-- ==============================================================================
-- 6. TAB: Combat / Kill Aura
-- ==============================================================================
Tabs.Combat:AddSection("⚔️ Combat Engine")

Tabs.Combat:AddToggle("KillAura", {
    Title = "Kill Aura (Zombies & Bandits)",
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
                            if tool and tool:FindFirstChild("RemoteEvent") then
                                tool.RemoteEvent:FireServer(root.Position)
                            elseif tool and tool:FindFirstChild("Attack") then
                                tool.Attack:FireServer(model)
                            elseif tool then
                                tool:Activate()
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ==============================================================================
-- 7. TAB: Visuals & ESP
-- ==============================================================================
Tabs.Visuals:AddSection("👁️ World Visuals")

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

task.spawn(function()
    while task.wait(1.5) do
        if State.BondESP then
            pcall(function()
                local targets = scanCollectables()
                for _, t in ipairs(targets) do
                    createESP(t.Part, "💰 Bond / Cash", Color3.fromRGB(255, 215, 0))
                end
            end)
        end
    end
end)

Tabs.Visuals:AddToggle("Fullbright", {
    Title = "Fullbright (Night Vision)",
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
-- 8. TAB: Movement & Player
-- ==============================================================================
Tabs.Player:AddSection("🏃 Movement Enhancements")

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
-- 9. TAB: Misc & Server
-- ==============================================================================
Tabs.Misc:AddSection("⚙️ Server & Utilities")

Tabs.Misc:AddButton({
    Title = "Instant Reset / Die Now",
    Description = "Instantly resets character",
    Callback = function()
        resetCharacter()
    end
})

Tabs.Misc:AddButton({
    Title = "Server Hop (Lowest Ping)",
    Callback = function()
        hopServer()
    end
})

Tabs.Misc:AddButton({
    Title = "Rejoin Server",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

-- Select Tab 1
pcall(function()
    Window:SelectTab(1)
end)

Fluent:Notify({
    Title = "Banana Hub",
    Content = "Dead Rails Instant Kaitun loaded!",
    Duration = 4
})
