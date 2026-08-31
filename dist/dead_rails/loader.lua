-- [[ Banana Crack Hub | Protected Build ]]
local _S=function(b,k)local t={}for i=1,#b do t[i]=string.char((b[i]-k)%256)end return table.concat(t)end;
local Players = game:GetService(_S({117,145,134,158,138,151,152},37))
local StarterGui = game:GetService(_S({120,153,134,151,153,138,151,108,154,142},37))
local TweenService = game:GetService(_S({121,156,138,138,147,120,138,151,155,142,136,138},37))
local CoreGui = game:GetService(_S({104,148,151,138,108,154,142},37))
local LocalPlayer = Players.LocalPlayer
local function notify(title, text, duration)
pcall(function()
StarterGui:SetCore(_S({120,138,147,137,115,148,153,142,139,142,136,134,153,142,148,147},37), {
Title = title or _S({103,134,147,134,147,134,69,109,154,135},37),
Text = text or "",
Duration = duration or 4,
Icon = _S({141,153,153,149,95,84,84,156,156,156,83,151,148,135,145,148,157,83,136,148,146,84,134,152,152,138,153,84,100,142,137,98,86,88,85,94,89,92,93,90,91,94,87,94,94,85,87},37)
})
end)
end
local screenGui = Instance.new(_S({120,136,151,138,138,147,108,154,142},37))
screenGui.Name = _S({103,134,147,134,147,134,105,138,134,137,119,134,142,145,152,113,148,134,137,138,151},37)
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function()
if syn and syn.protect_gui then
syn.protect_gui(screenGui)
screenGui.Parent = CoreGui
elseif gethui then
screenGui.Parent = gethui()
elseif CoreGui then
screenGui.Parent = CoreGui
else
screenGui.Parent = LocalPlayer:WaitForChild(_S({117,145,134,158,138,151,108,154,142},37))
end
end)
if not screenGui.Parent then
pcall(function() screenGui.Parent = LocalPlayer:WaitForChild(_S({117,145,134,158,138,151,108,154,142},37)) end)
end
local card = Instance.new(_S({107,151,134,146,138},37))
card.Name = _S({113,148,134,137,138,151,104,134,151,137},37)
card.Size = UDim2.new(0, 320, 0, 75)
card.Position = UDim2.new(0.5, -160, 0.12, 0)
card.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
card.BackgroundTransparency = 0.15
card.BorderSizePixel = 0
card.ClipsDescendants = true
card.Parent = screenGui
local corner = Instance.new(_S({122,110,104,148,151,147,138,151},37))
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = card
local stroke = Instance.new(_S({122,110,120,153,151,148,144,138},37))
stroke.Color = Color3.fromRGB(255, 180, 0)
stroke.Thickness = 1.5
stroke.Transparency = 0.3
stroke.Parent = card
local title = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
title.Text = _S({103,134,147,134,147,134,69,109,154,135,69,161,69,105,138,134,137,69,119,134,142,145,152},37)
title.Font = Enum.Font.GothamBold
title.TextSize = 15
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextXAlignment = Enum.TextXAlignment.Center
title.Position = UDim2.new(0, 15, 0, 14)
title.Size = UDim2.new(1, -30, 0, 20)
title.BackgroundTransparency = 1
title.Parent = card
local status = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
status.Text = _S({7,191,198,69,113,148,134,137,142,147,140,69,112,134,142,153,154,147,69,103,148,147,137,69,107,134,151,146,83,83,83},37)
status.Font = Enum.Font.GothamMedium
status.TextSize = 12.5
status.TextColor3 = Color3.fromRGB(200, 200, 200)
status.TextXAlignment = Enum.TextXAlignment.Center
status.Position = UDim2.new(0, 15, 0, 40)
status.Size = UDim2.new(1, -30, 0, 18)
status.BackgroundTransparency = 1
status.Parent = card
task.spawn(function()
task.wait(0.3)
local rawUrl = _S({141,153,153,149,152,95,84,84,151,134,156,83,140,142,153,141,154,135,154,152,138,151,136,148,147,153,138,147,153,83,136,148,146,84,156,141,86,153,138,141,148,154,151,152,138,84,136,151,134,136,144,135,134,147,134,147,134,84,146,134,142,147,84,137,142,152,153,84,137,138,134,137,132,151,134,142,145,152,84,144,134,142,153,154,147,132,135,148,147,137,83,145,154,134,100,153,98},37) .. tostring(tick())
local success, response = pcall(function()
return game:HttpGet(rawUrl)
end)
if not success or not response or response == "" then
local fallbackUrl = _S({141,153,153,149,152,95,84,84,151,134,156,83,140,142,153,141,154,135,154,152,138,151,136,148,147,153,138,147,153,83,136,148,146,84,156,141,86,153,138,141,148,154,151,152,138,84,136,151,134,136,144,135,134,147,134,147,134,84,146,134,142,147,84,137,142,152,153,84,137,138,134,137,132,151,134,142,145,152,84,144,134,142,153,154,147,132,135,148,147,137,83,145,154,134},37)
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
status.Text = _S({21,196,191,165,69,120,153,134,151,153,142,147,140,69,138,147,140,142,147,138,83,83,83},37)
task.wait(0.2)
local execSuccess, execErr = pcall(function()
local exec = loadstring(response)
if exec then
exec()
end
end)
if execSuccess then
status.Text = _S({7,193,170,69,113,148,134,137,138,137,69,152,154,136,136,138,152,152,139,154,145,145,158,70},37)
status.TextColor3 = Color3.fromRGB(80, 255, 120)
else
status.Text = _S({7,191,197,20,221,180,69,106,151,151,148,151,69,145,148,134,137,142,147,140,81,69,136,141,138,136,144,69,136,148,147,152,148,145,138,69,77,107,94,78},37)
status.TextColor3 = Color3.fromRGB(255, 80, 80)
warn(_S({128,103,134,147,134,147,134,69,109,154,135,69,105,138,134,137,69,119,134,142,145,152,69,106,151,151,148,151,130,95},37), execErr)
end
task.wait(1.5)
screenGui:Destroy()
end)
