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
Status = _S({110,147,142,153,142,134,145,142,159,142,147,140,83,83,83},37),
BaseBonds = nil,
}
local STRICT_BOND_KEYWORDS = {
_S({135,148,147,137},37), _S({135,148,147,137,152},37), _S({153,151,138,134,152,154,151,158},37), _S({156,134,151,135,148,147,137},37), _S({156,134,151,132,135,148,147,137},37), _S({153,151,138,134,152,154,151,158,135,148,147,137},37), _S({153,148,144,138,147},37), _S({153,148,144,138,147,152},37), _S({149,148,142,147,153,152},37), _S({136,154,151,151,138,147,136,158},37), _S({140,138,146,152},37), _S({152,141,134,151,137},37), _S({152,141,134,151,137,152},37), _S({153,142,136,144,138,153},37), _S({153,142,136,144,138,153,152},37), _S({135,134,145,134,147,136,138},37), _S({153,148,153,134,145},37)
}
local function isBondKeyword(str)
if not str or type(str) ~= _S({152,153,151,142,147,140},37) then return false end
local s = str:lower()
for _, kw in ipairs(STRICT_BOND_KEYWORDS) do
if s:find(kw) then return true end
end
return false
end
function getActualBonds()
local val = nil
local candidates = {}
pcall(function()
for attrName, attrVal in pairs(LocalPlayer:GetAttributes()) do
if type(attrVal) == _S({147,154,146,135,138,151},37) then
table.insert(candidates, { Name = _S({102,153,153,151,95},37) .. attrName, Val = attrVal, Score = isBondKeyword(attrName) and 10 or 1 })
if isBondKeyword(attrName) then
val = math.floor(attrVal)
return
end
end
end
end)
if val ~= nil then return val end
pcall(function()
local containers = {
ReplicatedStorage:FindFirstChild(_S({117,145,134,158,138,151,105,134,153,134},37)),
ReplicatedStorage:FindFirstChild(_S({117,145,134,158,138,151,120,153,134,153,152},37)),
ReplicatedStorage:FindFirstChild(_S({105,134,153,134},37)),
ReplicatedStorage:FindFirstChild(_S({117,151,148,139,142,145,138,152},37)),
ReplicatedStorage:FindFirstChild(_S({120,153,134,153,152},37)),
ReplicatedStorage:FindFirstChild(_S({119,138,149,145,142,136,134,153,138,137,105,134,153,134},37)),
ReplicatedStorage:FindFirstChild(_S({117,145,134,158,138,151,152},37))
}
for _, container in ipairs(containers) do
if container then
local pFolder = container:FindFirstChild(LocalPlayer.Name) or container:FindFirstChild(tostring(LocalPlayer.UserId))
local target = pFolder or container
for attrName, attrVal in pairs(target:GetAttributes()) do
if type(attrVal) == _S({147,154,146,135,138,151},37) then
table.insert(candidates, { Name = _S({119,120,132,102,153,153,151,95},37) .. attrName, Val = attrVal, Score = isBondKeyword(attrName) and 10 or 1 })
if isBondKeyword(attrName) then
val = math.floor(attrVal)
return
end
end
end
for _, child in ipairs(target:GetDescendants()) do
if (child:IsA(_S({110,147,153,123,134,145,154,138},37)) or child:IsA(_S({115,154,146,135,138,151,123,134,145,154,138},37))) then
table.insert(candidates, { Name = _S({119,120,132,123,134,145,95},37) .. child.Name, Val = child.Value, Score = isBondKeyword(child.Name) and 10 or 1 })
if isBondKeyword(child.Name) then
val = math.floor(child.Value)
return
end
end
end
end
end
end)
if val ~= nil then return val end
pcall(function()
for _, obj in ipairs(LocalPlayer:GetDescendants()) do
if obj:IsA(_S({110,147,153,123,134,145,154,138},37)) or obj:IsA(_S({115,154,146,135,138,151,123,134,145,154,138},37)) then
local isCash = obj.Name:lower():find(_S({136,134,152,141},37)) or obj.Name:lower():find(_S({146,148,147,138,158},37)) or obj.Name:lower():find(_S({137,148,145,145,134,151},37))
if not isCash then
table.insert(candidates, { Name = _S({113,117,132,123,134,145,95},37) .. obj.Name, Val = obj.Value, Score = isBondKeyword(obj.Name) and 10 or (obj.Value > 50 and 3 or 1) })
if isBondKeyword(obj.Name) then
val = math.floor(obj.Value)
return
end
end
end
end
end)
if val ~= nil then return val end
pcall(function()
local pg = LocalPlayer:FindFirstChild(_S({117,145,134,158,138,151,108,154,142},37))
if pg then
for _, label in ipairs(pg:GetDescendants()) do
if label:IsA(_S({121,138,157,153,113,134,135,138,145},37)) or label:IsA(_S({121,138,157,153,103,154,153,153,148,147},37)) then
local pName = label.Parent and label.Parent.Name:lower() or ""
local lName = label.Name:lower()
local text = tostring(label.Text or "")
if (isBondKeyword(pName) or isBondKeyword(lName) or text:lower():find(_S({135,148,147,137},37)) or text:lower():find(_S({153,151,138,134,152,154,151,158},37))) and not text:find(_S({74,73},37)) then
local cleanNum = text:gsub(_S({128,131,74,137,130},37), "")
local num = tonumber(cleanNum)
if num and num > 0 then
val = num
return
end
end
end
end
end
end)
if val ~= nil then return val end
if #candidates > 0 then
table.sort(candidates, function(a, b) return a.Score > b.Score end)
if candidates[1].Score > 1 or candidates[1].Val > 50 then
val = math.floor(candidates[1].Val)
return val
end
end
if not State._LoggedStats and #candidates > 0 then
State._LoggedStats = true
pcall(function()
print(_S({128,103,134,147,134,147,134,109,154,135,130,69,47,69,69,69,69,69,69,69,69,69,69,69,69,139,148,151,69,132,81,69,136,69,142,147,69,142,149,134,142,151,152,77,136,134,147,137,142,137,134,153,138,152,78,69,137,148,47,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,149,151,142,147,153,77,152,153,151,142,147,140,83,139,148,151,146,134,153,77},37)  -> %s = %s (Score: %d)_S({81,69,136,83,115,134,146,138,81,69,153,148,152,153,151,142,147,140,77,136,83,123,134,145,78,81,69,136,83,120,136,148,151,138,78,78,47,69,69,69,69,69,69,69,69,69,69,69,69,138,147,137,47,69,69,69,69,69,69,69,69,69,69,69,69,149,151,142,147,153,77},37)[BananaHub]
end)
end
return val
end
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
pcall(function()
if syn and syn.protect_gui then
syn.protect_gui(ScreenGui)
ScreenGui.Parent = CoreGui
elseif gethui then
ScreenGui.Parent = gethui()
elseif CoreGui then
ScreenGui.Parent = CoreGui
end
end)
if not ScreenGui.Parent then
pcall(function()
ScreenGui.Parent = LocalPlayer:WaitForChild(_S({117,145,134,158,138,151,108,154,142},37), 5) or LocalPlayer.PlayerGui
end)
end
MainFrame = Instance.new(_S({107,151,134,146,138},37))
MainFrame.Name = _S({114,134,142,147,107,151,134,146,138},37)
MainFrame.Size = UDim2.new(0, 380, 0, 175)
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
BondsLabel.Text = _S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,107,134,151,146,138,137,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,139,139,136,136,85,85,71,99,85,97,84,139,148,147,153,99},37)
BondsLabel.Font = Enum.Font.GothamBold
BondsLabel.TextSize = 13.5
BondsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BondsLabel.Parent = BondsBox
local Row2Container = Instance.new(_S({107,151,134,146,138},37))
Row2Container.Name = _S({119,148,156,87,104,148,147,153,134,142,147,138,151},37)
Row2Container.Size = UDim2.new(1, -30, 0, 42)
Row2Container.Position = UDim2.new(0, 15, 0, 92)
Row2Container.BackgroundTransparency = 1
Row2Container.Parent = MainFrame
local WalletBox = Instance.new(_S({107,151,134,146,138},37))
WalletBox.Name = _S({124,134,145,145,138,153,103,148,157},37)
WalletBox.Size = UDim2.new(0.48, 0, 1, 0)
WalletBox.Position = UDim2.new(0, 0, 0, 0)
WalletBox.BackgroundColor3 = Color3.fromRGB(20, 28, 20)
WalletBox.BorderSizePixel = 0
WalletBox.Parent = Row2Container
Instance.new(_S({122,110,104,148,151,147,138,151},37), WalletBox).CornerRadius = UDim.new(0, 9)
local WalletStroke = Instance.new(_S({122,110,120,153,151,148,144,138},37), WalletBox)
WalletStroke.Thickness = 1
WalletStroke.Color = Color3.fromRGB(40, 80, 40)
WalletLabel = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
WalletLabel.Name = _S({124,134,145,145,138,153,113,134,135,138,145},37)
WalletLabel.Size = UDim2.new(1, 0, 1, 0)
WalletLabel.BackgroundTransparency = 1
WalletLabel.RichText = true
WalletLabel.Text = _S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,124,134,145,145,138,153,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,91,91,139,139,93,93,71,99,100,97,84,139,148,147,153,99},37)
WalletLabel.Font = Enum.Font.GothamBold
WalletLabel.TextSize = 13.5
WalletLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WalletLabel.Parent = WalletBox
local EarnedBox = Instance.new(_S({107,151,134,146,138},37))
EarnedBox.Name = _S({106,134,151,147,138,137,103,148,157},37)
EarnedBox.Size = UDim2.new(0.48, 0, 1, 0)
EarnedBox.Position = UDim2.new(0.52, 0, 0, 0)
EarnedBox.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
EarnedBox.BorderSizePixel = 0
EarnedBox.Parent = Row2Container
Instance.new(_S({122,110,104,148,151,147,138,151},37), EarnedBox).CornerRadius = UDim.new(0, 9)
local EarnedStroke = Instance.new(_S({122,110,120,153,151,148,144,138},37), EarnedBox)
EarnedStroke.Thickness = 1
EarnedStroke.Color = Color3.fromRGB(50, 50, 90)
EarnedLabel = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
EarnedLabel.Name = _S({106,134,151,147,138,137,113,134,135,138,145},37)
EarnedLabel.Size = UDim2.new(1, 0, 1, 0)
EarnedLabel.BackgroundTransparency = 1
EarnedLabel.RichText = true
EarnedLabel.Text = _S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,106,134,151,147,138,137,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,137,137,139,139,71,99,80,85,97,84,139,148,147,153,99},37)
EarnedLabel.Font = Enum.Font.GothamBold
EarnedLabel.TextSize = 13.5
EarnedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
EarnedLabel.Parent = EarnedBox
StatusLabel = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
StatusLabel.Name = _S({120,153,134,153,154,152,113,134,135,138,145},37)
StatusLabel.Size = UDim2.new(1, -30, 0, 24)
StatusLabel.Position = UDim2.new(0, 15, 0, 140)
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
BondsLabel.Text = string.format(_S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,107,134,151,146,138,137,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,139,139,136,136,85,85,71,99,74,137,97,84,139,148,147,153,99},37), State.BondsCollected)
local actualBonds = getActualBonds()
if actualBonds ~= nil then
if State.BaseBonds == nil then
State.BaseBonds = actualBonds
end
local earned = actualBonds - State.BaseBonds
local earnedColor = earned >= 0 and _S({72,91,91,139,139,93,93},37) or _S({72,139,139,91,91,91,91},37)
local earnedPrefix = earned >= 0 and _S({80},37) or ""
WalletLabel.Text = string.format(_S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,124,134,145,145,138,153,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,91,91,139,139,93,93,71,99,74,137,97,84,139,148,147,153,99},37), actualBonds)
EarnedLabel.Text = string.format(_S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,106,134,151,147,138,137,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,74,152,71,99,74,152,74,137,97,84,139,148,147,153,99},37), earnedColor, earnedPrefix, earned)
else
WalletLabel.Text = _S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,124,134,145,145,138,153,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,93,93,93,93,93,93,71,99,115,84,102,97,84,139,148,147,153,99},37)
EarnedLabel.Text = _S({97,139,148,147,153,69,136,148,145,148,151,98,71,72,134,134,134,134,134,134,71,99,106,134,151,147,138,137,95,69,97,84,139,148,147,153,99,97,139,148,147,153,69,136,148,145,148,151,98,71,72,93,93,93,93,93,93,71,99,115,84,102,97,84,139,148,147,153,99},37)
end
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
pcall(function()
local char = LocalPlayer.Character
local hrp = char and char:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37))
if hrp and targetPart then
if firetouchinterest then
firetouchinterest(hrp, targetPart, 0)
task.wait(0.01)
firetouchinterest(hrp, targetPart, 1)
end
end
end)
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
pcall(function()
local char = LocalPlayer.Character
local hrp = char and char:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37))
if hrp and drop.Part and firetouchinterest then
firetouchinterest(hrp, drop.Part, 0)
task.wait(0.01)
firetouchinterest(hrp, drop.Part, 1)
end
end)
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
_S({135,148,147,137},37), _S({153,151,138,134,152,154,151,158},37), _S({156,134,151,69,135,148,147,137},37), _S({136,134,152,141},37), _S({146,148,147,138,158},37), _S({137,148,145,145,134,151},37), _S({135,142,145,145},37), _S({140,148,145,137},37), _S({152,153,134,136,144},37), _S({151,148,145,145},37), _S({135,134,140},37), _S({145,148,148,153},37), _S({136,154,151,151,138,147,136,158},37), _S({149,142,136,144,154,149},37), _S({151,138,156,134,151,137},37)
}
local CONTAINER_KEYWORDS = {
_S({152,134,139,138},37), _S({135,151,154,153,138,69,152,134,139,138},37), _S({142,151,148,147,69,152,134,139,138},37), _S({135,134,147,144,69,152,134,139,138},37), _S({155,134,154,145,153},37), _S({151,138,140,142,152,153,138,151},37), _S({136,134,152,141,151,138,140,142,152,153,138,151},37), _S({145,148,136,144,135,148,157},37), _S({136,141,138,152,153},37), _S({136,151,134,153,138},37), _S({135,134,147,144},37), _S({137,151,134,156,138,151},37), _S({137,138,152,144},37), _S({153,151,138,134,152,154,151,158},37)
}
local ACTION_KEYWORDS = {
_S({153,134,144,138},37), _S({140,151,134,135},37), _S({152,153,138,134,145},37), _S({136,148,145,145,138,136,153},37), _S({149,142,136,144,69,154,149},37), _S({149,142,136,144,154,149},37), _S({148,149,138,147},37), _S({136,151,134,136,144},37), _S({154,147,145,148,136,144},37), _S({152,138,134,151,136,141},37), _S({151,148,135},37), _S({145,148,148,153},37), _S({142,147,153,138,151,134,136,153},37), _S({142,147,152,149,138,136,153},37)
}
local EXCLUDE_KEYWORDS = {
_S({153,134,145,144},37), _S({152,149,138,134,144},37), _S({152,142,153},37), _S({151,138,134,137},37), _S({135,148,134,151,137},37), _S({136,151,134,139,153},37), _S({136,148,148,144},37), _S({152,145,138,138,149},37),
_S({138,147,153,138,151},37), _S({138,157,142,153},37), _S({149,154,152,141},37), _S({149,154,145,145},37), _S({136,145,142,146,135},37), _S({135,154,158},37), _S({152,138,145,145},37), _S({153,151,134,137,138},37), _S({150,154,138,152,153},37), _S({146,142,152,152,142,148,147},37)
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
local isExcluded    = matchesKeywords(pText, EXCLUDE_KEYWORDS)
if (isBond or isContainer) or (isActionValid and not isExcluded) then
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
HARDCODED_ZONES = {
{ Name = _S({120,153,134,151,153,69,123,142,145,145,134,140,138},37), Position = Vector3.new(0, 10,     0), Radius = 100 },
{ Name = _S({123,142,145,145,134,140,138,69,87},37),     Position = Vector3.new(0, 10, -9000), Radius = 100 },
{ Name = _S({123,142,145,145,134,140,138,69,88},37),     Position = Vector3.new(0, 10,-19000), Radius = 100 },
{ Name = _S({104,134,152,153,145,138},37),        Position = Vector3.new(0, 10,-26000), Radius = 120 },
{ Name = _S({121,138,152,145,134,69,113,134,135},37),     Position = Vector3.new(0, 10,-34000), Radius = 100 },
{ Name = _S({104,134,155,138,69,84,69,114,142,147,138},37),   Position = Vector3.new(0, 10,-41000), Radius = 100 },
{ Name = _S({106,147,137,69,107,148,151,153},37),      Position = Vector3.new(0, 10,-52000), Radius = 120 },
}
BondCache = BondCache or {}
function addToCache(position, zoneName, isContainer)
if not position then return end
for _, entry in ipairs(BondCache) do
if (entry.Position - position).Magnitude < 8 then
return
end
end
table.insert(BondCache, {
Position    = position,
ZoneName    = zoneName or _S({122,147,144,147,148,156,147},37),
IsContainer = isContainer or false,
})
end
function getCacheSize()
return #BondCache
end
function isCacheWarm()
return #BondCache > 0
end
function removeCached(position)
for i = #BondCache, 1, -1 do
if (BondCache[i].Position - position).Magnitude < 8 then
table.remove(BondCache, i)
return
end
end
end
function clearCache()
BondCache = {}
end
local function processTargets(targets, zoneName)
if not targets or #targets == 0 then return 0 end
local collectedCount = 0
updateStatus(string.format(_S({117,151,148,136,138,152,152,142,147,140,69,74,137,69,153,134,151,140,138,153,152,83,83,83},37), #targets))
for idx, target in ipairs(targets) do
if not State.Running then break end
if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37)) then break end
local targetPart = target.Part
if targetPart and targetPart:IsDescendantOf(Workspace) then
local label = target.IsContainer and (_S({104,151,134,136,144,142,147,140,69},37) .. (target.Name or _S({120,134,139,138},37))) or (_S({113,148,148,153,142,147,140,69},37) .. (target.Name or _S({103,148,147,137},37)))
updateStatus(string.format(_S({128,74,137,84,74,137,130,69,74,152},37), idx, #targets, label))
addToCache(targetPart.Position, zoneName, target.IsContainer)
collectTarget(target)
if not target.IsContainer then
State.BondsCollected = State.BondsCollected + 1
collectedCount = collectedCount + 1
end
task.wait(State.CollectDelay)
end
end
return collectedCount
end
local function coldSweep()
local totalFound = 0
updateStatus(string.format(_S({104,148,145,137,69,152,136,134,147,95,69,74,137,69,159,148,147,138,152,83,83,83},37), #HARDCODED_ZONES))
local detectedPOIs = getPOILocations()
local zoneList = {}
for _, zone in ipairs(HARDCODED_ZONES) do
table.insert(zoneList, { Name = zone.Name, Position = zone.Position, Radius = zone.Radius })
end
for _, poi in ipairs(detectedPOIs) do
local isDupe = false
for _, z in ipairs(zoneList) do
if (z.Position - poi.Position).Magnitude < 500 then
z.Position = poi.Position
isDupe = true
break
end
end
if not isDupe then
table.insert(zoneList, { Name = poi.Name, Position = poi.Position, Radius = 120 })
end
end
for idx, zone in ipairs(zoneList) do
if not State.Running then break end
if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37)) then break end
updateStatus(string.format(_S({127,148,147,138,69,128,74,137,84,74,137,130,95,69,74,152},37), idx, #zoneList, zone.Name))
teleportTo(CFrame.new(zone.Position + Vector3.new(0, 8, 0)))
requestStream(zone.Position)
task.wait(0.2)
local targets = scanBonds(zone.Position, zone.Radius)
if #targets > 0 then
local found = processTargets(targets, zone.Name)
totalFound = totalFound + found
end
end
return totalFound
end
local function warmSweep()
local totalFound  = 0
local missedCount = 0
local cache       = BondCache
updateStatus(string.format(_S({124,134,151,146,69,151,154,147,95,69,74,137,69,136,134,136,141,138,137,69,149,148,152,142,153,142,148,147,152},37), #cache))
for idx, entry in ipairs(cache) do
if not State.Running then break end
if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37)) then break end
local pos = entry.Position
teleportTo(CFrame.new(pos + Vector3.new(0, 2, 0)))
requestStream(pos)
task.wait(0.05)
local nearby = scanBonds(pos, 15)
if #nearby > 0 then
updateStatus(string.format(_S({128,74,137,84,74,137,130,69,109,142,153,153,142,147,140,69,136,134,136,141,138,137,95,69,74,152},37), idx, #cache, entry.ZoneName))
for _, target in ipairs(nearby) do
if not State.Running then break end
collectTarget(target)
if not target.IsContainer then
State.BondsCollected = State.BondsCollected + 1
totalFound = totalFound + 1
end
task.wait(State.CollectDelay)
end
else
removeCached(pos)
missedCount = missedCount + 1
end
end
if missedCount > 0 and missedCount >= math.floor(#cache * 0.6) then
updateStatus(_S({104,134,136,141,138,69,146,148,152,153,145,158,69,152,153,134,145,138,81,69,136,145,138,134,151,142,147,140,69,139,148,151,69,147,138,157,153,69,136,148,145,137,69,152,136,134,147,83,83,83},37))
clearCache()
end
return totalFound
end
task.spawn(function()
updateStatus(_S({124,134,142,153,142,147,140,69,139,148,151,69,146,134,149,69,134,147,137,69,136,141,134,151,134,136,153,138,151,83,83,83},37))
waitForCharacter(10)
task.wait(2)
clearCache()
local emptyRuns = 0
local MAX_EMPTY_RUNS = 5
while State.Running do
task.wait(0.1)
local char = LocalPlayer.Character
local hrp  = char and char:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37))
local hum  = char and char:FindFirstChildOfClass(_S({109,154,146,134,147,148,142,137},37))
if char and hrp and hum and hum.Health > 0 then
local collectedThisRun = 0
if isCacheWarm() then
collectedThisRun = warmSweep()
else
updateStatus(_S({104,134,136,141,138,69,136,148,145,137,69,82,69,152,136,134,147,147,142,147,140,69,134,145,145,69,159,148,147,138,152,83,83,83},37))
collectedThisRun = coldSweep()
end
if collectedThisRun > 0 then
emptyRuns = 0
updateStatus(string.format(_S({119,154,147,69,137,148,147,138,70,69,80,74,137,69,142,153,138,146,152,69,161,69,104,134,136,141,138,95,69,74,137,69,149,148,152},37), collectedThisRun, getCacheSize()))
task.wait(0.5)
else
emptyRuns = emptyRuns + 1
if emptyRuns < MAX_EMPTY_RUNS then
updateStatus(string.format(_S({115,148,153,141,142,147,140,69,139,148,154,147,137,81,69,151,138,153,151,158,69,77,74,137,84,74,137,78,83,83,83},37), emptyRuns, MAX_EMPTY_RUNS))
task.wait(1)
else
State.TotalResets = State.TotalResets + 1
emptyRuns = 0
updateStatus(_S({114,134,149,69,138,146,149,153,158,83,69,109,148,149,149,142,147,140,69,152,138,151,155,138,151,83,83,83},37))
task.wait(1)
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
