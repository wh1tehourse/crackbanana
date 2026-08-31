-- Tab: Misc (Rejoin, Server Hop, Team Change, Codes, Anti-Ban)
v3.Misc:AddButton({
    ["Title"] = "Rejoin Server",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})
v3.Misc:AddButton({
    ["Title"] = "Server Hop",
    ["Description"] = "",
    ["Callback"] = function()
        Hop()
    end
})
function Hop()
	-- upvalues: (ref) vu830
    local vu981 = game.PlaceId
    local vu982 = {}
    local vu983 = ""
    local vu984 = os.date("!*t").hour
    function TPReturner()
		-- upvalues: (ref) vu983, (ref) vu981, (ref) vu982, (ref) vu984
        local v985
        if vu983 ~= "" then
            v985 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. vu981 .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. vu983))
        else
            v985 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. vu981 .. "/servers/Public?sortOrder=Asc&limit=100"))
        end
        if v985.nextPageCursor and (v985.nextPageCursor ~= "null" and v985.nextPageCursor ~= nil) then
            vu983 = v985.nextPageCursor
        end
        local v986, v987, v988 = pairs(v985.data)
        local v989 = 0
        while true do
            local v990
            v988, v990 = v986(v987, v988)
            if v988 == nil then
                break
            end
            local v991 = true
            local vu992 = tostring(v990.id)
            if tonumber(v990.maxPlayers) > tonumber(v990.playing) then
                local v993, v994, v995 = pairs(vu982)
                while true do
                    local v996
                    v995, v996 = v993(v994, v995)
                    if v995 == nil then
                        break
                    end
                    if v989 == 0 then
                        if tonumber(vu984) ~= tonumber(v996) then
                            pcall(function()
								-- upvalues: (ref) vu982, (ref) vu984
                                vu982 = {}
                                table.insert(vu982, vu984)
                            end)
                        end
                    elseif vu992 == tostring(v996) then
                        v991 = false
                    end
                    v989 = v989 + 1
                end
                if v991 == true then
                    table.insert(vu982, vu992)
                    task.wait()
                    pcall(function()
						-- upvalues: (ref) vu981, (ref) vu992
                        task.wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(vu981, vu992, game.Players.LocalPlayer)
                    end)
                    task.wait()
                end
            end
        end
    end
    vu830 = function()
		-- upvalues: (ref) vu983
        while task.task.wait() do
            pcall(function()
				-- upvalues: (ref) vu983
                TPReturner()
                if vu983 ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    vu830()
end
v3.Misc:AddSection("Team")
v3.Misc:AddButton({
    ["Title"] = "Pirates",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end
})
v3.Misc:AddButton({
    ["Title"] = "Marines",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
    end
})
v3.Misc:AddSection("Code")
local vu997 = {
    "KITT_RESET",
    "Sub2UncleKizaru",
    "SUB2GAMERROBOT_RESET1",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "JCWK",
    "StarcodeHEO",
    "MagicBus",
    "KittGaming",
    "Sub2CaptainMaui",
    "Sub2OfficalNoobie",
    "TheGreatAce",
    "Sub2NoobMaster123",
    "Sub2Daigrock",
    "Axiore",
    "StrawHatMaine",
    "TantaiGaming",
    "Bluxxy",
    "SUB2GAMERROBOT_EXP1",
    "Chandler",
    "NOMOREHACK",
    "BANEXPLOIT",
    "WildDares",
    "BossBuild",
    "GetPranked",
    "EARN_FRUITS",
    "FIGHT4FRUIT",
    "NOEXPLOITER",
    "NOOB2ADMIN",
    "CODESLIDE",
    "ADMINHACKED",
    "ADMINDARES",
    "fruitconcepts",
    "krazydares",
    "TRIPLEABUSE",
    "SEATROLLING",
    "24NOADMIN",
    "REWARDFUN",
    "NEWTROLL",
    "fudd10_v2",
    "Fudd10",
    "Bignews",
    "SECRET_ADMIN"
}
v3.Misc:AddButton({
    ["Title"] = "Redeem All Gift Codes",
    ["Description"] = "",
    ["Callback"] = function()
		-- upvalues: (ref) vu997
        local v998, v999, v1000 = ipairs(vu997)
        while true do
            local v1001
            v1000, v1001 = v998(v999, v1000)
            if v1000 == nil then
                break
            end
            RedeemCode(v1001)
        end
    end
})
function RedeemCode(p1002)
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(p1002)
end
v3.Misc:AddSection("Titles")
v3.Misc:AddButton({
    ["Title"] = "Titles",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "getTitles"
        }))
        game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
    end
})
v3.Misc:AddSection("Awakening")
v3.Misc:AddButton({
    ["Title"] = "Awaken Ability",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
    end
})
v3.Misc:AddSection("Misc")
v3.Misc:AddToggle("ToggleRejoin", {
    ["Title"] = "Rejoin Server",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p1003)
    _G.AutoRejoin = p1003
end)
v4.ToggleRejoin:SetValue(true)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoRejoin then
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(p1004)
                if p1004.Name == "ErrorPrompt" and p1004:FindFirstChild("MessageArea") and p1004.MessageArea:FindFirstChild("ErrorFrame") then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                end
            end)
        end
    end
end)
v3.Misc:AddSection("Fog")
local function vu1006()
    local v1005 = game:GetService("Lighting")
    if v1005:FindFirstChild("BaseAtmosphere") then
        v1005.BaseAtmosphere:Destroy()
    end
    if v1005:FindFirstChild("SeaTerrorCC") then
        v1005.SeaTerrorCC:Destroy()
    end
    if v1005:FindFirstChild("LightingLayers") then
        if v1005.LightingLayers:FindFirstChild("Atmosphere") then
            v1005.LightingLayers.Atmosphere:Destroy()
        end
        task.wait()
        if v1005.LightingLayers:FindFirstChild("DarkFog") then
            v1005.LightingLayers.DarkFog:Destroy()
        end
    end
    v1005.FogEnd = 100000
end
v3.Misc:AddButton({
    ["Title"] = "Awakening Status",
    ["Description"] = "",
    ["Callback"] = function()
		-- upvalues: (ref) vu1006
        vu1006()
    end
})
v3.Misc:AddToggle("ToggleAntiBand", {
    ["Title"] = "Anti-Ban Protection",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p1007)
    _G.AntiBand = p1007
end)
local vu1008 = {
    17884881,
    120173604,
    912348
}
task.spawn(function()
	-- upvalues: (ref) vu1008
    while task.task.wait() do
        if _G.AntiBand then
            local v1009, v1010, v1011 = pairs(game:GetService("Players"):GetPlayers())
            while true do
                local v1012
                v1011, v1012 = v1009(v1010, v1011)
                if v1011 == nil then
                    break
                end
                if table.find(vu1008, v1012.UserId) then
                    Hop()
                end
            end
        end
    end
end)
