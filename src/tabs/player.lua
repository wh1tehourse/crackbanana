-- Tab: Player (TP to Player, NoClip, Walk on Water, PvP)
local v816 = v3.Player:AddDropdown("SelectedPly", {
    ["Title"] = "Select Player",
    ["Description"] = "",
    ["Values"] = vu814,
    ["Multi"] = false,
    ["Default"] = 1
})
v816:SetValue(_G.SelectPly)
v816:OnChanged(function(p817)
    _G.SelectPly = p817
end)
v3.Player:AddButton({
    ["Title"] = "Refresh Players",
    ["Description"] = "",
    ["Callback"] = function()
		-- upvalues: (ref) vu814
        table.clear(vu814)
        local v818, v819, v820 = pairs(game:GetService("Players"):GetChildren())
        while true do
            local v821
            v820, v821 = v818(v819, v820)
            if v820 == nil then
                break
            end
            table.insert(vu814, v821.Name)
        end
    end
})
v3.Player:AddToggle("ToggleTeleport", {
    ["Title"] = "Teleport to Player",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p822)
    _G.TeleportPly = p822
    if p822 == false then
        task.wait()
        AutoHaki()
        Tween2(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        task.wait()
    end
end)
v4.ToggleTeleport:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.TeleportPly then
            pcall(function()
                if game.Players:FindFirstChild(_G.SelectPly) then
                    Tween2(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
                end
            end)
        end
    end
end)
v3.Player:AddSection("Other")
v3.Player:AddToggle("ToggleNoClip", {
    ["Title"] = "No Clip",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p823)
    _G.LOf = p823
end)
v4.ToggleNoClip:SetValue(true)
task.spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.LOf then
                local v824, v825, v826 = pairs(game.Players.LocalPlayer.Character:GetDescendants())
                while true do
                    local v827
                    v826, v827 = v824(v825, v826)
                    if v826 == nil then
                        break
                    end
                    if v827:IsA("BasePart") then
                        v827.CanCollide = false
                    end
                end
            end
        end)
    end)
end)
v3.Player:AddToggle("ToggleWalkonWater", {
    ["Title"] = "Walk on Water",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p828)
    _G.WalkonWater = p828
end)
v4.ToggleWalkonWater:SetValue(true)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.WalkonWater then
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
            else
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
            end
        end)
    end
end)
v3.Player:AddToggle("ToggleEnablePvp", {
    ["Title"] = "Auto Enable PvP",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p829)
    _G.EnabledPvP = p829
end)
v4.ToggleEnablePvp:SetValue(false)
task.spawn(function()
    pcall(function()
        while task.task.wait() do
            if _G.EnabledPvP and game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
            end
        end
    end)
end)
