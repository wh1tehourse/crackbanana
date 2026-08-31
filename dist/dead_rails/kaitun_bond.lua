-- [[ Banana Crack Hub | Protected Build ]]
local _S=function(b,k)local t={}for i=1,#b do t[i]=string.char((b[i]-k)%256)end return table.concat(t)end;
Players = game:GetService(_S({117,145,134,158,138,151,152},37))
Workspace = game:GetService(_S({124,148,151,144,152,149,134,136,138},37))
ReplicatedStorage = game:GetService(_S({119,138,149,145,142,136,134,153,138,137,120,153,148,151,134,140,138},37))
RunService = game:GetService(_S({119,154,147,120,138,151,155,142,136,138},37))
TweenService = game:GetService(_S({121,156,138,138,147,120,138,151,155,142,136,138},37))
UserInputService = game:GetService(_S({122,152,138,151,110,147,149,154,153,120,138,151,155,142,136,138},37))
VirtualUser = game:GetService(_S({123,142,151,153,154,134,145,122,152,138,151},37))
HttpService = game:GetService(_S({109,153,153,149,120,138,151,155,142,136,138},37))
TeleportService = game:GetService(_S({121,138,145,138,149,148,151,153,120,138,151,155,142,136,138},37))
CoreGui = game:GetService(_S({104,148,151,138,108,154,142},37))
ProximityPromptService = game:GetService(_S({117,151,148,157,142,146,142,153,158,117,151,148,146,149,153,120,138,151,155,142,136,138},37))
LocalPlayer = Players.LocalPlayer
State = {
Running = true,
BondsCollected = 0,
TotalResets = 0,
StartTime = os.time(),
CollectDelay = 0.05,
Status = _S({110,147,142,153,142,134,145,142,159,142,147,140,83,83,83},37)
}
function updateStatus(text)
State.Status = text
if StatusLabel and StatusLabel.Parent then
StatusLabel.Text = _S({120,153,134,153,154,152,95,69},37) .. text
end
end
LocalPlayer.Idled:Connect(function()
VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
task.wait(1)
VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
end)
function waitForCharacter(timeout)
timeout = timeout or 10
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hrp = char:WaitForChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37), timeout)
local hum = char:WaitForChild(_S({109,154,146,134,147,148,142,137},37), timeout)
return char, hrp, hum
end
function teleportTo(targetCFrame)
local char = LocalPlayer.Character
if not char then return end
local hrp = char:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37))
if not hrp then return end
hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
hrp.CFrame = targetCFrame
end
function resetCharacter()
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
function hopServer()
updateStatus(_S({109,148,149,149,142,147,140,69,153,148,69,134,69,147,138,156,69,152,138,151,155,138,151,83,83,83},37))
pcall(function()
local url = _S({141,153,153,149,152,95,84,84,140,134,146,138,152,83,151,148,135,145,148,157,83,136,148,146,84,155,86,84,140,134,146,138,152,84},37) .. game.PlaceId .. _S({84,152,138,151,155,138,151,152,84,117,154,135,145,142,136,100,152,148,151,153,116,151,137,138,151,98,102,152,136,75,145,142,146,142,153,98,86,85,85},37)
local raw = game:HttpGet(url)
local servers = HttpService:JSONDecode(raw)
if servers and servers.data then
for _, s in ipairs(servers.data) do
if s.playing and s.maxPlayers and s.playing < s.maxPlayers and s.id ~= game.JobId then
TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
break
end
end
end
end)
end
local GUI_NAME = _S({103,134,147,134,147,134,112,134,142,153,154,147,132,109,122,105},37)
pcall(function()
if CoreGui:FindFirstChild(GUI_NAME) then
CoreGui[GUI_NAME]:Destroy()
end
if LocalPlayer.PlayerGui:FindFirstChild(GUI_NAME) then
LocalPlayer.PlayerGui[GUI_NAME]:Destroy()
end
end)
ScreenGui = Instance.new(_S({120,136,151,138,138,147,108,154,142},37))
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
MainFrame = Instance.new(_S({107,151,134,146,138},37))
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
TitleLabel = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
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
TimeLabel = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
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
BondsLabel = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
BondsLabel.Name = _S({103,148,147,137,152,113,134,135,138,145},37)
BondsLabel.Size = UDim2.new(1, 0, 1, 0)
BondsLabel.BackgroundTransparency = 1
BondsLabel.RichText = true
BondsLabel.Text = _S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,103,148,147,137,152,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,139,139,136,136,85,85,71,99,85,97,84,139,148,147,153,99},37)
BondsLabel.Font = Enum.Font.GothamBold
BondsLabel.TextSize = 13.5
BondsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BondsLabel.Parent = BondsBox
StatusLabel = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
StatusLabel.Name = _S({120,153,134,153,154,152,113,134,135,138,145},37)
StatusLabel.Size = UDim2.new(1, -30, 0, 24)
StatusLabel.Position = UDim2.new(0, 15, 0, 95)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = _S({120,153,134,153,154,152,95,69,110,147,142,153,142,134,145,142,159,142,147,140,83,83,83},37)
StatusLabel.TextColor3 = Color3.fromRGB(255, 204, 0)
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.TextSize = 13
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.Parent = MainFrame
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
ActivateRemote = nil
pcall(function()
local packages = ReplicatedStorage:FindFirstChild(_S({117,134,136,144,134,140,138,152},37))
if packages and packages:FindFirstChild(_S({102,136,153,142,155,134,153,138,116,135,143,138,136,153,104,145,142,138,147,153},37)) then
ActivateRemote = packages.ActivateObjectClient
elseif ReplicatedStorage:FindFirstChild(_S({102,136,153,142,155,134,153,138,116,135,143,138,136,153,104,145,142,138,147,153},37)) then
ActivateRemote = ReplicatedStorage.ActivateObjectClient
end
end)
function triggerPrompt(prompt)
if not prompt or not prompt:IsA(_S({117,151,148,157,142,146,142,153,158,117,151,148,146,149,153},37)) then return end
pcall(function()
prompt.RequiresLineOfSight = false
prompt.MaxActivationDistance = 80
if fireproximityprompt then
fireproximityprompt(prompt, 0)
fireproximityprompt(prompt, 1, true)
else
prompt.HoldDuration = 0
prompt:InputHoldBegin()
task.wait(0.05)
prompt:InputHoldEnd()
end
end)
end
function triggerClick(clickDetector)
if not clickDetector or not clickDetector:IsA(_S({104,145,142,136,144,105,138,153,138,136,153,148,151},37)) then return end
pcall(function()
if fireclickdetector then
fireclickdetector(clickDetector)
end
end)
end
function collectTarget(target)
if not target then return end
local targetPart = target.Part
if not targetPart or not targetPart:IsDescendantOf(Workspace) then return end
teleportTo(targetPart.CFrame + Vector3.new(0, 2, 0))
task.wait(0.05)
if ActivateRemote and target.Item then
pcall(function()
ActivateRemote:FireServer(target.Item)
end)
end
if target.ClickDetector then
triggerClick(target.ClickDetector)
end
if target.Prompt then
triggerPrompt(target.Prompt)
end
if target.IsContainer then
for _ = 1, 3 do
task.wait(0.08)
if target.Prompt and target.Prompt:IsDescendantOf(Workspace) then
triggerPrompt(target.Prompt)
end
if target.ClickDetector and target.ClickDetector:IsDescendantOf(Workspace) then
triggerClick(target.ClickDetector)
end
end
task.wait(0.3)
local dropped = scanBonds(targetPart.Position, 25)
for _, drop in ipairs(dropped) do
if not drop.IsContainer and drop.Part and drop.Part:IsDescendantOf(Workspace) then
teleportTo(drop.Part.CFrame + Vector3.new(0, 1.5, 0))
if drop.Prompt then triggerPrompt(drop.Prompt) end
if drop.ClickDetector then triggerClick(drop.ClickDetector) end
State.BondsCollected = State.BondsCollected + 1
if BondsLabel and BondsLabel.Parent then
BondsLabel.Text = string.format(_S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,103,148,147,137,152,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,139,139,136,136,85,85,71,99,74,137,97,84,139,148,147,153,99},37), State.BondsCollected)
end
task.wait(0.05)
end
end
end
end
local BOND_KEYWORDS = {
_S({135,148,147,137},37), _S({153,151,138,134,152,154,151,158},37), _S({156,134,151,69,135,148,147,137},37), _S({136,134,152,141},37), _S({146,148,147,138,158},37), _S({137,148,145,145,134,151},37), _S({135,142,145,145},37), _S({140,148,145,137},37), _S({152,153,134,136,144},37), _S({151,148,145,145},37), _S({135,134,140},37), _S({145,148,148,153},37)
}
local CONTAINER_KEYWORDS = {
_S({152,134,139,138},37), _S({135,151,154,153,138,69,152,134,139,138},37), _S({142,151,148,147,69,152,134,139,138},37), _S({135,134,147,144,69,152,134,139,138},37), _S({155,134,154,145,153},37), _S({151,138,140,142,152,153,138,151},37), _S({136,134,152,141,151,138,140,142,152,153,138,151},37), _S({145,148,136,144,135,148,157},37), _S({136,141,138,152,153},37), _S({136,151,134,153,138},37), _S({135,134,147,144},37), _S({137,151,134,156,138,151},37), _S({137,138,152,144},37), _S({153,151,138,134,152,154,151,158},37)
}
local ACTION_KEYWORDS = {
_S({153,134,144,138},37), _S({140,151,134,135},37), _S({152,153,138,134,145},37), _S({136,148,145,145,138,136,153},37), _S({149,142,136,144,69,154,149},37), _S({149,142,136,144,154,149},37), _S({148,149,138,147},37), _S({136,151,134,136,144},37), _S({154,147,145,148,136,144},37), _S({152,138,134,151,136,141},37), _S({151,148,135},37), _S({145,148,148,153},37), _S({142,147,153,138,151,134,136,153},37), _S({142,147,152,149,138,136,153},37)
}
local POI_KEYWORDS = {
_S({153,148,156,147},37), _S({155,142,145,145,134,140,138},37), _S({152,153,138,151,145,142,147,140},37), _S({148,154,153,145,134,156},37), _S({135,134,147,144},37), _S({152,134,145,148,148,147},37), _S({152,153,148,151,138},37), _S({141,148,154,152,138},37), _S({152,153,134,153,142,148,147},37),
_S({136,134,152,153,145,138},37), _S({155,134,146,149,142,151,138},37), _S({139,148,151,153,151,138,152,152},37), _S({136,151,158,149,153},37),
_S({153,138,152,145,134},37), _S({145,134,135},37), _S({145,134,135,148,151,134,153,148,151,158},37), _S({140,138,147,138,151,134,153,148,151},37),
_S({136,134,155,138},37), _S({146,142,147,138},37), _S({152,153,138,151,145,142,147,140,146,142,147,138},37), _S({153,154,147,147,138,145},37),
_S({138,147,137},37), _S({139,148,151,153},37), _S({136,148,147,152,153,142,153,154,153,142,148,147},37), _S({148,154,153,149,148,152,153},37), _S({135,148,151,137,138,151},37), _S({139,142,147,142,152,141},37)
}
local function matchesKeywords(str, keywords)
if not str or str == "" then return false end
str = str:lower()
for _, kw in ipairs(keywords) do
if str:find(kw) then
return true
end
end
return false
end
function requestStream(position)
pcall(function()
if Workspace.StreamingEnabled and Workspace.RequestStreamAroundAsync then
Workspace:RequestStreamAroundAsync(position)
end
end)
end
function scanBonds(centerPos, radius)
local targets = {}
local seen = {}
local function addTarget(item, part, prompt, clickDetector, isContainer, name)
if not part or not part:IsA(_S({103,134,152,138,117,134,151,153},37)) or seen[part] then return end
if not part:IsDescendantOf(Workspace) then return end
if centerPos and radius then
if (part.Position - centerPos).Magnitude > radius then
return
end
end
seen[part] = true
table.insert(targets, {
Item = item or part,
Part = part,
Prompt = prompt,
ClickDetector = clickDetector,
IsContainer = isContainer or false,
Name = name or (item and item.Name) or part.Name
})
end
for _, prompt in ipairs(Workspace:GetDescendants()) do
if prompt:IsA(_S({117,151,148,157,142,146,142,153,158,117,151,148,146,149,153},37)) then
local parent = prompt.Parent
local grandParent = parent and parent.Parent
local pName = parent and parent.Name:lower() or ""
local gpName = grandParent and grandParent.Name:lower() or ""
local pText = (tostring(prompt.ActionText) .. _S({69},37) .. tostring(prompt.ObjectText) .. _S({69},37) .. tostring(prompt.Name)):lower()
local attrName = ""
pcall(function()
if parent then
attrName = tostring(parent:GetAttribute(_S({110,153,138,146,115,134,146,138},37)) or parent:GetAttribute(_S({121,158,149,138},37)) or parent:GetAttribute(_S({115,134,146,138},37)) or ""):lower()
end
if grandParent and attrName == "" then
attrName = tostring(grandParent:GetAttribute(_S({110,153,138,146,115,134,146,138},37)) or grandParent:GetAttribute(_S({121,158,149,138},37)) or grandParent:GetAttribute(_S({115,134,146,138},37)) or ""):lower()
end
end)
local isBond = matchesKeywords(pName, BOND_KEYWORDS) or
matchesKeywords(gpName, BOND_KEYWORDS) or
matchesKeywords(pText, BOND_KEYWORDS) or
matchesKeywords(attrName, BOND_KEYWORDS)
local isContainer = matchesKeywords(pName, CONTAINER_KEYWORDS) or
matchesKeywords(gpName, CONTAINER_KEYWORDS) or
matchesKeywords(pText, CONTAINER_KEYWORDS) or
matchesKeywords(attrName, CONTAINER_KEYWORDS)
local isActionValid = matchesKeywords(pText, ACTION_KEYWORDS) or prompt.Enabled
if (isBond or isContainer) or isActionValid then
local part = (parent and parent:IsA(_S({103,134,152,138,117,134,151,153},37)) and parent) or
(parent and parent:FindFirstChildWhichIsA(_S({103,134,152,138,117,134,151,153},37), true)) or
(grandParent and grandParent:IsA(_S({103,134,152,138,117,134,151,153},37)) and grandParent) or
(grandParent and grandParent:FindFirstChildWhichIsA(_S({103,134,152,138,117,134,151,153},37), true))
if part then
addTarget(grandParent or parent, part, prompt, nil, isContainer, parent and parent.Name)
end
end
end
end
for _, cd in ipairs(Workspace:GetDescendants()) do
if cd:IsA(_S({104,145,142,136,144,105,138,153,138,136,153,148,151},37)) then
local parent = cd.Parent
local pName = parent and parent.Name:lower() or ""
if matchesKeywords(pName, BOND_KEYWORDS) or matchesKeywords(pName, CONTAINER_KEYWORDS) then
local part = parent:IsA(_S({103,134,152,138,117,134,151,153},37)) and parent or parent:FindFirstChildWhichIsA(_S({103,134,152,138,117,134,151,153},37), true)
if part then
local isContainer = matchesKeywords(pName, CONTAINER_KEYWORDS)
addTarget(parent, part, nil, cd, isContainer, parent.Name)
end
end
end
end
local searchContainers = {
Workspace:FindFirstChild(_S({119,154,147,153,142,146,138,110,153,138,146,152},37)),
Workspace:FindFirstChild(_S({110,153,138,146,152},37)),
Workspace:FindFirstChild(_S({105,151,148,149,152},37)),
Workspace:FindFirstChild(_S({110,147,153,138,151,134,136,153,134,135,145,138,152},37)),
Workspace:FindFirstChild(_S({110,153,138,146,120,149,134,156,147,152},37)),
Workspace:FindFirstChild(_S({114,134,149},37))
}
for _, container in ipairs(searchContainers) do
if container then
for _, item in ipairs(container:GetDescendants()) do
local iName = item.Name:lower()
local attr = ""
pcall(function()
attr = tostring(item:GetAttribute(_S({110,153,138,146,115,134,146,138},37)) or item:GetAttribute(_S({121,158,149,138},37)) or ""):lower()
end)
if matchesKeywords(iName, BOND_KEYWORDS) or matchesKeywords(attr, BOND_KEYWORDS) or
matchesKeywords(iName, CONTAINER_KEYWORDS) or matchesKeywords(attr, CONTAINER_KEYWORDS) then
local part = item:IsA(_S({103,134,152,138,117,134,151,153},37)) and item or item:FindFirstChildWhichIsA(_S({103,134,152,138,117,134,151,153},37), true)
local prompt = item:FindFirstChildWhichIsA(_S({117,151,148,157,142,146,142,153,158,117,151,148,146,149,153},37), true)
local cd = item:FindFirstChildWhichIsA(_S({104,145,142,136,144,105,138,153,138,136,153,148,151},37), true)
if part then
local isContainer = matchesKeywords(iName, CONTAINER_KEYWORDS) or matchesKeywords(attr, CONTAINER_KEYWORDS)
addTarget(item, part, prompt, cd, isContainer, item.Name)
end
end
end
end
end
return targets
end
function getPOILocations()
local pois = {}
local seenPos = {}
local function addPOI(name, pos)
if not pos then return end
for _, existing in ipairs(pois) do
if (existing.Position - pos).Magnitude < 80 then
return
end
end
table.insert(pois, { Name = name, Position = pos })
end
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA(_S({114,148,137,138,145},37)) or obj:IsA(_S({107,148,145,137,138,151},37)) then
local name = obj.Name:lower()
if matchesKeywords(name, POI_KEYWORDS) or matchesKeywords(name, CONTAINER_KEYWORDS) then
local primary = (obj:IsA(_S({114,148,137,138,145},37)) and obj.PrimaryPart) or obj:FindFirstChildWhichIsA(_S({103,134,152,138,117,134,151,153},37), true)
if primary and primary.Position.Magnitude > 10 then
addPOI(obj.Name, primary.Position)
end
end
end
end
return pois
end
function getTrackTraversalPath()
local waypoints = {}
local startPos = Vector3.new(0, 5, 0)
local trackDirection = Vector3.new(0, 0, -1)
pcall(function()
local train = Workspace:FindFirstChild(_S({121,151,134,142,147},37)) or Workspace:FindFirstChild(_S({106,147,140,142,147,138},37))
if train then
local part = train:FindFirstChildWhichIsA(_S({103,134,152,138,117,134,151,153},37), true)
if part then
startPos = part.Position
trackDirection = part.CFrame.LookVector
end
end
local trackFolder = Workspace:FindFirstChild(_S({119,134,142,145,120,138,140,146,138,147,153,152},37)) or Workspace:FindFirstChild(_S({121,151,134,136,144,152},37)) or Workspace:FindFirstChild(_S({119,134,142,145,152},37))
if trackFolder then
local pieces = trackFolder:GetChildren()
if #pieces >= 2 then
local p1 = pieces[1]:IsA(_S({103,134,152,138,117,134,151,153},37)) and pieces[1] or pieces[1]:FindFirstChildWhichIsA(_S({103,134,152,138,117,134,151,153},37), true)
local p2 = pieces[#pieces]:IsA(_S({103,134,152,138,117,134,151,153},37)) and pieces[#pieces] or pieces[#pieces]:FindFirstChildWhichIsA(_S({103,134,152,138,117,134,151,153},37), true)
if p1 and p2 and (p2.Position - p1.Position).Magnitude > 20 then
trackDirection = (p2.Position - p1.Position).Unit
startPos = p1.Position
end
end
end
end)
local stepSize = 350
local totalDistance = 55000
local steps = math.floor(totalDistance / stepSize)
for i = 0, steps do
local wpPos = startPos + (trackDirection * (i * stepSize))
table.insert(waypoints, wpPos)
end
return waypoints
end
local function processTargets(targets)
if not targets or #targets == 0 then return 0 end
local collectedCount = 0
updateStatus(string.format(_S({117,151,148,136,138,152,152,142,147,140,69,74,137,69,153,134,151,140,138,153,152,69,77,103,148,147,137,152,84,120,134,139,138,152,78,83,83,83},37), #targets))
for idx, target in ipairs(targets) do
if not State.Running then break end
if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37)) then break end
local targetPart = target.Part
if targetPart and targetPart:IsDescendantOf(Workspace) then
local label = target.IsContainer and (_S({104,151,134,136,144,142,147,140,69},37) .. (target.Name or _S({120,134,139,138},37))) or (_S({113,148,148,153,142,147,140,69},37) .. (target.Name or _S({103,148,147,137},37)))
updateStatus(string.format(_S({128,74,137,84,74,137,130,69,74,152},37), idx, #targets, label))
collectTarget(target)
if not target.IsContainer then
State.BondsCollected = State.BondsCollected + 1
collectedCount = collectedCount + 1
if BondsLabel and BondsLabel.Parent then
BondsLabel.Text = string.format(_S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,103,148,147,137,152,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,139,139,136,136,85,85,71,99,74,137,97,84,139,148,147,153,99},37), State.BondsCollected)
end
end
task.wait(State.CollectDelay)
end
end
return collectedCount
end
local function performFullRunSweep()
local totalFound = 0
local pois = getPOILocations()
if #pois > 0 then
updateStatus(string.format(_S({120,156,138,138,149,142,147,140,69,74,137,69,117,116,110,152,69,77,105,138,152,134,81,69,112,134,152,153,142,145,81,69,121,138,152,145,134,81,69,108,154,134,81,69,106,147,137,78,83,83,83},37), #pois))
for _, poi in ipairs(pois) do
if not State.Running then break end
if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37)) then break end
updateStatus(string.format(_S({123,142,152,142,153,142,147,140,69,117,116,110,95,69,74,152},37), poi.Name))
teleportTo(CFrame.new(poi.Position + Vector3.new(0, 6, 0)))
requestStream(poi.Position)
task.wait(0.25)
local poiTargets = scanBonds(poi.Position, 250)
if #poiTargets > 0 then
processTargets(poiTargets)
totalFound = totalFound + #poiTargets
end
end
end
local trackPath = getTrackTraversalPath()
updateStatus(_S({121,151,134,155,138,151,152,142,147,140,69,90,90,144,146,69,119,134,142,145,156,134,158,69,145,142,147,138,69,139,148,151,69,134,145,145,69,145,148,136,134,153,142,148,147,152,83,83,83},37))
for stepIdx, pos in ipairs(trackPath) do
if not State.Running then break end
if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37)) then break end
teleportTo(CFrame.new(pos + Vector3.new(0, 8, 0)))
requestStream(pos)
task.wait(0.12)
local localTargets = scanBonds(pos, 380)
if #localTargets > 0 then
processTargets(localTargets)
totalFound = totalFound + #localTargets
end
if stepIdx % 10 == 0 then
local newlyDiscoveredPOIs = getPOILocations()
for _, newPOI in ipairs(newlyDiscoveredPOIs) do
if (newPOI.Position - pos).Magnitude < 400 then
local newTargets = scanBonds(newPOI.Position, 200)
if #newTargets > 0 then
processTargets(newTargets)
totalFound = totalFound + #newTargets
end
end
end
end
end
return totalFound
end
task.spawn(function()
updateStatus(_S({124,134,142,153,142,147,140,69,139,148,151,69,146,134,149,69,134,147,137,69,136,141,134,151,134,136,153,138,151,83,83,83},37))
waitForCharacter(10)
task.wait(2)
local emptyRuns = 0
local MAX_EMPTY_RUNS = 3
while State.Running do
task.wait(0.1)
local char = LocalPlayer.Character
local hrp = char and char:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37))
local hum = char and char:FindFirstChildOfClass(_S({109,154,146,134,147,148,142,137},37))
if char and hrp and hum and hum.Health > 0 then
local immediateTargets = scanBonds()
if #immediateTargets > 0 then
processTargets(immediateTargets)
end
updateStatus(_S({120,153,134,151,153,142,147,140,69,139,154,145,145,69,151,154,147,69,152,156,138,138,149,69,77,105,138,152,134,69,82,99,69,112,134,152,153,142,145,69,82,99,69,121,138,152,145,134,69,82,99,69,108,154,134,69,82,99,69,106,147,137,78,83,83,83},37))
local collectedInSweep = performFullRunSweep()
if collectedInSweep > 0 then
emptyRuns = 0
updateStatus(string.format(_S({120,156,138,138,149,69,139,142,147,142,152,141,138,137,70,69,107,134,151,146,138,137,69,74,137,69,142,153,138,146,152,83},37), collectedInSweep))
task.wait(1)
else
emptyRuns = emptyRuns + 1
if emptyRuns < MAX_EMPTY_RUNS then
updateStatus(string.format(_S({115,148,69,146,148,151,138,69,135,148,147,137,152,69,139,148,154,147,137,83,69,119,138,153,151,158,142,147,140,69,77,74,137,84,74,137,78,83,83,83},37), emptyRuns, MAX_EMPTY_RUNS))
task.wait(2)
else
State.TotalResets = State.TotalResets + 1
updateStatus(_S({102,145,145,69,145,148,136,134,153,142,148,147,152,69,145,148,148,153,138,137,83,69,120,138,151,155,138,151,69,141,148,149,149,142,147,140,83,83,83},37))
emptyRuns = 0
resetCharacter()
LocalPlayer.CharacterAdded:Wait()
task.wait(3)
hopServer()
task.wait(5)
end
end
else
updateStatus(_S({124,134,142,153,142,147,140,69,139,148,151,69,151,138,152,149,134,156,147,83,83,83},37))
task.wait(1)
end
end
end)
