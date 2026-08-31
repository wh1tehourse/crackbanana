-- [[ Banana Crack Hub | Protected Build ]]
local _S=function(b,k)local t={}for i=1,#b do t[i]=string.char((b[i]-k)%256)end return table.concat(t)end;
local Players = game:GetService(_S({117,145,134,158,138,151,152},37))
local Workspace = game:GetService(_S({124,148,151,144,152,149,134,136,138},37))
local RunService = game:GetService(_S({119,154,147,120,138,151,155,142,136,138},37))
local TweenService = game:GetService(_S({121,156,138,138,147,120,138,151,155,142,136,138},37))
local UserInputService = game:GetService(_S({122,152,138,151,110,147,149,154,153,120,138,151,155,142,136,138},37))
local VirtualUser = game:GetService(_S({123,142,151,153,154,134,145,122,152,138,151},37))
local HttpService = game:GetService(_S({109,153,153,149,120,138,151,155,142,136,138},37))
local TeleportService = game:GetService(_S({121,138,145,138,149,148,151,153,120,138,151,155,142,136,138},37))
local CoreGui = game:GetService(_S({104,148,151,138,108,154,142},37))
local LocalPlayer = Players.LocalPlayer
LocalPlayer.Idled:Connect(function()
VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
task.wait(1)
VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
end)
local State = {
Running = true,
BondsCollected = 0,
TotalResets = 0,
StartTime = os.time(),
CollectDelay = 0.05,
Status = _S({110,147,142,153,142,134,145,142,159,142,147,140,83,83,83},37)
}
local GUI_NAME = _S({103,134,147,134,147,134,112,134,142,153,154,147,132,109,122,105},37)
pcall(function()
if CoreGui:FindFirstChild(GUI_NAME) then
CoreGui[GUI_NAME]:Destroy()
end
if LocalPlayer.PlayerGui:FindFirstChild(GUI_NAME) then
LocalPlayer.PlayerGui[GUI_NAME]:Destroy()
end
end)
local ScreenGui = Instance.new(_S({120,136,151,138,138,147,108,154,142},37))
ScreenGui.Name = GUI_NAME
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if syn and syn.protect_gui then
syn.protect_gui(ScreenGui)
ScreenGui.Parent = CoreGui
elseif gethui then
ScreenGui.Parent = gethui()
elseif CoreGui then
pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild(_S({117,145,134,158,138,151,108,154,142},37)) end
else
ScreenGui.Parent = LocalPlayer:WaitForChild(_S({117,145,134,158,138,151,108,154,142},37))
end
local MainFrame = Instance.new(_S({107,151,134,146,138},37))
MainFrame.Name = _S({114,134,142,147,107,151,134,146,138},37)
MainFrame.Size = UDim2.new(0, 380, 0, 135)
MainFrame.Position = UDim2.new(0.5, -190, 0.12, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.ClipsDescendants = false
MainFrame.Parent = ScreenGui
local UICorner = Instance.new(_S({122,110,104,148,151,147,138,151},37))
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame
local UIStroke = Instance.new(_S({122,110,120,153,151,148,144,138},37))
UIStroke.Thickness = 2.5
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Parent = MainFrame
local UIGradient = Instance.new(_S({122,110,108,151,134,137,142,138,147,153},37))
UIGradient.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 120, 0)),
ColorSequenceKeypoint.new(1.0, Color3.fromRGB(0, 160, 255))
})
UIGradient.Rotation = 45
UIGradient.Parent = UIStroke
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = MainFrame.Position
input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
dragging = false
end
end)
end
end)
MainFrame.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)
UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then
local delta = input.Position - dragStart
MainFrame.Position = UDim2.new(
startPos.X.Scale,
startPos.X.Offset + delta.X,
startPos.Y.Scale,
startPos.Y.Offset + delta.Y
)
end
end)
local TitleLabel = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
TitleLabel.Name = _S({121,142,153,145,138,113,134,135,138,145},37)
TitleLabel.Size = UDim2.new(1, -30, 0, 28)
TitleLabel.Position = UDim2.new(0, 15, 0, 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = _S({103,134,147,134,147,134,69,109,154,135,69,161,69,102,154,153,148,69,103,148,147,137,69,107,134,151,146,69,105,83,119,134,142,145,152},37)
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.Parent = MainFrame
local StatsContainer = Instance.new(_S({107,151,134,146,138},37))
StatsContainer.Name = _S({120,153,134,153,152,104,148,147,153,134,142,147,138,151},37)
StatsContainer.Size = UDim2.new(1, -30, 0, 42)
StatsContainer.Position = UDim2.new(0, 15, 0, 44)
StatsContainer.BackgroundTransparency = 1
StatsContainer.Parent = MainFrame
local TimeBox = Instance.new(_S({107,151,134,146,138},37))
TimeBox.Name = _S({121,142,146,138,103,148,157},37)
TimeBox.Size = UDim2.new(0.48, 0, 1, 0)
TimeBox.Position = UDim2.new(0, 0, 0, 0)
TimeBox.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
TimeBox.BorderSizePixel = 0
TimeBox.Parent = StatsContainer
local TimeCorner = Instance.new(_S({122,110,104,148,151,147,138,151},37))
TimeCorner.CornerRadius = UDim.new(0, 9)
TimeCorner.Parent = TimeBox
local TimeStroke = Instance.new(_S({122,110,120,153,151,148,144,138},37))
TimeStroke.Thickness = 1
TimeStroke.Color = Color3.fromRGB(55, 55, 65)
TimeStroke.Parent = TimeBox
local TimeLabel = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
TimeLabel.Name = _S({121,142,146,138,113,134,135,138,145},37)
TimeLabel.Size = UDim2.new(1, 0, 1, 0)
TimeLabel.BackgroundTransparency = 1
TimeLabel.RichText = true
TimeLabel.Text = _S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,121,142,146,138,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,85,85,139,139,91,91,71,99,85,85,95,85,85,95,85,85,97,84,139,148,147,153,99},37)
TimeLabel.Font = Enum.Font.GothamBold
TimeLabel.TextSize = 13.5
TimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeLabel.Parent = TimeBox
local BondsBox = Instance.new(_S({107,151,134,146,138},37))
BondsBox.Name = _S({103,148,147,137,152,103,148,157},37)
BondsBox.Size = UDim2.new(0.48, 0, 1, 0)
BondsBox.Position = UDim2.new(0.52, 0, 0, 0)
BondsBox.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
BondsBox.BorderSizePixel = 0
BondsBox.Parent = StatsContainer
local BondsCorner = Instance.new(_S({122,110,104,148,151,147,138,151},37))
BondsCorner.CornerRadius = UDim.new(0, 9)
BondsCorner.Parent = BondsBox
local BondsStroke = Instance.new(_S({122,110,120,153,151,148,144,138},37))
BondsStroke.Thickness = 1
BondsStroke.Color = Color3.fromRGB(55, 55, 65)
BondsStroke.Parent = BondsBox
local BondsLabel = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
BondsLabel.Name = _S({103,148,147,137,152,113,134,135,138,145},37)
BondsLabel.Size = UDim2.new(1, 0, 1, 0)
BondsLabel.BackgroundTransparency = 1
BondsLabel.RichText = true
BondsLabel.Text = _S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,103,148,147,137,152,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,139,139,136,136,85,85,71,99,85,97,84,139,148,147,153,99},37)
BondsLabel.Font = Enum.Font.GothamBold
BondsLabel.TextSize = 13.5
BondsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BondsLabel.Parent = BondsBox
local StatusLabel = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
StatusLabel.Name = _S({120,153,134,153,154,152,113,134,135,138,145},37)
StatusLabel.Size = UDim2.new(1, -30, 0, 24)
StatusLabel.Position = UDim2.new(0, 15, 0, 95)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = _S({120,153,134,153,154,152,95,69,108,138,153,153,142,147,140,69,135,148,147,137,152,83,83,83},37)
StatusLabel.TextColor3 = Color3.fromRGB(255, 204, 0)
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.TextSize = 13
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.Parent = MainFrame
local function updateStatus(text)
State.Status = text
StatusLabel.Text = _S({120,153,134,153,154,152,95,69},37) .. text
end
task.spawn(function()
while ScreenGui.Parent do
local elapsed = os.time() - State.StartTime
local hours = math.floor(elapsed / 3600)
local mins = math.floor((elapsed % 3600) / 60)
local secs = elapsed % 60
TimeLabel.Text = string.format(_S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,121,142,146,138,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,85,85,139,139,91,91,71,99,74,85,87,137,95,74,85,87,137,95,74,85,87,137,97,84,139,148,147,153,99},37), hours, mins, secs)
BondsLabel.Text = string.format(_S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,103,148,147,137,152,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,139,139,136,136,85,85,71,99,74,137,97,84,139,148,147,153,99},37), State.BondsCollected)
task.wait(1)
end
end)
local function triggerPrompt(prompt)
if not prompt or not prompt:IsA(_S({117,151,148,157,142,146,142,153,158,117,151,148,146,149,153},37)) then return end
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
local function teleportTo(targetCFrame)
local char = LocalPlayer.Character
if not char then return end
local hrp = char:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37))
if not hrp then return end
hrp.CFrame = targetCFrame
end
local function resetCharacter()
local char = LocalPlayer.Character
if char then
local hum = char:FindFirstChildOfClass(_S({109,154,146,134,147,148,142,137},37))
if hum then
hum.Health = 0
else
char:BreakJoints()
end
end
end
local function scanBonds()
local targets = {}
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA(_S({117,151,148,157,142,146,142,153,158,117,151,148,146,149,153},37)) and obj.Enabled then
local parent = obj.Parent
local pName = parent and parent.Name:lower() or ""
local pText = (obj.ActionText .. _S({69},37) .. obj.ObjectText):lower()
local isBond = (
pName:find(_S({135,148,147,137},37)) or
pName:find(_S({136,134,152,141},37)) or
pName:find(_S({146,148,147,138,158},37)) or
pName:find(_S({137,148,145,145,134,151},37)) or
pText:find(_S({135,148,147,137},37)) or
pText:find(_S({153,134,144,138,69,146,148,147,138,158},37)) or
pText:find(_S({136,134,152,141},37)) or
pText:find(_S({153,134,144,138,69,135,148,147,137},37))
)
if isBond then
local part = parent:IsA(_S({103,134,152,138,117,134,151,153},37)) and parent or parent:FindFirstChildWhichIsA(_S({103,134,152,138,117,134,151,153},37))
if part then
table.insert(targets, { Prompt = obj, Part = part })
end
end
end
end
return targets
end
local function hopServer()
updateStatus(_S({109,148,149,149,142,147,140,69,153,148,69,134,69,147,138,156,69,152,138,151,155,138,151,83,83,83},37))
pcall(function()
local url = _S({141,153,153,149,152,95,84,84,140,134,146,138,152,83,151,148,135,145,148,157,83,136,148,146,84,155,86,84,140,134,146,138,152,84},37) .. game.PlaceId .. _S({84,152,138,151,155,138,151,152,84,117,154,135,145,142,136,100,152,148,151,153,116,151,137,138,151,98,102,152,136,75,145,142,146,142,153,98,86,85,85},37)
local servers = HttpService:JSONDecode(game:HttpGet(url))
for _, s in ipairs(servers.data) do
if s.playing < s.maxPlayers and s.id ~= game.JobId then
TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
break
end
end
end)
end
task.spawn(function()
updateStatus(_S({108,138,153,153,142,147,140,69,135,148,147,137,152,83,83,83},37))
while State.Running do
task.wait(0.05)
local char = LocalPlayer.Character
local hrp = char and char:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37))
local hum = char and char:FindFirstChildOfClass(_S({109,154,146,134,147,148,142,137},37))
if char and hrp and hum and hum.Health > 0 then
local targets = scanBonds()
if #targets > 0 then
updateStatus(_S({108,138,153,153,142,147,140,69,135,148,147,137,152,69,77},37) .. #targets .. _S({69,139,148,154,147,137,78,83,83,83},37))
for idx, target in ipairs(targets) do
if not State.Running then break end
if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37)) then break end
local targetPart = target.Part
if targetPart and targetPart:IsDescendantOf(Workspace) and target.Prompt and target.Prompt.Enabled then
updateStatus(string.format(_S({104,148,145,145,138,136,153,142,147,140,69,135,148,147,137,69,128,74,137,84,74,137,130,83,83,83},37), idx, #targets))
teleportTo(targetPart.CFrame + Vector3.new(0, 1.5, 0))
triggerPrompt(target.Prompt)
State.BondsCollected = State.BondsCollected + 1
BondsLabel.Text = string.format(_S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,103,148,147,137,152,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,139,139,136,136,85,85,71,99,74,137,97,84,139,148,147,153,99},37), State.BondsCollected)
task.wait(State.CollectDelay)
end
end
else
updateStatus(_S({114,134,149,69,136,145,138,134,151,138,137,70,69,104,141,138,136,144,142,147,140,83,83,83},37))
task.wait(0.5)
local recheck = scanBonds()
if #recheck == 0 and State.Running then
State.TotalResets = State.TotalResets + 1
updateStatus(_S({119,138,152,138,153,153,142,147,140,69,136,141,134,151,134,136,153,138,151,83,83,83},37))
resetCharacter()
LocalPlayer.CharacterAdded:Wait()
task.wait(1.5)
local checkAgain = scanBonds()
if #checkAgain == 0 then
hopServer()
task.wait(5)
end
end
end
end
end
end)
