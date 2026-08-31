-- [[ Banana Crack Hub | Protected Build ]]
local _S=function(b,k)local t={}for i=1,#b do t[i]=string.char((b[i]-k)%256)end return table.concat(t)end;
local Players = game:GetService(_S({117,145,134,158,138,151,152},37))
local StarterGui = game:GetService(_S({120,153,134,151,153,138,151,108,154,142},37))
local TweenService = game:GetService(_S({121,156,138,138,147,120,138,151,155,142,136,138},37))
local LocalPlayer = Players.LocalPlayer
local function notify(title, text, duration)
pcall(function()
StarterGui:SetCore(_S({120,138,147,137,115,148,153,142,139,142,136,134,153,142,148,147},37), {
Title = title or _S({103,134,147,134,147,134,69,104,151,134,136,144,69,109,154,135},37),
Text = text or "",
Duration = duration or 4,
Icon = _S({141,153,153,149,95,84,84,156,156,156,83,151,148,135,145,148,157,83,136,148,146,84,134,152,152,138,153,84,100,142,137,98,86,88,85,94,89,92,93,90,91,94,87,94,94,85,87},37)
})
end)
end
local supportedPlaces = {
[2753915549] = _S({103,145,148,157,69,107,151,154,142,153,152,69,77,120,138,134,69,86,78},37),
[4442272183] = _S({103,145,148,157,69,107,151,154,142,153,152,69,77,120,138,134,69,87,78},37),
[7449423635] = _S({103,145,148,157,69,107,151,154,142,153,152,69,77,120,138,134,69,88,78},37)
}
local currentPlaceId = game.PlaceId
local placeName = supportedPlaces[currentPlaceId]
if not placeName then
notify(_S({103,134,147,134,147,134,69,104,151,134,136,144,69,109,154,135},37), _S({7,191,197,20,221,180,69,108,134,146,138,69,147,148,153,69,152,154,149,149,148,151,153,138,137,70,69,103,145,148,157,69,107,151,154,142,153,152,69,148,147,145,158,83},37), 6)
return
end
local screenGui = Instance.new(_S({120,136,151,138,138,147,108,154,142},37))
screenGui.Name = _S({103,134,147,134,147,134,113,148,134,137,138,151,108,154,142},37)
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if (syn and syn.protect_gui) then
syn.protect_gui(screenGui)
screenGui.Parent = game.CoreGui
elseif gethui then
screenGui.Parent = gethui()
elseif game:GetService(_S({104,148,151,138,108,154,142},37)):FindFirstChild(_S({119,148,135,145,148,157,108,154,142},37)) then
screenGui.Parent = game:GetService(_S({104,148,151,138,108,154,142},37))
else
screenGui.Parent = LocalPlayer:WaitForChild(_S({117,145,134,158,138,151,108,154,142},37))
end
local card = Instance.new(_S({107,151,134,146,138},37))
card.Name = _S({113,148,134,137,138,151,104,134,151,137},37)
card.Size = UDim2.new(0, 320, 0, 75)
card.Position = UDim2.new(0.5, -160, 0.15, 0)
card.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
card.BackgroundTransparency = 0.15
card.BorderSizePixel = 0
card.ClipsDescendants = true
card.Parent = screenGui
local corner = Instance.new(_S({122,110,104,148,151,147,138,151},37))
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = card
local stroke = Instance.new(_S({122,110,120,153,151,148,144,138},37))
stroke.Color = Color3.fromRGB(255, 204, 0)
stroke.Thickness = 1.5
stroke.Transparency = 0.3
stroke.Parent = card
local icon = Instance.new(_S({110,146,134,140,138,113,134,135,138,145},37))
icon.Size = UDim2.new(0, 42, 0, 42)
icon.Position = UDim2.new(0, 16, 0.5, -21)
icon.BackgroundTransparency = 1
icon.Image = _S({141,153,153,149,95,84,84,156,156,156,83,151,148,135,145,148,157,83,136,148,146,84,134,152,152,138,153,84,100,142,137,98,86,88,85,94,89,92,93,90,91,94,87,94,94,85,87},37)
icon.Parent = card
local title = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
title.Text = _S({103,134,147,134,147,134,69,104,151,134,136,144,69,109,154,135},37)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Position = UDim2.new(0, 68, 0, 16)
title.Size = UDim2.new(1, -78, 0, 20)
title.BackgroundTransparency = 1
title.Parent = card
local status = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
status.Text = _S({113,148,134,137,142,147,140,69},37) .. placeName .. _S({83,83,83},37)
status.Font = Enum.Font.GothamMedium
status.TextSize = 12
status.TextColor3 = Color3.fromRGB(200, 200, 200)
status.TextXAlignment = Enum.TextXAlignment.Left
status.Position = UDim2.new(0, 68, 0, 38)
status.Size = UDim2.new(1, -78, 0, 18)
status.BackgroundTransparency = 1
status.Parent = card
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
task.spawn(function()
task.wait(0.5)
local rawUrl = _S({141,153,153,149,152,95,84,84,151,134,156,83,140,142,153,141,154,135,154,152,138,151,136,148,147,153,138,147,153,83,136,148,146,84,156,141,86,153,138,141,148,154,151,152,138,84,136,151,134,136,144,135,134,147,134,147,134,84,146,134,142,147,84,137,142,152,153,84,135,134,147,134,147,134,83,145,154,134,100,153,98},37) .. tostring(tick())
local success, response = pcall(function()
return game:HttpGet(rawUrl)
end)
if not success or not response or response == "" then
local fallbackUrl = _S({141,153,153,149,152,95,84,84,151,134,156,83,140,142,153,141,154,135,154,152,138,151,136,148,147,153,138,147,153,83,136,148,146,84,156,141,86,153,138,141,148,154,151,152,138,84,136,151,134,136,144,135,134,147,134,147,134,84,146,134,142,147,84,137,142,152,153,84,135,134,147,134,147,134,83,145,154,134},37)
pcall(function()
response = game:HttpGet(fallbackUrl)
end)
end
if not response or response == "" then
status.Text = _S({7,191,197,20,221,180,69,107,134,142,145,138,137,69,153,148,69,137,148,156,147,145,148,134,137,69,152,136,151,142,149,153,70},37)
status.TextColor3 = Color3.fromRGB(255, 80, 80)
task.wait(2)
screenGui:Destroy()
return
end
status.Text = _S({7,191,198,69,106,157,138,136,154,153,142,147,140,69,109,154,135,83,83,83},37)
task.wait(0.3)
local execSuccess, execErr = pcall(function()
local exec = loadstring(response)
if exec then
exec()
end
end)
if execSuccess then
status.Text = _S({7,193,170,69,120,154,136,136,138,152,152,139,154,145,145,158,69,113,148,134,137,138,137,70},37)
status.TextColor3 = Color3.fromRGB(80, 255, 120)
else
status.Text = _S({7,191,197,20,221,180,69,113,148,134,137,69,138,151,151,148,151,81,69,136,141,138,136,144,69,136,148,147,152,148,145,138},37)
status.TextColor3 = Color3.fromRGB(255, 80, 80)
warn(_S({128,103,134,147,134,147,134,69,104,151,134,136,144,69,109,154,135,69,106,151,151,148,151,130,95},37), execErr)
end
task.wait(1.2)
TweenService:Create(card, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Position = UDim2.new(0.5, -160, 0.08, 0),
BackgroundTransparency = 1
}):Play()
task.wait(0.35)
screenGui:Destroy()
end)
