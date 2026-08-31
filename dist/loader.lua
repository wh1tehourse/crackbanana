--[[
    Banana Crack Hub - Blox Fruits [ Freemium ]
    By: wh1tehourse
    Ultra-Lightweight Loader
]]

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title or "Banana Crack Hub",
            Text = text or "",
            Duration = duration or 4,
            Icon = "http://www.roblox.com/asset/?id=130947856929902"
        })
    end)
end

-- 1. Supported Games / Places Check
local supportedPlaces = {
    [2753915549] = "Blox Fruits (Sea 1)",
    [4442272183] = "Blox Fruits (Sea 2)",
    [7449423635] = "Blox Fruits (Sea 3)"
}

local currentPlaceId = game.PlaceId
local placeName = supportedPlaces[currentPlaceId]

if not placeName then
    notify("Banana Crack Hub", "⚠️ Game not supported! Blox Fruits only.", 6)
    return
end

-- 2. Lightweight GUI Loader Indicator
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BananaLoaderGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if (syn and syn.protect_gui) then
    syn.protect_gui(screenGui)
    screenGui.Parent = game.CoreGui
elseif gethui then
    screenGui.Parent = gethui()
elseif game:GetService("CoreGui"):FindFirstChild("RobloxGui") then
    screenGui.Parent = game:GetService("CoreGui")
else
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local card = Instance.new("Frame")
card.Name = "LoaderCard"
card.Size = UDim2.new(0, 320, 0, 75)
card.Position = UDim2.new(0.5, -160, 0.15, 0)
card.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
card.BackgroundTransparency = 0.15
card.BorderSizePixel = 0
card.ClipsDescendants = true
card.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = card

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 204, 0)
stroke.Thickness = 1.5
stroke.Transparency = 0.3
stroke.Parent = card

local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 42, 0, 42)
icon.Position = UDim2.new(0, 16, 0.5, -21)
icon.BackgroundTransparency = 1
icon.Image = "http://www.roblox.com/asset/?id=130947856929902"
icon.Parent = card

local title = Instance.new("TextLabel")
title.Text = "Banana Crack Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Position = UDim2.new(0, 68, 0, 16)
title.Size = UDim2.new(1, -78, 0, 20)
title.BackgroundTransparency = 1
title.Parent = card

local status = Instance.new("TextLabel")
status.Text = "Loading " .. placeName .. "..."
status.Font = Enum.Font.GothamMedium
status.TextSize = 12
status.TextColor3 = Color3.fromRGB(200, 200, 200)
status.TextXAlignment = Enum.TextXAlignment.Left
status.Position = UDim2.new(0, 68, 0, 38)
status.Size = UDim2.new(1, -78, 0, 18)
status.BackgroundTransparency = 1
status.Parent = card

-- Animate Card In
card.Position = UDim2.new(0.5, -160, 0.08, 0)
card.BackgroundTransparency = 1
stroke.Transparency = 1
TweenService:Create(card, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -160, 0.15, 0),
    BackgroundTransparency = 0.15
}):Play()
TweenService:Create(stroke, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Transparency = 0.3
}):Play()

-- 3. Asynchronously Load Main Script
task.spawn(function()
    task.wait(0.5)
    local rawUrl = "https://raw.githubusercontent.com/wh1tehourse/crackbanana/main/dist/banana.lua?t=" .. tostring(tick())
    local success, response = pcall(function()
        return game:HttpGet(rawUrl)
    end)

    if not success or not response or response == "" then
        -- Fallback URL
        local fallbackUrl = "https://raw.githubusercontent.com/wh1tehourse/crackbanana/main/dist/banana.lua"
        pcall(function()
            response = game:HttpGet(fallbackUrl)
        end)
    end

    if not response or response == "" then
        status.Text = "⚠️ Failed to download script!"
        status.TextColor3 = Color3.fromRGB(255, 80, 80)
        task.wait(2)
        screenGui:Destroy()
        return
    end

    status.Text = "⚡ Executing Hub..."
    task.wait(0.3)

    local execSuccess, execErr = pcall(function()
        local exec = loadstring(response)
        if exec then
            exec()
        end
    end)

    if execSuccess then
        status.Text = "✅ Successfully Loaded!"
        status.TextColor3 = Color3.fromRGB(80, 255, 120)
    else
        status.Text = "⚠️ Load error, check console"
        status.TextColor3 = Color3.fromRGB(255, 80, 80)
        warn("[Banana Crack Hub Error]:", execErr)
    end

    task.wait(1.2)
    TweenService:Create(card, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -160, 0.08, 0),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.35)
    screenGui:Destroy()
end)
