-- Tab: Sea Events (Kitsune, Boats, Terrorshark, Shark, Piranha, Ghost Ship, Mirage, Leviathan, Draco)
    v3.Sea:AddSection("Kitsune Island Status")
    local vu365 = v3.Sea:AddParagraph({
        ["Title"] = "",
        ["Content"] = ""
    })
    function UpdateKitsune()
		-- upvalues: (ref) vu365
        if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
            vu365:SetDesc("Kitsune Island : ✅")
        else
            vu365:SetDesc("Kitsune Island : ❌")
        end
    end
    task.spawn(function()
        pcall(function()
            while task.task.wait(2) do
                UpdateKitsune()
            end
        end)
    end)
    v3.Sea:AddToggle("ToggleEspKitsune", {
        ["Title"] = "ESP Kitsune Island",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p366)
        KitsuneIslandEsp = p366
        while KitsuneIslandEsp do
            task.wait()
            UpdateIslandKisuneESP()
        end
    end)
    v4.ToggleEspKitsune:SetValue(false)
    function UpdateIslandKisuneESP()
		-- upvalues: (ref) vu145
        local v367, v368, v369 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
        while true do
            local vu370
            v369, vu370 = v367(v368, v369)
            if v369 == nil then
                break
            end
            pcall(function()
				-- upvalues: (ref) vu370, (ref) vu145
                if KitsuneIslandEsp then
                    if vu370.Name == "Kitsune Island" then
                        if vu370:FindFirstChild("NameEsp") then
                            vu370.NameEsp.TextLabel.Text = vu370.Name .. "   \n" .. vu145((game:GetService("Players").LocalPlayer.Character.Head.Position - vu370.Position).Magnitude / 3) .. " M"
                        else
                            local v371 = Instance.new("BillboardGui", vu370)
                            v371.Name = "NameEsp"
                            v371.ExtentsOffset = Vector3.new(0, 1, 0)
                            v371.Size = UDim2.new(1, 200, 1, 30)
                            v371.Adornee = vu370
                            v371.AlwaysOnTop = true
                            local v372 = Instance.new("TextLabel", v371)
                            v372.Font = "Code"
                            v372.FontSize = "Size14"
                            v372.TextWrapped = true
                            v372.Size = UDim2.new(1, 0, 1, 0)
                            v372.TextYAlignment = "Top"
                            v372.BackgroundTransparency = 1
                            v372.TextStrokeTransparency = 0.5
                            v372.TextColor3 = Color3.fromRGB(80, 245, 245)
                        end
                    end
                elseif vu370:FindFirstChild("NameEsp") then
                    vu370:FindFirstChild("NameEsp"):Destroy()
                end
            end)
        end
    end
    v3.Sea:AddToggle("ToggleTPKitsune", {
        ["Title"] = "Teleport to Kitsune Island",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p373)
        _G.TweenToKitsune = p373
    end)
    v4.ToggleTPKitsune:SetValue(false)
    task.spawn(function()
        local v374 = nil
        while not v374 do
            v374 = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
            task.wait()
        end
        while task.task.wait() do
            if _G.TweenToKitsune then
                local v375 = v374:FindFirstChild("ShrineActive")
                if v375 then
                    local v376, v377, v378 = pairs(v375:GetDescendants())
                    while true do
                        local v379
                        v378, v379 = v376(v377, v378)
                        if v378 == nil then
                            break
                        end
                        if v379:IsA("BasePart") and v379.Name:find("NeonShrinePart") then
                            Tween(v379.CFrame)
                        end
                    end
                end
            end
        end
    end)
    v3.Sea:AddToggle("ToggleCollectAzure", {
        ["Title"] = "Auto Collect Azure Ember",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p380)
        _G.CollectAzure = p380
    end)
    v4.ToggleCollectAzure:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if _G.CollectAzure then
                pcall(function()
                    if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                        Tween(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
                    end
                end)
            end
        end
    end)
end
v3.Sea:AddButton({
    ["Title"] = "Auto Trade Azure Ember",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/KitsuneStatuePray"):InvokeServer()
    end
})
if Sea3 then
    v3.Sea:AddSection("Sea")
    local vu381 = game:GetService("Players")
    local vu382 = game:GetService("RunService")
    local vu383 = game:GetService("VirtualInputManager")
    local vu384 = game:GetService("Workspace")
    local vu385 = 350
    v3.Sea:AddSlider("SliderSpeedBoat", {
        ["Title"] = "Boat Speed",
        ["Description"] = "",
        ["Default"] = vu385,
        ["Min"] = 0,
        ["Max"] = 350,
        ["Rounding"] = 1,
        ["Callback"] = function(p386)
			-- upvalues: (ref) vu385
            vu385 = p386
        end
    }):SetValue(vu385)
    local v387 = v3.Sea:AddToggle("AutoFindPrehistoric", {
        ["Title"] = "Auto Find Prehistoric Island",
        ["Description"] = "",
        ["Default"] = false
    })
    v4.AutoFindPrehistoric:SetValue(false)
    v387:OnChanged(function(p388)
        _G.AutoFindPrehistoric = p388
    end)
    local vu389 = {}
    local vu390 = false
    local vu391 = false
    vu382.RenderStepped:Connect(function()
		-- upvalues: (ref) vu391, (ref) vu381, (ref) vu390, (ref) vu389, (ref) vu384, (ref) vu385, (ref) vu383, (ref) vu1
        if _G.AutoFindPrehistoric then
            local v392 = vu381.LocalPlayer.Character
            if v392 and v392:FindFirstChild("Humanoid") then
                local function v397()
					-- upvalues: (ref) vu390, (ref) vu389
                    if vu390 then
                        return
                    end
                    vu390 = true
                    local v393, v394, v395 = pairs(vu389)
                    while true do
                        local v396
                        v395, v396 = v393(v394, v395)
                        if v395 == nil then
                            break
                        end
                        if v396 and (v396.Parent and (v396.Name == "VehicleSeat" and not v396.Occupant)) then
                            Tween2(v396.CFrame)
                            break
                        end
                    end
                    vu390 = false
                end
                local v398 = v392.Humanoid
                local v399, v400, v401 = pairs(vu384.Boats:GetChildren())
                local v402 = false
                local v403 = nil
                while true do
                    local v404
                    v401, v404 = v399(v400, v401)
                    if v401 == nil then
                        break
                    end
                    local v405 = v404:FindFirstChild("VehicleSeat")
                    if v405 and v405.Occupant == v398 then
                        vu389[v404.Name] = v405
                        v403 = v405
                        v402 = true
                    elseif v405 and v405.Occupant == nil then
                        v397()
                    end
                end
                if v402 then
                    v403.MaxSpeed = vu385
                    v403.CFrame = CFrame.new(Vector3.new(v403.Position.X, v403.Position.Y, v403.Position.Z)) * v403.CFrame.Rotation
                    vu383:SendKeyEvent(true, "W", false, game)
                    local v406, v407, v408 = pairs(vu384.Boats:GetDescendants())
                    while true do
                        local v409
                        v408, v409 = v406(v407, v408)
                        if v408 == nil then
                            break
                        end
                        if v409:IsA("BasePart") then
                            v409.CanCollide = false
                        end
                    end
                    local v410, v411, v412 = pairs(v392:GetDescendants())
                    while true do
                        local v413
                        v412, v413 = v410(v411, v412)
                        if v412 == nil then
                            break
                        end
                        if v413:IsA("BasePart") then
                            v413.CanCollide = false
                        end
                    end
                    local v414, v415, v416 = ipairs({
                        "ShipwreckIsland",
                        "SandIsland",
                        "TreeIsland",
                        "TinyIsland",
                        "MysticIsland",
                        "KitsuneIsland",
                        "FrozenDimension"
                    })
                    while true do
                        local v417
                        v416, v417 = v414(v415, v416)
                        if v416 == nil then
                            break
                        end
                        local v418 = vu384.Map:FindFirstChild(v417)
                        if v418 and v418:IsA("Model") then
                            v418:Destroy()
                        end
                    end
                    if vu384.Map:FindFirstChild("PrehistoricIsland") then
                        vu383:SendKeyEvent(false, "W", false, game)
                        _G.AutoFindPrehistoric = false
                        if not vu391 then
                            vu1:Notify({
                                ["Title"] = "Banana Crack Hub",
                                ["Content"] = " Found Prehistoric Island",
                                ["Duration"] = 10
                            })
                            vu391 = true
                        end
                    end
                else
                    return
                end
            else
                return
            end
        else
            vu391 = false
            return
        end
    end)
    local v419 = v3.Sea:AddToggle("AutoFindMirage", {
        ["Title"] = "Auto Find Mirage Island",
        ["Description"] = "",
        ["Default"] = false
    })
    v4.AutoFindMirage:SetValue(false)
    v419:OnChanged(function(p420)
        _G.AutoFindMirage = p420
    end)
    local vu421 = {}
    local vu422 = false
    local vu423 = false
    vu382.RenderStepped:Connect(function()
		-- upvalues: (ref) vu423, (ref) vu381, (ref) vu422, (ref) vu421, (ref) vu384, (ref) vu385, (ref) vu383, (ref) vu1
        if _G.AutoFindMirage then
            local v424 = vu381.LocalPlayer.Character
            if v424 and v424:FindFirstChild("Humanoid") then
                local function v429()
					-- upvalues: (ref) vu422, (ref) vu421
                    if vu422 then
                        return
                    end
                    vu422 = true
                    local v425, v426, v427 = pairs(vu421)
                    while true do
                        local v428
                        v427, v428 = v425(v426, v427)
                        if v427 == nil then
                            break
                        end
                        if v428 and (v428.Parent and (v428.Name == "VehicleSeat" and not v428.Occupant)) then
                            Tween2(v428.CFrame)
                            break
                        end
                    end
                    vu422 = false
                end
                local v430 = v424.Humanoid
                local v431, v432, v433 = pairs(vu384.Boats:GetChildren())
                local v434 = false
                local v435 = nil
                while true do
                    local v436
                    v433, v436 = v431(v432, v433)
                    if v433 == nil then
                        break
                    end
                    local v437 = v436:FindFirstChild("VehicleSeat")
                    if v437 and v437.Occupant == v430 then
                        vu421[v436.Name] = v437
                        v435 = v437
                        v434 = true
                    elseif v437 and v437.Occupant == nil then
                        v429()
                    end
                end
                if v434 then
                    v435.MaxSpeed = vu385
                    v435.CFrame = CFrame.new(Vector3.new(v435.Position.X, v435.Position.Y, v435.Position.Z)) * v435.CFrame.Rotation
                    vu383:SendKeyEvent(true, "W", false, game)
                    local v438, v439, v440 = pairs(vu384.Boats:GetDescendants())
                    while true do
                        local v441
                        v440, v441 = v438(v439, v440)
                        if v440 == nil then
                            break
                        end
                        if v441:IsA("BasePart") then
                            v441.CanCollide = false
                        end
                    end
                    local v442, v443, v444 = pairs(v424:GetDescendants())
                    while true do
                        local v445
                        v444, v445 = v442(v443, v444)
                        if v444 == nil then
                            break
                        end
                        if v445:IsA("BasePart") then
                            v445.CanCollide = false
                        end
                    end
                    local v446, v447, v448 = ipairs({
                        "ShipwreckIsland",
                        "SandIsland",
                        "TreeIsland",
                        "TinyIsland",
                        "PrehistoricIsland",
                        "KitsuneIsland",
                        "FrozenDimension"
                    })
                    while true do
                        local v449
                        v448, v449 = v446(v447, v448)
                        if v448 == nil then
                            break
                        end
                        local v450 = vu384.Map:FindFirstChild(v449)
                        if v450 and v450:IsA("Model") then
                            v450:Destroy()
                        end
                    end
                    if vu384.Map:FindFirstChild("MysticIsland") then
                        vu383:SendKeyEvent(false, "W", false, game)
                        _G.AutoFindMirage = false
                        if not vu423 then
                            vu1:Notify({
                                ["Title"] = "Banana Crack Hub",
                                ["Content"] = " Found Mirage Island",
                                ["Duration"] = 10
                            })
                            vu423 = true
                        end
                    end
                else
                    return
                end
            else
                return
            end
        else
            vu423 = false
            return
        end
    end)
    local v451 = v3.Sea:AddToggle("AutoFindFrozen", {
        ["Title"] = "Auto Find Frozen Dimension / Leviathan",
        ["Description"] = "",
        ["Default"] = false
    })
    v4.AutoFindFrozen:SetValue(false)
    v451:OnChanged(function(p452)
        _G.AutoFindFrozen = p452
    end)
    local vu453 = {}
    local vu454 = false
    local vu455 = false
    vu382.RenderStepped:Connect(function()
		-- upvalues: (ref) vu455, (ref) vu381, (ref) vu454, (ref) vu453, (ref) vu384, (ref) vu385, (ref) vu383, (ref) vu1
        if _G.AutoFindFrozen then
            local v456 = vu381.LocalPlayer.Character
            if v456 and v456:FindFirstChild("Humanoid") then
                local function v461()
					-- upvalues: (ref) vu454, (ref) vu453
                    if vu454 then
                        return
                    end
                    vu454 = true
                    local v457, v458, v459 = pairs(vu453)
                    while true do
                        local v460
                        v459, v460 = v457(v458, v459)
                        if v459 == nil then
                            break
                        end
                        if v460 and (v460.Parent and (v460.Name == "VehicleSeat" and not v460.Occupant)) then
                            Tween2(v460.CFrame)
                            break
                        end
                    end
                    vu454 = false
                end
                local v462 = v456.Humanoid
                local v463, v464, v465 = pairs(vu384.Boats:GetChildren())
                local v466 = false
                local v467 = nil
                while true do
                    local v468
                    v465, v468 = v463(v464, v465)
                    if v465 == nil then
                        break
                    end
                    local v469 = v468:FindFirstChild("VehicleSeat")
                    if v469 and v469.Occupant == v462 then
                        vu453[v468.Name] = v469
                        v467 = v469
                        v466 = true
                    elseif v469 and v469.Occupant == nil then
                        v461()
                    end
                end
                if v466 then
                    v467.MaxSpeed = vu385
                    v467.CFrame = CFrame.new(Vector3.new(v467.Position.X, v467.Position.Y, v467.Position.Z)) * v467.CFrame.Rotation
                    vu383:SendKeyEvent(true, "W", false, game)
                    local v470, v471, v472 = pairs(vu384.Boats:GetDescendants())
                    while true do
                        local v473
                        v472, v473 = v470(v471, v472)
                        if v472 == nil then
                            break
                        end
                        if v473:IsA("BasePart") then
                            v473.CanCollide = false
                        end
                    end
                    local v474, v475, v476 = pairs(v456:GetDescendants())
                    while true do
                        local v477
                        v476, v477 = v474(v475, v476)
                        if v476 == nil then
                            break
                        end
                        if v477:IsA("BasePart") then
                            v477.CanCollide = false
                        end
                    end
                    local v478, v479, v480 = ipairs({
                        "ShipwreckIsland",
                        "SandIsland",
                        "TreeIsland",
                        "TinyIsland",
                        "MysticIsland",
                        "KitsuneIsland",
                        "PrehistoricIsland"
                    })
                    while true do
                        local v481
                        v480, v481 = v478(v479, v480)
                        if v480 == nil then
                            break
                        end
                        local v482 = vu384.Map:FindFirstChild(v481)
                        if v482 and v482:IsA("Model") then
                            v482:Destroy()
                        end
                    end
                    if vu384.Map:FindFirstChild("FrozenDimension") then
                        vu383:SendKeyEvent(false, "W", false, game)
                        _G.AutoFindFrozen = false
                        if not vu455 then
                            vu1:Notify({
                                ["Title"] = "Banana Crack Hub",
                                ["Content"] = " Found Leviathan Island",
                                ["Duration"] = 10
                            })
                            vu455 = true
                        end
                    end
                else
                    return
                end
            else
                return
            end
        else
            vu455 = false
            return
        end
    end)
    v3.Sea:AddToggle("AutoComeTiki", {
        ["Title"] = "Return to Tiki Outpost",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p483)
        _G.AutoComeTiki = p483
    end)
    vu382.RenderStepped:Connect(function()
		-- upvalues: (ref) vu381, (ref) vu384, (ref) vu385, (ref) vu382, (ref) vu383
        if not _G.AutoComeTiki then
            return
        end
        local v484 = vu381.LocalPlayer.Character
        if not (v484 and v484:FindFirstChild("Humanoid")) then
            return
        end
        local v485 = v484.Humanoid
        local v486, v487, v488 = pairs(vu384.Boats:GetChildren())
        local v489 = nil
        while true do
            local v490
            v488, v490 = v486(v487, v488)
            if v488 == nil then
                v491 = v489
                break
            end
            local v491 = v490:FindFirstChild("VehicleSeat")
            if v491 and v491.Occupant == v485 then
                break
            end
        end
        if v491 then
            v491.MaxSpeed = vu385
            local v492 = CFrame.new(- 16217.7568359375, 9.126761436462402, 446.06536865234375)
            local v493 = v491.Position
            local v494 = v492.Position
            local v495 = (v494 - v493).unit * v491.MaxSpeed * vu382.RenderStepped:Wait()
            v491.CFrame = v491.CFrame + v495
            CFrame.new(v493, v494)
            v491.CFrame = CFrame.new(v491.Position, v494)
            if (v491.Position - v494).magnitude < 120 then
                _G.AutoComeTiki = false
                vu383:SendKeyEvent(false, "W", false, game)
            end
        end
    end)
    v3.Sea:AddToggle("AutoComeHydra", {
        ["Title"] = "Return to Hydra Island",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p496)
        _G.AutoComeHydra = p496
    end)
    vu382.RenderStepped:Connect(function()
		-- upvalues: (ref) vu381, (ref) vu384, (ref) vu385, (ref) vu382, (ref) vu383
        if not _G.AutoComeHydra then
            return
        end
        local v497 = vu381.LocalPlayer.Character
        if not (v497 and v497:FindFirstChild("Humanoid")) then
            return
        end
        local v498 = v497.Humanoid
        local v499, v500, v501 = pairs(vu384.Boats:GetChildren())
        local v502 = nil
        while true do
            local v503
            v501, v503 = v499(v500, v501)
            if v501 == nil then
                v504 = v502
                break
            end
            local v504 = v503:FindFirstChild("VehicleSeat")
            if v504 and v504.Occupant == v498 then
                break
            end
        end
        if v504 then
            v504.MaxSpeed = vu385
            local v505 = CFrame.new(5193.9375, - 0.04690289497375488, 1631.578369140625)
            local v506 = v504.Position
            local v507 = v505.Position
            local v508 = (v507 - v506).unit * v504.MaxSpeed * vu382.RenderStepped:Wait()
            v504.CFrame = v504.CFrame + v508
            CFrame.new(v506, v507)
            v504.CFrame = CFrame.new(v504.Position, v507)
            if (v504.Position - v507).magnitude < 120 then
                _G.AutoComeHydra = false
                vu383:SendKeyEvent(false, "W", false, game)
            end
        end
    end)
    v3.Sea:AddButton({
        ["Title"] = "Teleport to Boat Dealer [ Tiki Outpost ]",
        ["Description"] = "",
        ["Callback"] = function()
            Tween2(CFrame.new(- 16917.154296875, 7.757596015930176, 511.8203125))
        end
    })
    local vu509 = {}
    local v510 = v3.Sea:AddDropdown("DropdownBoat", {
        ["Title"] = "Select Boat",
        ["Description"] = "",
        ["Values"] = {
            "Beast Hunter",
            "Sleigh",
            "Miracle",
            "The Sentinel",
            "Guardian",
            "Lantern",
            "Dinghy",
            "PirateSloop",
            "PirateBrigade",
            "PirateGrandBrigade",
            "MarineGrandBrigade",
            "MarineBrigade",
            "MarineSloop"
        },
        ["Multi"] = false,
        ["Default"] = 1
    })
    v510:SetValue(selectedBoat)
    v510:OnChanged(function(p511)
        selectedBoat = p511
    end)
    local function vu518(pu512)
		-- upvalues: (ref) vu384, (ref) vu509
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "BuyBoat",
            pu512
        }))
        task.delay(2, function()
			-- upvalues: (ref) vu384, (ref) pu512, (ref) vu509
            local v513, v514, v515 = pairs(vu384.Boats:GetChildren())
            while true do
                local v516
                v515, v516 = v513(v514, v515)
                if v515 == nil then
                    break
                end
                if v516:IsA("Model") and v516.Name == pu512 then
                    local v517 = v516:FindFirstChild("VehicleSeat")
                    if v517 and not v517.Occupant then
                        vu509[pu512] = v517
                    end
                end
            end
        end)
    end
    local function vu523()
		-- upvalues: (ref) vu509
        local v519, v520, v521 = pairs(vu509)
        while true do
            local v522
            v521, v522 = v519(v520, v521)
            if v521 == nil then
                break
            end
            if v522 and (v522.Parent and (v522.Name == "VehicleSeat" and not v522.Occupant)) then
                Tween2(v522.CFrame)
            end
        end
    end
    game:GetService("RunService").RenderStepped:Connect(function()
		-- upvalues: (ref) vu509
        local v524, v525, v526 = pairs(vu509)
        while true do
            local v527
            v526, v527 = v524(v525, v526)
            if v526 == nil then
                break
            end
            if v527 and (v527.Parent and (v527.Name == "VehicleSeat" and not v527.Occupant)) then
                vu509[v526] = v527
            end
        end
    end)
    v3.Sea:AddButton({
        ["Title"] = "Buy Boat",
        ["Description"] = "",
        ["Callback"] = function()
			-- upvalues: (ref) vu518
            vu518(selectedBoat)
        end
    })
    v3.Sea:AddButton({
        ["Title"] = "Teleport to My Boat",
        ["Description"] = "",
        ["Callback"] = function()
			-- upvalues: (ref) vu523
            vu523()
        end
    })
    -- ============================================================
    -- AUTO TYRANT OF THE SKIES (Unlock Submerged Island)
    -- ============================================================
    v3.Sea:AddSection("Tyrant of the Skies")
    local vu_TyrantStatus = v3.Sea:AddParagraph({
        ["Title"] = "Status",
        ["Content"] = "Checking..."
    })
    -- Status updater
    task.spawn(function()
        while task.wait(2) do
            pcall(function()
                local lp = game:GetService("Players").LocalPlayer
                local char = lp.Character
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                -- Cek apakah Tyrant sudah spawn di Workspace.Enemies
                local tyrantAlive = game:GetService("Workspace").Enemies:FindFirstChild("Tyrant of the Skies")
                -- Cek apakah Falcon statue eyes menyala (TikiOutpost falcon statues)
                local falconReady = false
                pcall(function()
                    local tikiMap = game:GetService("Workspace").Map:FindFirstChild("TikiOutpost")
                    if tikiMap then
                        local falcon = tikiMap:FindFirstChild("FalconStatue", true)
                        if falcon then
                            falconReady = falcon:FindFirstChild("EyeGlow") ~= nil or falcon.Material == Enum.Material.Neon
                        end
                    end
                end)
                local statusText = ""
                if tyrantAlive then
                    statusText = "🔴 Tyrant ALIVE - Auto Kill aktif!"
                elseif falconReady then
                    statusText = "🟡 Falcon Eyes menyala - siap spawn"
                else
                    statusText = "⚪ Farm musuh Tiki (butuh 300 kills)"
                end
                vu_TyrantStatus:SetDesc(statusText)
            end)
        end
    end)
    v3.Sea:AddToggle("ToggleAutoTyrant", {
        ["Title"] = "Auto Tyrant of the Skies (Full Auto)",
        ["Description"] = "Farm 300 musuh Tiki → Spawn Tyrant → Kill → Unlock Submerged Island",
        ["Default"] = false
    }):OnChanged(function(p_tyrant)
        _G.AutoTyrant = p_tyrant
    end)
    v4.ToggleAutoTyrant:SetValue(false)
    task.spawn(function()
        while task.wait() do
            if _G.AutoTyrant and Sea3 then
                pcall(function()
                    local lp = game:GetService("Players").LocalPlayer
                    local char = lp.Character
                    if not char then return end
                    local hum = char:FindFirstChild("Humanoid")
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if not hrp or not hum or hum.Health <= 0 then return end

                    -- FASE 1: Tyrant sudah spawn → langsung kill
                    if game:GetService("Workspace").Enemies:FindFirstChild("Tyrant of the Skies") then
                        local enemies = game:GetService("Workspace").Enemies:GetChildren()
                        for _, enemy in pairs(enemies) do
                            if enemy.Name == "Tyrant of the Skies"
                                and enemy:FindFirstChild("Humanoid")
                                and enemy:FindFirstChild("HumanoidRootPart")
                                and enemy.Humanoid.Health > 0
                            then
                                local savedCFrame = enemy.HumanoidRootPart.CFrame
                                repeat
                                    task.wait(_G.Fast_Delay or 0.1)
                                    char = lp.Character
                                    if not char then break end
                                    hum = char:FindFirstChild("Humanoid")
                                    hrp = char:FindFirstChild("HumanoidRootPart")
                                    if not hrp or not hum then break end
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    -- Tyrant terbang, pakai offset tinggi
                                    enemy.HumanoidRootPart.CanCollide = false
                                    enemy.Humanoid.WalkSpeed = 0
                                    enemy.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                    enemy.HumanoidRootPart.CFrame = savedCFrame
                                    Tween(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
                                    AttackNoCoolDown()
                                    sethiddenproperty(lp, "SimulationRadius", math.huge)
                                until not _G.AutoTyrant
                                    or not enemy.Parent
                                    or enemy.Humanoid.Health <= 0

                                -- Tyrant mati → coba masuk Submerged Island
                                if not enemy.Parent or enemy.Humanoid.Health <= 0 then
                                    task.wait(3)
                                    pcall(function()
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                            "requestEntrance",
                                            Vector3.new(10882.3, -2086.3, 10034.2)
                                        )
                                    end)
                                    _G.AutoTyrant = false
                                    v4.ToggleAutoTyrant:SetValue(false)
                                end
                                break
                            end
                        end

                    -- FASE 2: Tyrant belum spawn → farm musuh Tiki Outpost sampai 300 kills
                    else
                        -- Pergi ke Tiki Outpost dulu jika jauh
                        if hrp then
                            local tikiPos = Vector3.new(-16542.4, 55.7, 1044.4)
                            if (hrp.Position - tikiPos).Magnitude > 3000 then
                                Tween2(CFrame.new(tikiPos))
                                task.wait(2)
                                return
                            end
                        end
                        -- Farm semua musuh di sekitar Tiki Outpost
                        local foundEnemy = false
                        for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if enemy:FindFirstChild("Humanoid")
                                and enemy:FindFirstChild("HumanoidRootPart")
                                and enemy.Humanoid.Health > 0
                            then
                                -- Pastikan musuh ini ada di sekitar Tiki Outpost
                                local tikiPos = Vector3.new(-16542.4, 55.7, 1044.4)
                                if (enemy.HumanoidRootPart.Position - tikiPos).Magnitude < 2000 then
                                    foundEnemy = true
                                    local savedCF = enemy.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait(_G.Fast_Delay or 0.1)
                                        char = lp.Character
                                        if not char then break end
                                        hum = char:FindFirstChild("Humanoid")
                                        hrp = char:FindFirstChild("HumanoidRootPart")
                                        if not hrp or not hum or hum.Health <= 0 then break end
                                        AutoHaki()
                                        EquipTool(SelectWeapon)
                                        enemy.HumanoidRootPart.CanCollide = false
                                        enemy.Humanoid.WalkSpeed = 0
                                        enemy.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        enemy.HumanoidRootPart.CFrame = savedCF
                                        Tween(enemy.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCoolDown()
                                    until not _G.AutoTyrant
                                        or not enemy.Parent
                                        or enemy.Humanoid.Health <= 0
                                    break
                                end
                            end
                        end
                        -- Kalau tidak ada musuh, teleport ke spawn musuh Tiki
                        if not foundEnemy then
                            Tween2(CFrame.new(-16357.3, 20.6, 1005.6))
                            task.wait(1)
                        end
                    end
                end)
            end
        end
    end)
    -- ============================================================

    v3.Sea:AddToggle("ToggleTerrorshark", {
        ["Title"] = "Auto Attack Terrorshark",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p528)
        _G.AutoTerrorshark = p528
    end)
    v4.ToggleTerrorshark:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if _G.AutoTerrorshark then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                        local v529, v530, v531 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v532
                            v531, v532 = v529(v530, v531)
                            if v531 == nil then
                                break
                            end
                            if v532.Name == "Terrorshark" and (v532:FindFirstChild("Humanoid") and (v532:FindFirstChild("HumanoidRootPart") and v532.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v532.HumanoidRootPart.CanCollide = false
                                    v532.Humanoid.WalkSpeed = 0
                                    v532.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v532.HumanoidRootPart.CFrame * Pos)
                                until not _G.AutoTerrorshark or (not v532.Parent or v532.Humanoid.Health <= 0)
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end)
            end
        end
    end)
    v3.Sea:AddToggle("TogglePiranha", {
        ["Title"] = "Auto Attack Piranha",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p533)
        _G.farmpiranya = p533
    end)
    v4.TogglePiranha:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if _G.farmpiranya then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                        local v534, v535, v536 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v537
                            v536, v537 = v534(v535, v536)
                            if v536 == nil then
                                break
                            end
                            if v537.Name == "Piranha" and (v537:FindFirstChild("Humanoid") and (v537:FindFirstChild("HumanoidRootPart") and v537.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v537.HumanoidRootPart.CanCollide = false
                                    v537.Humanoid.WalkSpeed = 0
                                    v537.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v537.HumanoidRootPart.CFrame * Pos)
                                until not _G.farmpiranya or (not v537.Parent or v537.Humanoid.Health <= 0)
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end)
            end
        end
    end)
    v3.Sea:AddToggle("ToggleShark", {
        ["Title"] = "Auto Attack Shark",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p538)
        _G.AutoShark = p538
    end)
    v4.ToggleShark:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if _G.AutoShark then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                        local v539, v540, v541 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v542
                            v541, v542 = v539(v540, v541)
                            if v541 == nil then
                                break
                            end
                            if v542.Name == "Shark" and (v542:FindFirstChild("Humanoid") and (v542:FindFirstChild("HumanoidRootPart") and v542.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v542.HumanoidRootPart.CanCollide = false
                                    v542.Humanoid.WalkSpeed = 0
                                    v542.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v542.HumanoidRootPart.CFrame * Pos)
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not _G.AutoShark or (not v542.Parent or v542.Humanoid.Health <= 0)
                            end
                        end
                    else
                        Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end)
            end
        end
    end)
    v3.Sea:AddToggle("ToggleFishCrew", {
        ["Title"] = "Auto Attack Fish Crew",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p543)
        _G.AutoFishCrew = p543
    end)
    v4.ToggleFishCrew:SetValue(false)
    task.spawn(function()
        while task.task.wait() do
            if _G.AutoFishCrew then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                        local v544, v545, v546 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v547
                            v546, v547 = v544(v545, v546)
                            if v546 == nil then
                                break
                            end
                            if v547.Name == "Fish Crew Member" and (v547:FindFirstChild("Humanoid") and (v547:FindFirstChild("HumanoidRootPart") and v547.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v547.HumanoidRootPart.CanCollide = false
                                    v547.Humanoid.WalkSpeed = 0
                                    v547.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v547.HumanoidRootPart.CFrame * Pos)
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not _G.AutoFishCrew or (not v547.Parent or v547.Humanoid.Health <= 0)
                            end
                        end
                    else
                        Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member") then
                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end)
            end
        end
    end)
    v3.Sea:AddToggle("ToggleShip", {
        ["Title"] = "Auto Attack Ship",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p548)
        _G.Ship = p548
    end)
    v4.ToggleShip:SetValue(false)
    function CheckPirateBoat()
        local v549 = next
        local v550, v551 = game:GetService("Workspace").Enemies:GetChildren()
        local v552 = {
            "PirateGrandBrigade",
            "PirateBrigade"
        }
        while true do
            local v553
            v551, v553 = v549(v550, v551)
            if v551 == nil then
                break
            end
            if table.find(v552, v553.Name) and (v553:FindFirstChild("Health") and v553.Health.Value > 0) then
                return v553
            end
        end
    end
    task.spawn(function()
        while task.task.wait() do
            if _G.Ship then
                pcall(function()
                    if CheckPirateBoat() then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                        task.wait(0.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                        local v554 = CheckPirateBoat()
                        repeat
                            task.wait()
                            spawn(Tween(v554.Engine.CFrame * CFrame.new(0, - 20, 0)), 1)
                            AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, - 5, 0)
                            Skillaimbot = true
                            AutoSkill = false
                        until not v554 or (not v554.Parent or (v554.Health.Value <= 0 or not CheckPirateBoat()))
                        Skillaimbot = true
                        AutoSkill = false
                    end
                end)
            end
        end
    end)
    v3.Sea:AddToggle("ToggleGhostShip", {
        ["Title"] = "Auto Attack Ghost Ship",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p555)
        _G.GhostShip = p555
    end)
    v4.ToggleGhostShip:SetValue(false)
    function CheckPirateBoat()
        local v556 = next
        local v557, v558 = game:GetService("Workspace").Enemies:GetChildren()
        local v559 = {
            "FishBoat"
        }
        while true do
            local v560
            v558, v560 = v556(v557, v558)
            if v558 == nil then
                break
            end
            if table.find(v559, v560.Name) and (v560:FindFirstChild("Health") and v560.Health.Value > 0) then
                return v560
            end
        end
    end
    task.spawn(function()
        while task.task.wait() do
            pcall(function()
                if _G.bjirFishBoat and CheckPirateBoat() then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                    task.wait()
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                    local v561 = CheckPirateBoat()
                    repeat
                        task.wait()
                        spawn(Tween(v561.Engine.CFrame * CFrame.new(0, - 20, 0), 1))
                        AutoSkill = true
                        Skillaimbot = true
                        AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, - 5, 0)
                    until v561.Parent or (v561.Health.Value <= 0 or not CheckPirateBoat())
                    AutoSkill = false
                    Skillaimbot = false
                end
            end)
        end
    end)
    task.spawn(function()
        while task.task.wait() do
            if _G.bjirFishBoat then
                pcall(function()
                    if CheckPirateBoat() then
                        AutoHaki()
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        local v562, v563, v564 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v565
                            v564, v565 = v562(v563, v564)
                            if v564 == nil then
                                break
                            end
                            if v565:IsA("Tool") and v565.ToolTip == "Melee" then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v565)
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        task.wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        task.wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        task.wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        local v566, v567, v568 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v569
                            v568, v569 = v566(v567, v568)
                            if v568 == nil then
                                break
                            end
                            if v569:IsA("Tool") and v569.ToolTip == "Blox Fruit" then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v569)
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        task.wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        task.wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        task.wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        task.wait()
                        local v570, v571, v572 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v573
                            v572, v573 = v570(v571, v572)
                            if v572 == nil then
                                break
                            end
                            if v573:IsA("Tool") and v573.ToolTip == "Sword" then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v573)
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        task.wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        task.wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        task.wait()
                        local v574, v575, v576 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v577
                            v576, v577 = v574(v575, v576)
                            if v576 == nil then
                                break
                            end
                            if v577:IsA("Tool") and v577.ToolTip == "Gun" then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v577)
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        task.wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        task.wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    end
                end)
            end
        end
    end)
    v3.Sea:AddSection("Mirage Island")
    local vu584 = v3.Sea:AddParagraph({
        ["Title"] = "Status",
        ["Content"] = ""
    })
    task.task.spawn(function()
        while task.task.wait() do
            pcall(function()
                local v585 = game:GetService("Lighting").Sky.MoonTextureId
                if v585 == "http://www.roblox.com/asset/?id=9709149431" then
                    FullMoonStatus = "100%"
                elseif v585 == "http://www.roblox.com/asset/?id=9709149052" then
                    FullMoonStatus = "75%"
                elseif v585 == "http://www.roblox.com/asset/?id=9709143733" then
                    FullMoonStatus = "50%"
                elseif v585 == "http://www.roblox.com/asset/?id=9709150401" then
                    FullMoonStatus = "25%"
                elseif v585 == "http://www.roblox.com/asset/?id=9709149680" then
                    FullMoonStatus = "15%"
                else
                    FullMoonStatus = "0%"
                end
            end)
        end
    end)
    task.task.spawn(function()
        while task.task.wait(1.5) do
            pcall(function()
                if game.Workspace.Map:FindFirstChild("MysticIsland") then
                    MirageStatus = "✅"
                else
                    MirageStatus = "❌"
                end
            end)
        end
    end)
    task.spawn(function()
		-- upvalues: (ref) vu584
        pcall(function()
			-- upvalues: (ref) vu584
            while task.task.wait() do
                vu584:SetDesc("Mirage: " .. MirageStatus .. " | Full Moon: " .. FullMoonStatus)
            end
        end)
    end)
    v3.Sea:AddButton({
        ["Title"] = "Teleport to Highest Mountain",
        ["Description"] = "",
        ["Callback"] = function()
            TweenToHighestPoint()
        end
    })
    function TweenToHighestPoint()
        local v586 = getHighestPoint()
        if v586 then
            Tween2(v586.CFrame * CFrame.new(0, 211.88, 0))
        end
    end
    function getHighestPoint()
        if not game.Workspace.Map:FindFirstChild("MysticIsland") then
            return nil
        end
        local v587, v588, v589 = pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants())
        while true do
            local v590
            v589, v590 = v587(v588, v589)
            if v589 == nil then
                break
            end
            if v590:IsA("MeshPart") and v590.MeshId == "rbxassetid://83190276951914" then
                return v590
            end
        end
    end
end
v3.Sea:AddToggle("ToggleTpAdvanced", {
    ["Title"] = "Teleport to Advanced Fruit Dealer",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p591)
    _G.AutoTpAdvanced = p591
end)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoTpAdvanced then
            local v592 = game.ReplicatedStorage.NPCs:FindFirstChild("Advanced Fruit Dealer")
            if v592 and v592:IsA("Model") then
                local v593 = v592.PrimaryPart
                if v593 then
                    v593 = v592.PrimaryPart.Position
                end
                if v593 then
                    Tween2(CFrame.new(v593))
                end
            end
        end
    end
end)
v3.Sea:AddToggle("ToggleTweenGear", {
    ["Title"] = "Teleport to Gear",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p594)
    _G.TweenToGear = p594
end)
v4.ToggleTweenGear:SetValue(false)
task.spawn(function()
    pcall(function()
        while task.task.wait() do
            if _G.TweenToGear and game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                local v595, v596, v597 = pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren())
                while true do
                    local v598
                    v597, v598 = v595(v596, v597)
                    if v597 == nil then
                        break
                    end
                    if v598:IsA("MeshPart") and v598.Material == Enum.Material.Neon then
                        Tween2(v598.CFrame)
                    end
                end
            end
        end
    end)
end)
v3.Sea:AddToggle("Togglelockmoon", {
    ["Title"] = "Auto Look at Moon",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p599)
    _G.AutoLockMoon = p599
end)
v4.Togglelockmoon:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.AutoLockMoon then
                local v600 = game.Lighting:GetMoonDirection()
                local v601 = game.Workspace.CurrentCamera.CFrame.p + v600 * 100
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, v601)
            end
        end)
    end
end)
task.spawn(function()
    while task.task.wait() do
        pcall(function()
            if _G.AutoLockMoon then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
            end
        end)
    end
end)
v3.Sea:AddSection("Leviathan")
v3.Sea:AddButton({
    ["Title"] = "Buy Leviathan Spy / Chip",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2")
    end
})
local v1013 = v3.Sea:AddToggle("ToggleTPFrozenDimension", {
    ["Title"] = "Teleport to Frozen Dimension",
    ["Description"] = "",
    ["Default"] = false
})
v1013:OnChanged(function(p1014)
    _G.TweenToFrozenDimension = p1014
end)
v1013:SetValue(false)
task.spawn(function()
    local v1015 = nil
    while not v1015 do
        v1015 = game:GetService("Workspace").Map:FindFirstChild("FrozenDimension")
        task.wait()
    end
    while task.task.wait() do
        if _G.TweenToFrozenDimension and v1015 then
            Tween(v1015.CFrame)
        end
    end
end)
if Sea3 then
    local vu1016 = v3.Sea:AddParagraph({
        ["Title"] = "Leviathan Chip Status",
        ["Content"] = ""
    })
    task.spawn(function()
		-- upvalues: (ref) vu1016
        pcall(function()
			-- upvalues: (ref) vu1016
            while task.task.wait(3) do
                local v1017 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "1")
                if v1017 == 5 then
                    vu1016:SetDesc("Leviathan Is Out There")
                elseif v1017 == 0 then
                    vu1016:SetDesc("I Don\'t Know")
                else
                    vu1016:SetDesc("Mua: " .. tostring(v1017))
                end
            end
        end)
    end)
end
local v1018 = v3.Sea:AddSection("Draco")
v3.Sea:AddToggle("ToggleBlazeEmber", {
    ["Title"] = "Auto Blaze Ember",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1019)
    _G.AutoBlazeEmber = p1019
end)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoBlazeEmber then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/DragonDojoEmber"):FireServer()
            end)
        end
    end
end)
v3.Sea:AddToggle("ToggleReceiveQuest", {
    ["Title"] = "Get Blaze Ember Quest",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1020)
    _G.AutoReceiveQuest = p1020
    if _G.AutoReceiveQuest then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906))
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
        task.spawn(function()
            pcall(function()
                while task.task.wait() do
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack({
                        {
                            ["Context"] = "RequestQuest"
                        }
                    }))
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack({
                        {
                            ["Context"] = "Check"
                        }
                    }))
                end
            end)
        end)
    end
end)
local vu1021 = v3.Sea:AddParagraph({
    ["Title"] = "Blaze Ember Quest Status",
    ["Content"] = ""
})
task.spawn(function()
	-- upvalues: (ref) vu1021
    pcall(function()
		-- upvalues: (ref) vu1021
        while task.task.wait(2.5) do
            local v1022 = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack({
                {
                    ["Context"] = "Check"
                }
            }))
            if typeof(v1022) ~= "table" then
                print(v1022)
            else
                local v1023, v1024, v1025 = pairs(v1022)
                while true do
                    local v1026
                    v1025, v1026 = v1023(v1024, v1025)
                    if v1025 == nil then
                        break
                    end
                    if v1026 == "Defeat 3 Venomous Assailants on Hydra Island." then
                        vu1021:SetDesc("Defeat 3 Venomous Assailants on Hydra Island.")
                    elseif v1026 == "Defeat 3 Hydra Enforcers on Hydra Island." then
                        vu1021:SetDesc("Defeat 3 Hydra Enforcers on Hydra Island.")
                    elseif v1026 == "Destroy 10 trees on Hydra Island." then
                        vu1021:SetDesc("Destroy 10 trees on Hydra Island.")
                    end
                end
            end
        end
    end)
end)
v3.Sea:AddToggle("ToggleHydraTree", {
    ["Title"] = "Destroy Trees at Hydra Island",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1027)
    _G.AutoHydraTree = p1027
end)
local function vu1030(p1028)
    local v1029 = game:GetService("VirtualInputManager")
    v1029:SendKeyEvent(true, p1028, false, game)
    v1029:SendKeyEvent(false, p1028, false, game)
end
local function vu1042(p1031)
	-- upvalues: (ref) vu1030
    local v1032 = game.Players.LocalPlayer
    local v1033 = v1032.Backpack
    local v1034, v1035, v1036 = pairs(v1033:GetChildren())
    while true do
        local v1037
        v1036, v1037 = v1034(v1035, v1036)
        if v1036 == nil then
            break
        end
        if v1037:IsA("Tool") and v1037.ToolTip == p1031 then
            v1037.Parent = v1032.Character
            local v1038, v1039, v1040 = ipairs({
                "Z",
                "X",
                "C",
                "V",
                "F"
            })
            while true do
                local vu1041
                v1040, vu1041 = v1038(v1039, v1040)
                if v1040 == nil then
                    break
                end
                task.wait()
                pcall(function()
					-- upvalues: (ref) vu1030, (ref) vu1041
                    vu1030(vu1041)
                end)
            end
            v1037.Parent = v1033
            break
        end
    end
end
local vu1043 = {
    CFrame.new(5288.61962890625, 1005.4000244140625, 392.43011474609375),
    CFrame.new(5343.39453125, 1004.1998901367188, 361.0687561035156),
    CFrame.new(5235.78564453125, 1004.1998901367188, 431.4530944824219),
    CFrame.new(5321.30615234375, 1004.1998901367188, 440.8951416015625),
    CFrame.new(5258.96484375, 1004.1998901367188, 345.5052490234375)
}
task.spawn(function()
	-- upvalues: (ref) vu1043, (ref) vu1042
    while task.task.wait() do
        if _G.AutoHydraTree then
            AutoHaki()
            local v1044, v1045, v1046 = ipairs(vu1043)
            while true do
                local v1047
                v1046, v1047 = v1044(v1045, v1046)
                if v1046 == nil or not _G.AutoHydraTree then
                    break
                end
                Tween2(v1047)
                task.wait()
                local v1048 = game.Players.LocalPlayer.Character
                if v1048 and (v1048:FindFirstChild("HumanoidRootPart") and (v1048.HumanoidRootPart.Position - v1047.Position).Magnitude <= 1) then
                    vu1042("Melee")
                    vu1042("Sword")
                    vu1042("Gun")
                end
            end
        end
    end
end)
v1018:AddButton({
    ["Title"] = "Teleport to Dragon Dojo",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906))
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
    end
})
v1018:AddButton({
    ["Title"] = "Buy Volcano Magnet",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "CraftItem",
            "Craft",
            "Volcanic Magnet"
        }))
    end
})
v3.Sea:AddToggle("ToggleCollectFireFlowers", {
    ["Title"] = "Auto Collect Fire Flower",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1049)
    _G.AutoCollectFireFlowers = p1049
end)
task.spawn(function()
    while task.task.wait() do
        local v1050 = _G.AutoCollectFireFlowers and workspace:FindFirstChild("FireFlowers")
        if v1050 then
            local v1051, v1052, v1053 = pairs(v1050:GetChildren())
            while true do
                local v1054
                v1053, v1054 = v1051(v1052, v1053)
                if v1053 == nil then
                    break
                end
                if v1054:IsA("Model") and v1054.PrimaryPart then
                    local v1055 = v1054.PrimaryPart.Position
                    if (v1055 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1 then
                        Tween2(CFrame.new(v1055))
                    else
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        task.wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    end
                end
            end
        end
    end
end)
v3.Sea:AddToggle("ToggleWhiteBelt", {
    ["Title"] = "Auto Craft White Belt",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1056)
    _G.AutoLevel = p1056
    if p1056 then
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({
            {
                ["NPC"] = "Dojo Trainer",
                ["Command"] = "RequestQuest"
            }
        }))
        task.spawn(function()
            while _G.AutoLevel do
                game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({
                    {
                        ["NPC"] = "Dojo Trainer",
                        ["Command"] = "ClaimQuest"
                    }
                }))
                task.wait()
            end
        end)
    end
end)
v3.Sea:AddParagraph({
    ["Title"] = "Dragon Race",
    ["Content"] = ""
})
v3.Sea:AddToggle("ToggleTrialTeleport", {
    ["Title"] = "Teleport to Dragon Trial Door",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1057)
    _G.AutoTrialTeleport = p1057
end)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoTrialTeleport then
            local v1058 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
            if v1058 and v1058:IsA("Part") then
                Tween2(CFrame.new(v1058.Position))
            end
        end
    end
end)
v3.Sea:AddSection("Prehistoric Island")
local vu1059 = v3.Sea:AddParagraph({
    ["Title"] = "Volcano / Prehistoric Island Status",
    ["Content"] = ""
})
task.spawn(function()
	-- upvalues: (ref) vu1059
    pcall(function()
		-- upvalues: (ref) vu1059
        while task.task.wait(2) do
            if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
                vu1059:SetDesc("Prehistoric Island: ✅")
            else
                vu1059:SetDesc("Prehistoric Island: ❌")
            end
        end
    end)
end)
v3.Sea:AddToggle("ToggleTPVolcano", {
    ["Title"] = "Teleport to Prehistoric Island",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1060)
    _G.TweenToPrehistoric = p1060
end)
v4.ToggleTPVolcano:SetValue(false)
task.spawn(function()
    local v1061 = nil
    while not v1061 do
        v1061 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
        task.wait()
    end
    while task.task.wait() do
        local v1062 = _G.TweenToPrehistoric and game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
        if v1062 then
            local v1063 = v1062:FindFirstChild("Core")
            if v1063 then
                v1063 = v1062.Core:FindFirstChild("PrehistoricRelic")
            end
            if v1063 then
                v1063 = v1063:FindFirstChild("Skull")
            end
            if v1063 then
                Tween2(CFrame.new(v1063.Position))
                _G.TweenToPrehistoric = false
            end
        end
    end
end)
v3.Sea:AddToggle("ToggleDefendVolcano", {
    ["Title"] = "Safe Mode",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1064)
    _G.AutoDefendVolcano = p1064
end)
v3.Sea:AddToggle("ToggleMelee", {
    ["Title"] = "Use Melee",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1065)
    _G.UseMelee = p1065
end)
v3.Sea:AddToggle("ToggleSword", {
    ["Title"] = "Use Sword",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1066)
    _G.UseSword = p1066
end)
v3.Sea:AddToggle("ToggleGun", {
    ["Title"] = "Use Gun",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1067)
    _G.UseGun = p1067
end)
local function vu1069(p1068)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, p1068, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, p1068, false, game)
end
local function vu1085()
    local v1070 = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
    if v1070 and v1070:IsA("Model") then
        v1070:Destroy()
    end
    local v1071 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
    if v1071 then
        local v1072, v1073, v1074 = pairs(v1071:GetDescendants())
        while true do
            local v1075
            v1074, v1075 = v1072(v1073, v1074)
            if v1074 == nil then
                break
            end
            if v1075:IsA("Part") and v1075.Name:lower():find("lava") then
                v1075:Destroy()
            end
        end
    end
    local v1076 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
    if v1076 then
        local v1077, v1078, v1079 = pairs(v1076:GetDescendants())
        while true do
            local v1080
            v1079, v1080 = v1077(v1078, v1079)
            if v1079 == nil then
                break
            end
            if v1080:IsA("Model") then
                local v1081, v1082, v1083 = pairs(v1080:GetDescendants())
                while true do
                    local v1084
                    v1083, v1084 = v1081(v1082, v1083)
                    if v1083 == nil then
                        break
                    end
                    if v1084:IsA("MeshPart") and v1084.Name:lower():find("lava") then
                        v1084:Destroy()
                    end
                end
            end
        end
    end
end
local function vu1093()
    local v1086 = game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks
    local v1087, v1088, v1089 = pairs(v1086:GetChildren())
    while true do
        local v1090
        v1089, v1090 = v1087(v1088, v1089)
        if v1089 == nil then
            break
        end
        if v1090:IsA("Model") then
            local v1091 = v1090:FindFirstChild("volcanorock")
            if v1091 and v1091:IsA("MeshPart") then
                local v1092 = v1091.Color
                if v1092 == Color3.fromRGB(185, 53, 56) or v1092 == Color3.fromRGB(185, 53, 57) then
                    return v1091
                end
            end
        end
    end
    return nil
end
local function vu1105(p1094)
	-- upvalues: (ref) vu1069
    local v1095 = game.Players.LocalPlayer
    local v1096 = v1095.Backpack
    local v1097, v1098, v1099 = pairs(v1096:GetChildren())
    while true do
        local v1100
        v1099, v1100 = v1097(v1098, v1099)
        if v1099 == nil then
            break
        end
        if v1100:IsA("Tool") and v1100.ToolTip == p1094 then
            v1100.Parent = v1095.Character
            local v1101, v1102, v1103 = ipairs({
                "Z",
                "X",
                "C",
                "V",
                "F"
            })
            while true do
                local vu1104
                v1103, vu1104 = v1101(v1102, v1103)
                if v1103 == nil then
                    break
                end
                task.wait()
                pcall(function()
					-- upvalues: (ref) vu1069, (ref) vu1104
                    vu1069(vu1104)
                end)
            end
            v1100.Parent = v1096
            break
        end
    end
end
task.spawn(function()
	-- upvalues: (ref) vu1085, (ref) vu1093, (ref) vu1105
    while task.task.wait() do
        if _G.AutoDefendVolcano then
            AutoHaki()
            pcall(vu1085)
            local v1106 = vu1093()
            if v1106 then
                local v1107 = CFrame.new(v1106.Position + Vector3.new(0, 0, 0))
                Tween2(v1107)
                local v1108 = v1106.Color
                if v1108 == Color3.fromRGB(185, 53, 56) or v1108 == Color3.fromRGB(185, 53, 57) then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v1106.Position - Vector3.new(0, 0, 0)).Magnitude <= 1 then
                        if _G.UseMelee then
                            vu1105("Melee")
                        end
                        if _G.UseSword then
                            vu1105("Sword")
                        end
                        if _G.UseGun then
                            vu1105("Gun")
                        end
                    end
                    _G.TweenToPrehistoric = false
                else
                    vu1093()
                end
            else
                _G.TweenToPrehistoric = true
            end
        end
    end
end)
v3.Sea:AddToggle("ToggleKillAura", {
    ["Title"] = "Attack Golems (Kill Aura)",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1109)
    KillAura = p1109
end)
v4.ToggleKillAura:SetValue(false)
task.spawn(function()
    while task.task.wait() do
        if KillAura then
            pcall(function()
                local v1110, v1111, v1112 = pairs(game.Workspace.Enemies:GetDescendants())
                while true do
                    local v1113
                    v1112, v1113 = v1110(v1111, v1112)
                    if v1112 == nil then
                        break
                    end
                    if v1113:FindFirstChild("Humanoid") and (v1113:FindFirstChild("HumanoidRootPart") and v1113.Humanoid.Health > 0) then
                        repeat
                            task.task.wait()
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            v1113.Humanoid.Health = 0
                            v1113.HumanoidRootPart.CanCollide = false
                        until not KillAura or (not v1113.Parent or v1113.Humanoid.Health <= 0)
                    end
                end
            end)
        end
    end
end)
v3.Sea:AddToggle("ToggleCollectBone", {
    ["Title"] = "Collect Bones",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1114)
    _G.AutoCollectBone = p1114
end)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoCollectBone then
            local v1115, v1116, v1117 = pairs(workspace:GetDescendants())
            while true do
                local v1118
                v1117, v1118 = v1115(v1116, v1117)
                if v1117 == nil then
                    break
                end
                if v1118:IsA("BasePart") and v1118.Name == "DinoBone" then
                    Tween2(CFrame.new(v1118.Position))
                end
            end
        end
    end
end)
v3.Sea:AddToggle("ToggleCollectEgg", {
    ["Title"] = "Collect Dragon Eggs",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1119)
    _G.AutoCollectEgg = p1119
end)
task.spawn(function()
    while task.task.wait() do
        if _G.AutoCollectEgg then
            local v1120 = workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()
            if # v1120 > 0 then
                local v1121 = v1120[math.random(1, # v1120)]
                if v1121:IsA("Model") and v1121.PrimaryPart then
                    Tween2(v1121.PrimaryPart.CFrame)
