-- Tab: Status & Server (Player Card, Server Time, JobId, Join Server)
local vu785 = v3.Status:AddParagraph({
    ["Title"] = "Time",
    ["Content"] = ""
})
local function vu795()
	-- upvalues: (ref) vu785
    local v786 = os.date("*t")
    local v787 = v786.hour % 24
    local v788 = v787 < 12 and "AM" or "PM"
    local v789 = string.format("%02i:%02i:%02i %s", (v787 - 1) % 12 + 1, v786.min, v786.sec, v788)
    local v790 = string.format("%02d/%02d/%04d", v786.day, v786.month, v786.year)
    local vu791 = game:GetService("LocalizationService")
    local vu792 = game:GetService("Players").LocalPlayer
    local _ = vu792.Name
    local v793, v794 = pcall(function()
		-- upvalues: (ref) vu791, (ref) vu792
        return vu791:GetCountryRegionForPlayerAsync(vu792)
    end)
    vu785:SetDesc(v790 .. "-" .. v789 .. " [ " .. (not v793 and "Unknown" or v794) .. " ]")
end
task.spawn(function()
	-- upvalues: (ref) vu795
    while true do
        vu795()
        game:GetService("RunService").RenderStepped:Wait()
    end
end)
local vu796 = v3.Status:AddParagraph({
    ["Title"] = "Server Time",
    ["Content"] = ""
})
local function vu801()
	-- upvalues: (ref) vu796
    local v797 = math.floor(workspace.DistributedGameTime + 0.5)
    local v798 = math.floor(v797 / 3600) % 24
    local v799 = math.floor(v797 / 60) % 60
    local v800 = v797 % 60
    vu796:SetDesc(string.format("%02dh %02dm %02ds", v798, v799, v800))
end
task.spawn(function()
	-- upvalues: (ref) vu801
    while task.task.wait() do
        pcall(vu801)
    end
end)
local vu802 = v3.Status:AddParagraph({
    ["Title"] = "Leviathan Island",
    ["Content"] = ""
})
task.spawn(function()
	-- upvalues: (ref) vu802
    pcall(function()
		-- upvalues: (ref) vu802
        while task.task.wait(2) do
            if game:GetService("Workspace").Map:FindFirstChild("FrozenDimension") then
                vu802:SetDesc("✅")
            else
                vu802:SetDesc("❌")
            end
        end
    end)
end)
v3.Status:AddInput("Input", {
    ["Title"] = "Server JobId",
    ["Default"] = "",
    ["Placeholder"] = "",
    ["Numeric"] = false,
    ["Finished"] = false,
    ["Callback"] = function(p803)
        _G.Job = p803
    end
})
v3.Status:AddButton({
    ["Title"] = "Join Server by ID",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer)
    end
})
v3.Status:AddButton({
    ["Title"] = "Copy Server ID",
    ["Description"] = "",
    ["Callback"] = function()
        setclipboard(tostring(game.JobId))
    end
})
v3.Status:AddToggle("MyToggle", {
    ["Title"] = "Spam Join Server ID",
    ["Default"] = false
}):OnChanged(function(p804)
    _G.Join = p804
end)
task.spawn(function()
    while task.task.wait() do
        if _G.Join then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer)
        end
    end
end)
