-- [[ Banana Crack Hub | Protected Build ]]
local _S=function(b,k)local t={}for i=1,#b do t[i]=string.char((b[i]-k)%256)end return table.concat(t)end;
local Players = game:GetService(_S({117,145,134,158,138,151,152},37))
local Workspace = game:GetService(_S({124,148,151,144,152,149,134,136,138},37))
local RunService = game:GetService(_S({119,154,147,120,138,151,155,142,136,138},37))
local TweenService = game:GetService(_S({121,156,138,138,147,120,138,151,155,142,136,138},37))
local VirtualUser = game:GetService(_S({123,142,151,153,154,134,145,122,152,138,151},37))
local ProximityPromptService = game:GetService(_S({117,151,148,157,142,146,142,153,158,117,151,148,146,149,153,120,138,151,155,142,136,138},37))
local HttpService = game:GetService(_S({109,153,153,149,120,138,151,155,142,136,138},37))
local TeleportService = game:GetService(_S({121,138,145,138,149,148,151,153,120,138,151,155,142,136,138},37))
local CoreGui = game:GetService(_S({104,148,151,138,108,154,142},37))
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
LocalPlayer.Idled:Connect(function()
VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
task.wait(1)
VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
end)
local Fluent
local success, res = pcall(function()
return game:HttpGet(_S({141,153,153,149,152,95,84,84,140,142,153,141,154,135,83,136,148,146,84,137,134,156,142,137,82,152,136,151,142,149,153,152,84,107,145,154,138,147,153,84,151,138,145,138,134,152,138,152,84,145,134,153,138,152,153,84,137,148,156,147,145,148,134,137,84,146,134,142,147,83,145,154,134},37))
end)
if not success or not res or res == "" then
res = game:HttpGet(_S({141,153,153,149,152,95,84,84,151,134,156,83,140,142,153,141,154,135,154,152,138,151,136,148,147,153,138,147,153,83,136,148,146,84,137,134,156,142,137,82,152,136,151,142,149,153,152,84,107,145,154,138,147,153,84,146,134,152,153,138,151,84,146,134,142,147,83,145,154,134},37))
end
Fluent = loadstring(res)()
local Window = Fluent:CreateWindow({
Title = _S({103,134,147,134,147,134,69,109,154,135,69,82,69,105,138,134,137,69,119,134,142,145,152},37),
SubTitle = _S({112,134,142,153,154,147,69,103,148,147,137,69,128,69,110,147,152,153,134,147,153,69,107,134,151,146,69,130},37),
TabWidth = 160,
Size = UDim2.fromOffset(580, 460),
Acrylic = false,
Theme = _S({105,134,151,144},37),
MinimizeKey = Enum.KeyCode.End
})
local Tabs = {
Home = Window:AddTab({ Title = _S({110,147,139,148,151,146,134,153,142,148,147},37), Icon = _S({141,148,146,138},37) }),
Kaitun = Window:AddTab({ Title = _S({112,134,142,153,154,147,69,103,148,147,137},37), Icon = _S({136,148,142,147,152},37) }),
Combat = Window:AddTab({ Title = _S({104,148,146,135,134,153,69,84,69,102,154,151,134},37), Icon = _S({152,156,148,151,137},37) }),
Visuals = Window:AddTab({ Title = _S({106,120,117,69,75,69,123,142,152,154,134,145,152},37), Icon = _S({138,158,138},37) }),
Player = Window:AddTab({ Title = _S({117,145,134,158,138,151,69,84,69,114,148,155,138},37), Icon = _S({154,152,138,151},37) }),
Misc = Window:AddTab({ Title = _S({114,142,152,136,69,84,69,120,138,151,155,138,151},37), Icon = _S({152,138,153,153,142,147,140,152},37) })
}
local State = {
AutoKaitun = false,
AutoResetOnEmpty = true,
AutoHopOnEmpty = false,
IncludeScrap = false,
IncludeChests = false,
CollectDelay = 0.05,
TeleportMethod = _S({110,147,152,153,134,147,153,69,121,117},37),
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
local currentTween = nil
local function moveTo(targetCFrame)
local char = LocalPlayer.Character
if not char then return end
local hrp = char:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37))
if not hrp then return end
if State.TeleportMethod == _S({110,147,152,153,134,147,153,69,121,117},37) then
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
local function scanCollectables()
local targets = {}
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA(_S({117,151,148,157,142,146,142,153,158,117,151,148,146,149,153},37)) and obj.Enabled then
local parent = obj.Parent
local pName = parent and parent.Name:lower() or ""
local pText = (obj.ActionText .. _S({69},37) .. obj.ObjectText):lower()
local isBond = (pName:find(_S({135,148,147,137},37)) or pName:find(_S({136,134,152,141},37)) or pName:find(_S({146,148,147,138,158},37)) or pName:find(_S({137,148,145,145,134,151},37)) or pText:find(_S({135,148,147,137},37)) or pText:find(_S({153,134,144,138,69,146,148,147,138,158},37)) or pText:find(_S({136,134,152,141},37)))
local isScrap = State.IncludeScrap and (pName:find(_S({152,136,151,134,149},37)) or pName:find(_S({146,138,153,134,145},37)) or pName:find(_S({142,151,148,147},37)) or pText:find(_S({152,136,151,134,149},37)))
local isChest = State.IncludeChests and (pName:find(_S({136,141,138,152,153},37)) or pName:find(_S({136,151,134,153,138},37)) or pName:find(_S({135,148,157},37)) or pText:find(_S({148,149,138,147},37)) or pText:find(_S({152,138,134,151,136,141},37)))
if isBond or isScrap or isChest then
local part = parent:IsA(_S({103,134,152,138,117,134,151,153},37)) and parent or parent:FindFirstChildWhichIsA(_S({103,134,152,138,117,134,151,153},37))
if part then
table.insert(targets, { Prompt = obj, Part = part, IsBond = isBond })
end
end
end
end
return targets
end
local function hopServer()
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
Tabs.Home:AddParagraph({
Title = _S({21,196,178,177,69,103,134,147,134,147,134,69,109,154,135,69,82,69,105,138,134,137,69,119,134,142,145,152,69,112,134,142,153,154,147},37),
Content = _S({107,134,152,153,69,112,134,142,153,154,147,69,103,148,147,137,69,136,148,145,145,138,136,153,148,151,69,156,142,153,141,69,134,154,153,148,146,134,153,142,136,69,136,141,134,151,134,136,153,138,151,69,151,138,152,138,153,69,75,69,152,138,151,155,138,151,69,145,148,148,149,83,47,102,154,153,141,148,151,95,69,156,141,86,153,138,141,148,154,151,152,138},37)
})
local StatusPara = Tabs.Home:AddParagraph({
Title = _S({21,196,184,175,69,113,142,155,138,69,120,153,134,153,142,152,153,142,136,152},37),
Content = _S({103,148,147,137,152,69,104,148,145,145,138,136,153,138,137,95,69,85,47,121,148,153,134,145,69,119,138,152,138,153,152,69,84,69,119,154,147,152,95,69,85,47,103,148,147,137,152,69,116,147,69,114,134,149,95,69,85},37)
})
task.spawn(function()
while task.wait(1) do
pcall(function()
local targets = scanCollectables()
State.CurrentBondsOnMap = #targets
StatusPara:SetDesc(
_S({103,148,147,137,152,69,107,134,151,146,138,137,95,69},37) .. State.BondsCollected ..
_S({47,121,148,153,134,145,69,119,138,152,138,153,152,69,84,69,119,154,147,152,95,69},37) .. State.TotalResets ..
_S({47,104,148,145,145,138,136,153,134,135,145,138,152,69,116,147,69,114,134,149,95,69},37) .. State.CurrentBondsOnMap ..
_S({47,117,142,147,140,95,69},37) .. math.floor(game:GetService(_S({120,153,134,153,152},37)).Network.ServerStatsItem[_S({105,134,153,134,69,117,142,147,140},37)]:GetValue()) .. _S({69,146,152},37)
)
end)
end
end)
Tabs.Home:AddButton({
Title = _S({104,148,149,158,69,121,138,145,138,140,151,134,146,69,104,148,146,146,154,147,142,153,158},37),
Description = _S({116,139,139,142,136,142,134,145,69,122,149,137,134,153,138,152,69,75,69,120,136,151,142,149,153,69,120,154,149,149,148,151,153},37),
Callback = function()
setclipboard(_S({141,153,153,149,152,95,84,84,153,83,146,138,84,134,158,134,152,148,154,151,136,138,136,148,137,138},37))
Fluent:Notify({ Title = _S({103,134,147,134,147,134,69,109,154,135},37), Content = _S({121,138,145,138,140,151,134,146,69,145,142,147,144,69,136,148,149,142,138,137,70},37), Duration = 3 })
end
})
Tabs.Kaitun:AddSection(_S({7,191,198,69,110,147,152,153,134,147,153,69,112,134,142,153,154,147,69,103,148,147,137,69,107,134,151,146},37))
local KaitunToggle = Tabs.Kaitun:AddToggle(_S({102,154,153,148,112,134,142,153,154,147},37), {
Title = _S({102,154,153,148,69,107,134,151,146,69,103,148,147,137,152,69,77,112,134,142,153,154,147,69,114,148,137,138,78},37),
Description = _S({110,147,152,153,134,147,153,145,158,69,153,138,145,138,149,148,151,153,152,69,153,148,69,134,145,145,69,135,148,147,137,152,69,148,147,69,146,134,149,81,69,136,148,145,145,138,136,153,152,69,153,141,138,146,81,69,134,147,137,69,151,138,152,138,153,152,69,136,141,134,151,134,136,153,138,151,69,156,141,138,147,69,137,148,147,138},37),
Default = false
})
KaitunToggle:OnChanged(function(val)
State.AutoKaitun = val
if val then
Fluent:Notify({
Title = _S({112,134,142,153,154,147,69,103,148,147,137},37),
Content = _S({102,154,153,148,69,103,148,147,137,69,107,134,151,146,69,152,153,134,151,153,138,137,70,69,124,142,145,145,69,134,154,153,148,82,151,138,152,138,153,69,156,141,138,147,69,134,145,145,69,135,148,147,137,152,69,134,151,138,69,136,148,145,145,138,136,153,138,137,83},37),
Duration = 4
})
end
end)
Tabs.Kaitun:AddToggle(_S({102,154,153,148,119,138,152,138,153},37), {
Title = _S({102,154,153,148,69,105,142,138,69,84,69,119,138,152,138,153,69,104,141,134,151,134,136,153,138,151,69,124,141,138,147,69,105,148,147,138},37),
Description = _S({102,154,153,148,146,134,153,142,136,134,145,145,158,69,151,138,152,149,134,156,147,152,69,136,141,134,151,134,136,153,138,151,69,153,148,69,151,138,152,153,134,151,153,69,151,154,147,69,156,141,138,147,69,85,69,135,148,147,137,152,69,145,138,139,153},37),
Default = true,
Callback = function(val)
State.AutoResetOnEmpty = val
end
})
Tabs.Kaitun:AddToggle(_S({102,154,153,148,109,148,149},37), {
Title = _S({102,154,153,148,69,120,138,151,155,138,151,69,109,148,149,69,124,141,138,147,69,114,134,149,69,106,146,149,153,158},37),
Description = _S({109,148,149,152,69,153,148,69,134,69,147,138,156,69,152,138,151,155,138,151,69,142,139,69,147,148,69,135,148,147,137,152,69,134,151,138,69,134,155,134,142,145,134,135,145,138,69,134,139,153,138,151,69,151,138,152,149,134,156,147},37),
Default = false,
Callback = function(val)
State.AutoHopOnEmpty = val
end
})
Tabs.Kaitun:AddDropdown(_S({121,117,114,138,153,141,148,137,105,151,148,149,137,148,156,147},37), {
Title = _S({114,148,155,138,146,138,147,153,69,114,138,153,141,148,137},37),
Values = { _S({110,147,152,153,134,147,153,69,121,117},37), _S({120,146,148,148,153,141,69,121,156,138,138,147},37) },
Default = _S({110,147,152,153,134,147,153,69,121,117},37),
Callback = function(val)
State.TeleportMethod = val
end
})
Tabs.Kaitun:AddSlider(_S({104,148,145,145,138,136,153,105,138,145,134,158,120,145,142,137,138,151},37), {
Title = _S({104,148,145,145,138,136,153,69,105,138,145,134,158,69,77,120,138,136,148,147,137,152,78},37),
Description = _S({105,138,145,134,158,69,135,138,153,156,138,138,147,69,136,148,145,145,138,136,153,142,147,140,69,138,134,136,141,69,135,148,147,137},37),
Default = 0.05,
Min = 0.01,
Max = 0.5,
Rounding = 2,
Callback = function(val)
State.CollectDelay = val
end
})
Tabs.Kaitun:AddSection(_S({21,196,184,203,69,106,157,153,151,134,69,104,148,145,145,138,136,153,134,135,145,138,152},37))
Tabs.Kaitun:AddToggle(_S({110,147,136,120,136,151,134,149},37), {
Title = _S({102,145,152,148,69,104,148,145,145,138,136,153,69,120,136,151,134,149,69,84,69,114,138,153,134,145},37),
Default = false,
Callback = function(val)
State.IncludeScrap = val
end
})
Tabs.Kaitun:AddToggle(_S({110,147,136,104,141,138,152,153,152},37), {
Title = _S({102,145,152,148,69,113,148,148,153,69,104,151,134,153,138,152,69,84,69,104,141,138,152,153,152},37),
Default = false,
Callback = function(val)
State.IncludeChests = val
end
})
task.spawn(function()
while true do
task.wait(0.1)
if State.AutoKaitun then
local char = LocalPlayer.Character
local hrp = char and char:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37))
local hum = char and char:FindFirstChildOfClass(_S({109,154,146,134,147,148,142,137},37))
if char and hrp and hum and hum.Health > 0 then
local targets = scanCollectables()
if #targets > 0 then
for _, target in ipairs(targets) do
if not State.AutoKaitun then break end
if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37)) then break end
local targetPart = target.Part
if targetPart and targetPart:IsDescendantOf(Workspace) and target.Prompt and target.Prompt.Enabled then
moveTo(targetPart.CFrame + Vector3.new(0, 1.5, 0))
triggerPrompt(target.Prompt)
if target.IsBond then
State.BondsCollected = State.BondsCollected + 1
end
task.wait(State.CollectDelay)
end
end
else
task.wait(0.5)
local recheck = scanCollectables()
if #recheck == 0 and State.AutoKaitun then
if State.AutoHopOnEmpty then
Fluent:Notify({ Title = _S({112,134,142,153,154,147},37), Content = _S({115,148,69,135,148,147,137,152,69,139,148,154,147,137,70,69,109,148,149,149,142,147,140,69,152,138,151,155,138,151,83,83,83},37), Duration = 3 })
hopServer()
task.wait(5)
elseif State.AutoResetOnEmpty then
State.TotalResets = State.TotalResets + 1
Fluent:Notify({ Title = _S({112,134,142,153,154,147},37), Content = _S({102,145,145,69,135,148,147,137,152,69,136,148,145,145,138,136,153,138,137,70,69,119,138,152,138,153,153,142,147,140,69,136,141,134,151,134,136,153,138,151,83,83,83},37), Duration = 2 })
resetCharacter()
LocalPlayer.CharacterAdded:Wait()
task.wait(1.5)
end
end
end
end
end
end
end)
Tabs.Combat:AddSection(_S({7,191,185,20,221,180,69,104,148,146,135,134,153,69,106,147,140,142,147,138},37))
Tabs.Combat:AddToggle(_S({112,142,145,145,102,154,151,134},37), {
Title = _S({112,142,145,145,69,102,154,151,134,69,77,127,148,146,135,142,138,152,69,75,69,103,134,147,137,142,153,152,78},37),
Default = false,
Callback = function(val)
State.KillAura = val
end
})
Tabs.Combat:AddSlider(_S({102,154,151,134,119,134,137,142,154,152},37), {
Title = _S({112,142,145,145,69,102,154,151,134,69,119,134,147,140,138},37),
Default = 25,
Min = 10,
Max = 60,
Rounding = 0,
Callback = function(val)
State.KillAuraRadius = val
end
})
task.spawn(function()
while task.wait(0.15) do
if State.KillAura then
pcall(function()
local char = LocalPlayer.Character
local hrp = char and char:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37))
local tool = char and char:FindFirstChildOfClass(_S({121,148,148,145},37))
if not hrp then return end
for _, model in ipairs(Workspace:GetChildren()) do
local hum = model:FindFirstChildOfClass(_S({109,154,146,134,147,148,142,137},37))
local root = model:FindFirstChild(_S({109,154,146,134,147,148,142,137,119,148,148,153,117,134,151,153},37)) or model:FindFirstChild(_S({121,148,151,152,148},37))
if hum and root and hum.Health > 0 and model ~= char and not Players:GetPlayerFromCharacter(model) then
local dist = (root.Position - hrp.Position).Magnitude
if dist <= State.KillAuraRadius then
if tool and tool:FindFirstChild(_S({119,138,146,148,153,138,106,155,138,147,153},37)) then
tool.RemoteEvent:FireServer(root.Position)
elseif tool and tool:FindFirstChild(_S({102,153,153,134,136,144},37)) then
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
Tabs.Visuals:AddSection(_S({21,196,182,166,20,221,180,69,124,148,151,145,137,69,123,142,152,154,134,145,152},37))
local espFolder = Instance.new(_S({107,148,145,137,138,151},37))
espFolder.Name = _S({103,134,147,134,147,134,132,106,120,117},37)
espFolder.Parent = CoreGui
local function createESP(part, text, color)
if not part or not part:IsA(_S({103,134,152,138,117,134,151,153},37)) then return end
if part:FindFirstChild(_S({103,134,147,134,147,134,109,142,140,141,145,142,140,141,153},37)) then return end
local bill = Instance.new(_S({103,142,145,145,135,148,134,151,137,108,154,142},37))
bill.Name = _S({103,134,147,134,147,134,109,142,140,141,145,142,140,141,153},37)
bill.AlwaysOnTop = true
bill.Size = UDim2.new(0, 100, 0, 25)
bill.StudsOffset = Vector3.new(0, 2, 0)
bill.Adornee = part
bill.Parent = espFolder
local label = Instance.new(_S({121,138,157,153,113,134,135,138,145},37))
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = text
label.TextColor3 = color or Color3.fromRGB(255, 215, 0)
label.Font = Enum.Font.GothamBold
label.TextSize = 13
label.Parent = bill
end
Tabs.Visuals:AddToggle(_S({103,148,147,137,106,120,117},37), {
Title = _S({103,148,147,137,152,69,75,69,104,134,152,141,69,106,120,117},37),
Default = false,
Callback = function(val)
State.BondESP = val
if not val then
for _, v in ipairs(espFolder:GetChildren()) do
if v.Name == _S({103,134,147,134,147,134,109,142,140,141,145,142,140,141,153},37) then v:Destroy() end
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
createESP(t.Part, _S({21,196,183,213,69,103,148,147,137,69,84,69,104,134,152,141},37), Color3.fromRGB(255, 215, 0))
end
end)
end
end
end)
Tabs.Visuals:AddToggle(_S({107,154,145,145,135,151,142,140,141,153},37), {
Title = _S({107,154,145,145,135,151,142,140,141,153,69,77,115,142,140,141,153,69,123,142,152,142,148,147,78},37),
Default = false,
Callback = function(val)
State.Fullbright = val
if val then
game:GetService(_S({113,142,140,141,153,142,147,140},37)).Brightness = 2
game:GetService(_S({113,142,140,141,153,142,147,140},37)).ClockTime = 14
game:GetService(_S({113,142,140,141,153,142,147,140},37)).FogEnd = 100000
game:GetService(_S({113,142,140,141,153,142,147,140},37)).GlobalShadows = false
else
game:GetService(_S({113,142,140,141,153,142,147,140},37)).Brightness = 1
game:GetService(_S({113,142,140,141,153,142,147,140},37)).GlobalShadows = true
end
end
})
Tabs.Player:AddSection(_S({21,196,180,168,69,114,148,155,138,146,138,147,153,69,106,147,141,134,147,136,138,146,138,147,153,152},37))
Tabs.Player:AddToggle(_S({120,149,138,138,137,121,148,140,140,145,138},37), {
Title = _S({120,149,138,138,137,69,103,148,148,152,153},37),
Default = false,
Callback = function(val)
State.SpeedHack = val
end
})
Tabs.Player:AddSlider(_S({120,149,138,138,137,120,145,142,137,138,151},37), {
Title = _S({124,134,145,144,120,149,138,138,137,69,123,134,145,154,138},37),
Default = 24,
Min = 16,
Max = 100,
Rounding = 0,
Callback = function(val)
State.SpeedValue = val
end
})
Tabs.Player:AddToggle(_S({110,147,139,120,153,134,146,142,147,134},37), {
Title = _S({110,147,139,142,147,142,153,138,69,120,153,134,146,142,147,134},37),
Default = true,
Callback = function(val)
State.InfiniteStamina = val
end
})
Tabs.Player:AddToggle(_S({115,148,136,145,142,149},37), {
Title = _S({115,148,136,145,142,149,69,114,148,137,138},37),
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
local hum = char:FindFirstChildOfClass(_S({109,154,146,134,147,148,142,137},37))
if hum then hum.WalkSpeed = State.SpeedValue end
end
if State.Noclip then
for _, part in ipairs(char:GetDescendants()) do
if part:IsA(_S({103,134,152,138,117,134,151,153},37)) then
part.CanCollide = false
end
end
end
end)
end)
Tabs.Misc:AddSection(_S({7,191,190,20,221,180,69,120,138,151,155,138,151,69,75,69,122,153,142,145,142,153,142,138,152},37))
Tabs.Misc:AddButton({
Title = _S({110,147,152,153,134,147,153,69,119,138,152,138,153,69,84,69,105,142,138,69,115,148,156},37),
Description = _S({110,147,152,153,134,147,153,145,158,69,151,138,152,138,153,152,69,136,141,134,151,134,136,153,138,151},37),
Callback = function()
resetCharacter()
end
})
Tabs.Misc:AddButton({
Title = _S({120,138,151,155,138,151,69,109,148,149,69,77,113,148,156,138,152,153,69,117,142,147,140,78},37),
Callback = function()
hopServer()
end
})
Tabs.Misc:AddButton({
Title = _S({119,138,143,148,142,147,69,120,138,151,155,138,151},37),
Callback = function()
TeleportService:Teleport(game.PlaceId, LocalPlayer)
end
})
pcall(function()
Window:SelectTab(1)
end)
Fluent:Notify({
Title = _S({103,134,147,134,147,134,69,109,154,135},37),
Content = _S({105,138,134,137,69,119,134,142,145,152,69,110,147,152,153,134,147,153,69,112,134,142,153,154,147,69,145,148,134,137,138,137,70},37),
Duration = 4
})
