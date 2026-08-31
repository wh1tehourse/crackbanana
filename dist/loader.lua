-- [[ Banana Crack Hub | Obfuscated Build ]]
local _S=function(t)local r=""for _,v in ipairs(t)do r=r..string.char(v)end return r end


local Players = game:GetService(_S({80,108,97,121,101,114,115}))
local StarterGui = game:GetService(_S({83,116,97,114,116,101,114,71,117,105}))
local TweenService = game:GetService(_S({84,119,101,101,110,83,101,114,118,105,99,101}))
local LocalPlayer = Players.LocalPlayer

local function _a(_j, _q, _r)
    pcall(function()
        StarterGui:SetCore(_S({83,101,110,100,78,111,116,105,102,105,99,97,116,105,111,110}), {
            Title = _j or _S({66,97,110,97,110,97,32,67,114,97,99,107,32,72,117,98}),
            Text = _q or _S({}),
            Duration = _r or 4,
            Icon = _S({104,116,116,112,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,97,115,115,101,116,47,63,105,100,61,49,51,48,57,52,55,56,53,54,57,50,57,57,48,50})
        })
    end)
end


local _b = {
    [2753915549] = _S({66,108,111,120,32,70,114,117,105,116,115,32,40,83,101,97,32,49,41}),
    [4442272183] = _S({66,108,111,120,32,70,114,117,105,116,115,32,40,83,101,97,32,50,41}),
    [7449423635] = _S({66,108,111,120,32,70,114,117,105,116,115,32,40,83,101,97,32,51,41})
}

local _c = game.PlaceId
local _d = _b[_c]

if not _d then
    _a(_S({66,97,110,97,110,97,32,67,114,97,99,107,32,72,117,98}), _S({9888,65039,32,71,97,109,101,32,110,111,116,32,115,117,112,112,111,114,116,101,100,33,32,66,108,111,120,32,70,114,117,105,116,115,32,111,110,108,121,46}), 6)
    return
end


local _e = Instance.new(_S({83,99,114,101,101,110,71,117,105}))
_e.Name = _S({66,97,110,97,110,97,76,111,97,100,101,114,71,117,105})
_e.ResetOnSpawn = false
_e.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if (syn and syn.protect_gui) then
    syn.protect_gui(_e)
    _e.Parent = game.CoreGui
elseif gethui then
    _e.Parent = gethui()
elseif game:GetService(_S({67,111,114,101,71,117,105})):FindFirstChild(_S({82,111,98,108,111,120,71,117,105})) then
    _e.Parent = game:GetService(_S({67,111,114,101,71,117,105}))
else
    _e.Parent = LocalPlayer:WaitForChild(_S({80,108,97,121,101,114,71,117,105}))
end

local _f = Instance.new(_S({70,114,97,109,101}))
_f.Name = _S({76,111,97,100,101,114,67,97,114,100})
_f.Size = UDim2.new(0, 320, 0, 75)
_f.Position = UDim2.new(0.5, -160, 0.15, 0)
_f.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
_f.BackgroundTransparency = 0.15
_f.BorderSizePixel = 0
_f.ClipsDescendants = true
_f.Parent = _e

local _g = Instance.new(_S({85,73,67,111,114,110,101,114}))
_g.CornerRadius = UDim.new(0, 12)
_g.Parent = _f

local _h = Instance.new(_S({85,73,83,116,114,111,107,101}))
_h.Color = Color3.fromRGB(255, 204, 0)
_h.Thickness = 1.5
_h.Transparency = 0.3
_h.Parent = _f

local _i = Instance.new(_S({73,109,97,103,101,76,97,98,101,108}))
_i.Size = UDim2.new(0, 42, 0, 42)
_i.Position = UDim2.new(0, 16, 0.5, -21)
_i.BackgroundTransparency = 1
_i.Image = _S({104,116,116,112,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,97,115,115,101,116,47,63,105,100,61,49,51,48,57,52,55,56,53,54,57,50,57,57,48,50})
_i.Parent = _f

local _j = Instance.new(_S({84,101,120,116,76,97,98,101,108}))
_j.Text = _S({66,97,110,97,110,97,32,67,114,97,99,107,32,72,117,98})
_j.Font = Enum.Font.GothamBold
_j.TextSize = 16
_j.TextColor3 = Color3.fromRGB(255, 215, 0)
_j.TextXAlignment = Enum.TextXAlignment.Left
_j.Position = UDim2.new(0, 68, 0, 16)
_j.Size = UDim2.new(1, -78, 0, 20)
_j.BackgroundTransparency = 1
_j.Parent = _f

local _k = Instance.new(_S({84,101,120,116,76,97,98,101,108}))
_k.Text = _S({76,111,97,100,105,110,103,32}) .. _d .. _S({46,46,46})
_k.Font = Enum.Font.GothamMedium
_k.TextSize = 12
_k.TextColor3 = Color3.fromRGB(200, 200, 200)
_k.TextXAlignment = Enum.TextXAlignment.Left
_k.Position = UDim2.new(0, 68, 0, 38)
_k.Size = UDim2.new(1, -78, 0, 18)
_k.BackgroundTransparency = 1
_k.Parent = _f


_f.Position = UDim2.new(0.5, -160, 0.08, 0)
_f.BackgroundTransparency = 1
_h.Transparency = 1
TweenService:Create(_f, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -160, 0.15, 0),
    BackgroundTransparency = 0.15
}):Play()
TweenService:Create(_h, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Transparency = 0.3
}):Play()


task.spawn(function()
    task.wait(0.5)
    local _l = _S({104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,119,104,49,116,101,104,111,117,114,115,101,47,99,114,97,99,107,98,97,110,97,110,97,47,109,97,105,110,47,100,105,115,116,47,98,97,110,97,110,97,46,108,117,97,63,116,61}) .. tostring(tick())
    local _m, response = pcall(function()
        return game:HttpGet(_l)
    end)

    if not _m or not response or response == _S({}) then
        
        local _n = _S({104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,119,104,49,116,101,104,111,117,114,115,101,47,99,114,97,99,107,98,97,110,97,110,97,47,109,97,105,110,47,100,105,115,116,47,98,97,110,97,110,97,46,108,117,97})
        pcall(function()
            response = game:HttpGet(_n)
        end)
    end

    if not response or response == _S({}) then
        _k.Text = _S({9888,65039,32,70,97,105,108,101,100,32,116,111,32,100,111,119,110,108,111,97,100,32,115,99,114,105,112,116,33})
        _k.TextColor3 = Color3.fromRGB(255, 80, 80)
        task.wait(2)
        _e:Destroy()
        return
    end

    _k.Text = _S({9889,32,69,120,101,99,117,116,105,110,103,32,72,117,98,46,46,46})
    task.wait(0.3)

    local _o, execErr = pcall(function()
        local _p = loadstring(response)
        if _p then
            _p()
        end
    end)

    if _o then
        _k.Text = _S({9989,32,83,117,99,99,101,115,115,102,117,108,108,121,32,76,111,97,100,101,100,33})
        _k.TextColor3 = Color3.fromRGB(80, 255, 120)
    else
        _k.Text = _S({9888,65039,32,76,111,97,100,32,101,114,114,111,114,44,32,99,104,101,99,107,32,99,111,110,115,111,108,101})
        _k.TextColor3 = Color3.fromRGB(255, 80, 80)
        warn(_S({91,66,97,110,97,110,97,32,67,114,97,99,107,32,72,117,98,32,69,114,114,111,114,93,58}), execErr)
    end

    task.wait(1.2)
    TweenService:Create(_f, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -160, 0.08, 0),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.35)
    _e:Destroy()
end)
