-- Floating Banana Toggle Button
end
local v231 = Instance.new("ScreenGui")
local vu232 = Instance.new("ImageButton")
local v233 = Instance.new("UICorner")
local vu234 = Instance.new("ParticleEmitter")
local vu235 = game:GetService("TweenService")

v231.Name = "BananaToggleButtonGui"
if (syn and syn.protect_gui) then
    syn.protect_gui(v231)
    v231.Parent = game.CoreGui
elseif gethui then
    v231.Parent = gethui()
elseif game:GetService("CoreGui"):FindFirstChild("RobloxGui") then
    v231.Parent = game:GetService("CoreGui")
else
    v231.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

v231.ResetOnSpawn = false
v231.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

vu232.Parent = v231
vu232.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
vu232.BackgroundTransparency = 0.4
vu232.BorderSizePixel = 0
vu232.Position = UDim2.new(0.020833337, 0, 0.10528908, 0)
vu232.Size = UDim2.new(0, 50, 0, 50)
vu232.Image = "http://www.roblox.com/asset/?id=130947856929902"

v233.Parent = vu232
v233.CornerRadius = UDim.new(1, 0)

vu234.Parent = vu232
vu234.LightEmission = 1
vu234.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.1),
    NumberSequenceKeypoint.new(1, 0)
})
vu234.Lifetime = NumberRange.new(0.5, 1)
vu234.Rate = 0
vu234.Speed = NumberRange.new(5, 10)
vu234.Color = ColorSequence.new(Color3.fromRGB(255, 85, 255), Color3.fromRGB(85, 255, 255))

local lastToggle = 0
local function toggleMenu()
    local now = tick()
    if now - lastToggle < 0.2 then return end
    lastToggle = now

    vu234.Rate = 100
    task.delay(0.4, function()
        vu234.Rate = 0
    end)
    
    vu235:Create(vu232, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        ["Rotation"] = vu232.Rotation + 360
    }):Play()

    if v2 then
        if v2.Root then
            v2.Root.Visible = not v2.Root.Visible
            if v2.Minimized ~= nil then
                v2.Minimized = not v2.Root.Visible
            end
        elseif v2.Minimize then
            v2:Minimize()
        end
    end
    if vu1 and vu1.GUI then
        vu1.GUI.Enabled = true
    end

    pcall(function()
        local vim = game:GetService("VirtualInputManager")
        vim:SendKeyEvent(true, Enum.KeyCode.End, false, game)
        task.task.wait(0.01)
        vim:SendKeyEvent(false, Enum.KeyCode.End, false, game)
    end)

    local isVisible = true
    if v2 and v2.Root then
        isVisible = v2.Root.Visible
    elseif v2 and v2.Minimized ~= nil then
        isVisible = not v2.Minimized
    end

    if isVisible then
        vu232.BackgroundTransparency = 0.2
        vu235:Create(vu232, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            ["Size"] = UDim2.new(0, 55, 0, 55)
        }):Play()
    else
        vu232.BackgroundTransparency = 0.5
        vu235:Create(vu232, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            ["Size"] = UDim2.new(0, 50, 0, 50)
        }):Play()
    end
end

vu232.MouseButton1Click:Connect(toggleMenu)
vu232.Activated:Connect(toggleMenu)

local isDragging = false
local dragStartPos = nil
local startPos = nil

vu232.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = false
        dragStartPos = input.Position
        startPos = vu232.Position
    end
end)

vu232.InputChanged:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragStartPos then
        local delta = input.Position - dragStartPos
        if delta.Magnitude > 6 then
            isDragging = true
            vu232.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end
end)

vu232.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
