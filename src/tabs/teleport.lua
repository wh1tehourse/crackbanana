-- Tab: Island Teleportation
local vu830 = v3.Teleport:AddSection("Sea")
v3.Teleport:AddToggle("ToggleAutoSea2", {
    ["Title"] = "Auto Sea 2 Quest",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p831)
    _G.Auto_Sea2 = p831
end)
v4.ToggleAutoSea2:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.Auto_Sea2 then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Data.Level.Value >= 700 and World1 then
                    if game:GetService("Workspace").Map.Ice.Door.CanCollide ~= false or game:GetService("Workspace").Map.Ice.Door.Transparency ~= 1 then
                        if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
                                local v832, v833, v834 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                                while true do
                                    local v835
                                    v834, v835 = v832(v833, v834)
                                    if v834 == nil then
                                        break
                                    end
                                    if v835.Name == "Ice Admiral" then
                                        if not v835.Humanoid.Health > 0 then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                                        elseif v835:FindFirstChild("Humanoid") and (v835:FindFirstChild("HumanoidRootPart") and v835.Humanoid.Health > 0) then
                                            OldCFrameSecond = v835.HumanoidRootPart.CFrame
                                            repeat
                                                task.task.wait(_G.Fast_Delay)
                                                AutoHaki()
                                                EquipTool(SelectWeapon)
                                                v835.HumanoidRootPart.CanCollide = false
                                                v835.Humanoid.WalkSpeed = 0
                                                v835.Head.CanCollide = false
                                                v835.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                v835.HumanoidRootPart.CFrame = OldCFrameSecond
                                                Tween(v835.HumanoidRootPart.CFrame * Pos)
                                                AttackNoCoolDown()
                                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                            until not _G.Auto_Sea2 or (not v835.Parent or v835.Humanoid.Health <= 0)
                                        end
                                    end
                                end
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral") then
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                            end
                        end
                    else
                        local v836 = CFrame.new(4849.29883, 5.65138149, 719.611877)
                        repeat
                            Tween(v836)
                            task.wait()
                        until (v836.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.Auto_Sea2 == false
                        task.wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
                        task.wait(0.5)
                        EquipTool("Key")
                        repeat
                            Tween(CFrame.new(1347.7124, 37.3751602, - 1325.6488))
                            task.wait()
                        until (Vector3.new(1347.7124, 37.3751602, - 1325.6488) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.Auto_Sea2 == false
                        task.wait(0.5)
                    end
                end
            end)
        end
    end
end)
v3.Teleport:AddToggle("ToggleAutoSea3", {
    ["Title"] = "Auto Sea 3 Quest",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p837)
    _G.Auto_Sea3 = p837
end)
v4.ToggleAutoSea3:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoSea3 then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and World2 then
                    _G.AutoLevel = false
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "General") == 0 then
                        Tween(CFrame.new(- 1926.3221435547, 12.819851875305, 1738.3092041016))
                        if (CFrame.new(- 1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            task.wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
                        end
                        task.wait(1.8)
                        if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                            local v838, v839, v840 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v841
                                v840, v841 = v838(v839, v840)
                                if v840 == nil then
                                    break
                                end
                                if v841.Name == "rip_indra" then
                                    OldCFrameThird = v841.HumanoidRootPart.CFrame
                                    repeat
                                        task.task.wait(_G.Fast_Delay)
                                        AutoHaki()
                                        EquipTool(SelectWeapon)
                                        Tween(v841.HumanoidRootPart.CFrame * Pos)
                                        v841.HumanoidRootPart.CFrame = OldCFrameThird
                                        v841.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v841.HumanoidRootPart.CanCollide = false
                                        v841.Humanoid.WalkSpeed = 0
                                        AttackNoCoolDown()
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                                    until _G.AutoSea3 == false or (v841.Humanoid.Health <= 0 or not v841.Parent)
                                end
                            end
                        elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and (CFrame.new(- 26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                            Tween(CFrame.new(- 26880.93359375, 22.848554611206, 473.18951416016))
                        end
                    end
                end
            end)
        end
    end
end)
v3.Teleport:AddButton({
    ["Title"] = "Sea 1",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})
v3.Teleport:AddButton({
    ["Title"] = "Sea 2",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})
v3.Teleport:AddButton({
    ["Title"] = "Sea 3",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})
v3.Teleport:AddSection("Island")
if Sea1 then
    IslandList = {
        "WindMill",
        "Marine",
        "Middle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Snow Island",
        "MarineFord",
        "Colosseum",
        "Sky Island 1",
        "Sky Island 2",
        "Sky Island 3",
        "Prison",
        "Magma Village",
        "Under Water Island",
        "Fountain City",
        "Shank Room",
        "Mob Island"
    }
elseif Sea2 then
    IslandList = {
        "The Cafe",
        "Frist Spot",
        "Dark Area",
        "Flamingo Mansion",
        "Flamingo Room",
        "Green Zone",
        "Factory",
        "Colossuim",
        "Zombie Island",
        "Two Snow Mountain",
        "Punk Hazard",
        "Cursed Ship",
        "Ice Castle",
        "Forgotten Island",
        "Ussop Island",
        "Mini Sky Island"
    }
elseif Sea3 then
    IslandList = {
        "Mansion",
        "Port Town",
        "Great Tree",
        "Castle On The Sea",
        "MiniSky",
        "Hydra Island",
        "Floating Turtle",
        "Haunted Castle",
        "Ice Cream Island",
        "Peanut Island",
        "Cake Island",
        "Cocoa Island",
        "Candy Island",
        "Tiki Outpost"
    }
end
local v842 = v3.Teleport:AddDropdown("DropdownIsland", {
    ["Title"] = "Select Island",
    ["Description"] = "",
    ["Values"] = IslandList,
    ["Multi"] = false,
    ["Default"] = 1
})
v842:SetValue(_G.SelectIsland)
v842:OnChanged(function(p843)
    _G.SelectIsland = p843
end)
v3.Teleport:AddButton({
    ["Title"] = "Teleport to Island",
    ["Description"] = "",
    ["Callback"] = function()
        if _G.SelectIsland ~= "WindMill" then
            if _G.SelectIsland ~= "Marine" then
                if _G.SelectIsland ~= "Middle Town" then
                    if _G.SelectIsland ~= "Jungle" then
                        if _G.SelectIsland ~= "Pirate Village" then
                            if _G.SelectIsland ~= "Desert" then
                                if _G.SelectIsland ~= "Snow Island" then
                                    if _G.SelectIsland ~= "MarineFord" then
                                        if _G.SelectIsland ~= "Colosseum" then
                                            if _G.SelectIsland ~= "Sky Island 1" then
                                                if _G.SelectIsland ~= "Sky Island 2" then
                                                    if _G.SelectIsland ~= "Sky Island 3" then
                                                        if _G.SelectIsland ~= "Prison" then
                                                            if _G.SelectIsland ~= "Magma Village" then
                                                                if _G.SelectIsland ~= "Under Water Island" then
                                                                    if _G.SelectIsland ~= "Fountain City" then
                                                                        if _G.SelectIsland ~= "Shank Room" then
                                                                            if _G.SelectIsland ~= "Mob Island" then
                                                                                if _G.SelectIsland ~= "The Cafe" then
                                                                                    if _G.SelectIsland ~= "Frist Spot" then
                                                                                        if _G.SelectIsland ~= "Dark Area" then
                                                                                            if _G.SelectIsland ~= "Flamingo Mansion" then
                                                                                                if _G.SelectIsland ~= "Flamingo Room" then
                                                                                                    if _G.SelectIsland ~= "Green Zone" then
                                                                                                        if _G.SelectIsland ~= "Factory" then
                                                                                                            if _G.SelectIsland ~= "Colossuim" then
                                                                                                                if _G.SelectIsland ~= "Zombie Island" then
                                                                                                                    if _G.SelectIsland ~= "Two Snow Mountain" then
                                                                                                                        if _G.SelectIsland ~= "Punk Hazard" then
                                                                                                                            if _G.SelectIsland ~= "Cursed Ship" then
                                                                                                                                if _G.SelectIsland ~= "Ice Castle" then
                                                                                                                                    if _G.SelectIsland ~= "Forgotten Island" then
                                                                                                                                        if _G.SelectIsland ~= "Ussop Island" then
                                                                                                                                            if _G.SelectIsland ~= "Mini Sky Island" then
                                                                                                                                                if _G.SelectIsland ~= "Great Tree" then
                                                                                                                                                    if _G.SelectIsland ~= "Castle On The Sea" then
                                                                                                                                                        if _G.SelectIsland ~= "MiniSky" then
                                                                                                                                                            if _G.SelectIsland ~= "Port Town" then
                                                                                                                                                                if _G.SelectIsland ~= "Hydra Island" then
                                                                                                                                                                    if _G.SelectIsland ~= "Floating Turtle" then
                                                                                                                                                                        if _G.SelectIsland ~= "Mansion" then
                                                                                                                                                                            if _G.SelectIsland ~= "Castle On The Sea" then
                                                                                                                                                                                if _G.SelectIsland ~= "Haunted Castle" then
                                                                                                                                                                                    if _G.SelectIsland ~= "Ice Cream Island" then
                                                                                                                                                                                        if _G.SelectIsland ~= "Peanut Island" then
                                                                                                                                                                                            if _G.SelectIsland ~= "Cake Island" then
                                                                                                                                                                                                if _G.SelectIsland ~= "Cocoa Island" then
                                                                                                                                                                                                    if _G.SelectIsland ~= "Candy Island" then
                                                                                                                                                                                                        if _G.SelectIsland == "Tiki Outpost" then
                                                                                                                                                                                                            Tween2(CFrame.new(- 16542.447265625, 55.68632888793945, 1044.41650390625))
                                                                                                                                                                                                        end
                                                                                                                                                                                                    else
                                                                                                                                                                                                        Tween2(CFrame.new(- 1014.4241943359375, 149.11068725585938, - 14555.962890625))
                                                                                                                                                                                                    end
                                                                                                                                                                                                else
                                                                                                                                                                                                    Tween2(CFrame.new(87.94276428222656, 73.55451202392578, - 12319.46484375))
                                                                                                                                                                                                end
                                                                                                                                                                                            else
                                                                                                                                                                                                Tween2(CFrame.new(- 1884.7747802734375, 19.327526092529297, - 11666.8974609375))
                                                                                                                                                                                            end
                                                                                                                                                                                        else
                                                                                                                                                                                            Tween2(CFrame.new(- 2062.7475585938, 50.473892211914, - 10232.568359375))
                                                                                                                                                                                        end
                                                                                                                                                                                    else
                                                                                                                                                                                        Tween2(CFrame.new(- 902.56817626953, 79.93204498291, - 10988.84765625))
                                                                                                                                                                                    end
                                                                                                                                                                                else
                                                                                                                                                                                    Tween2(CFrame.new(- 9515.3720703125, 164.00624084473, 5786.0610351562))
                                                                                                                                                                                end
                                                                                                                                                                            else
                                                                                                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375))
                                                                                                                                                                            end
                                                                                                                                                                        else
                                                                                                                                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 12468.5380859375, 375.0094299316406, - 7554.62548828125))
                                                                                                                                                                        end
                                                                                                                                                                    else
                                                                                                                                                                        Tween2(CFrame.new(- 13274.528320313, 531.82073974609, - 7579.22265625))
                                                                                                                                                                    end
                                                                                                                                                                else
                                                                                                                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906))
                                                                                                                                                                end
                                                                                                                                                            else
                                                                                                                                                                Tween2(CFrame.new(- 290.7376708984375, 6.729952812194824, 5343.5537109375))
                                                                                                                                                            end
                                                                                                                                                        else
                                                                                                                                                            Tween2(CFrame.new(- 260.65557861328, 49325.8046875, - 35253.5703125))
                                                                                                                                                        end
                                                                                                                                                    else
                                                                                                                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375))
                                                                                                                                                    end
                                                                                                                                                else
                                                                                                                                                    Tween2(CFrame.new(2681.2736816406, 1682.8092041016, - 7190.9853515625))
                                                                                                                                                end
                                                                                                                                            else
                                                                                                                                                Tween2(CFrame.new(- 288.74060058594, 49326.31640625, - 35248.59375))
                                                                                                                                            end
                                                                                                                                        else
                                                                                                                                            Tween2(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        Tween2(CFrame.new(- 3032.7641601563, 317.89672851563, - 10075.373046875))
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                    Tween2(CFrame.new(6148.4116210938, 294.38687133789, - 6741.1166992188))
                                                                                                                                end
                                                                                                                            else
                                                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.40197753906, 125.05712890625, 32885.875))
                                                                                                                            end
                                                                                                                        else
                                                                                                                            Tween2(CFrame.new(- 6127.654296875, 15.951762199402, - 5040.2861328125))
                                                                                                                        end
                                                                                                                    else
                                                                                                                        Tween2(CFrame.new(753.14288330078, 408.23559570313, - 5274.6147460938))
                                                                                                                    end
                                                                                                                else
                                                                                                                    Tween2(CFrame.new(- 5622.033203125, 492.19604492188, - 781.78552246094))
                                                                                                                end
                                                                                                            else
                                                                                                                Tween2(CFrame.new(- 1503.6224365234, 219.7956237793, 1369.3101806641))
                                                                                                            end
                                                                                                        else
                                                                                                            Tween2(CFrame.new(424.12698364258, 211.16171264648, - 427.54049682617))
                                                                                                        end
                                                                                                    else
                                                                                                        Tween2(CFrame.new(- 2448.5300292969, 73.016105651855, - 3210.6306152344))
                                                                                                    end
                                                                                                else
                                                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.152034759521484, 905.48291015625))
                                                                                                end
                                                                                            else
                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 281.93707275390625, 306.130615234375, 609.280029296875))
                                                                                            end
                                                                                        else
                                                                                            Tween2(CFrame.new(3780.0302734375, 22.652164459229, - 3498.5859375))
                                                                                        end
                                                                                    else
                                                                                        Tween2(CFrame.new(- 11.311455726624, 29.276733398438, 2771.5224609375))
                                                                                    end
                                                                                else
                                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 281.93707275390625, 306.130615234375, 609.280029296875))
                                                                                    task.wait()
                                                                                    Tween2(CFrame.new(- 380.47927856445, 77.220390319824, 255.82550048828))
                                                                                end
                                                                            else
                                                                                Tween2(CFrame.new(- 2850.20068, 7.39224768, 5354.99268))
                                                                            end
                                                                        else
                                                                            Tween2(CFrame.new(- 1442.16553, 29.8788261, - 28.3547478))
                                                                        end
                                                                    else
                                                                        Tween2(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                                                                    end
                                                                else
                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                                                                end
                                                            else
                                                                Tween2(CFrame.new(- 5247.7163085938, 12.883934020996, 8504.96875))
                                                            end
                                                        else
                                                            Tween2(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                                                        end
                                                    else
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047))
                                                    end
                                                else
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688))
                                                end
                                            else
                                                Tween2(CFrame.new(- 4869.1025390625, 733.46051025391, - 2667.0180664063))
                                            end
                                        else
                                            Tween2(CFrame.new(- 1427.6203613281, 7.2881078720093, - 2792.7722167969))
                                        end
                                    else
                                        Tween2(CFrame.new(- 4914.8212890625, 50.963626861572, 4281.0278320313))
                                    end
                                else
                                    Tween2(CFrame.new(1347.8067626953, 104.66806030273, - 1319.7370605469))
                                end
                            else
                                Tween2(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                            end
                        else
                            Tween2(CFrame.new(- 1181.3093261719, 4.7514905929565, 3803.5456542969))
                        end
                    else
                        Tween2(CFrame.new(- 1612.7957763672, 36.852081298828, 149.12843322754))
                    end
                else
                    Tween2(CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094))
                end
            else
                Tween2(CFrame.new(- 2566.4296875, 6.8556680679321, 2045.2561035156))
            end
        else
            Tween2(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
        end
    end
})
v3.Teleport:AddButton({
    ["Title"] = "Stop Teleport",
    ["Description"] = "",
    ["Callback"] = function()
        CancelTween()
    end
})
