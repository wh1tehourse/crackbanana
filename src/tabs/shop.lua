-- Tab: Shop (Abilities, Swords, Fighting Styles, Stat Reset, Race Reroll)
v3.Shop:AddSection("Haki / Abilities")
v3.Shop:AddButton({
    ["Title"] = "Skyjump (Geppo)",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Haki / Abilities",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Flash Step (Soru)",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Observation Haki (Ken)",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
    end
})
v3.Shop:AddSection("Sword")
v3.Shop:AddButton({
    ["Title"] = "Katana / Dagger",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Katana",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Iron Mace",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Dual Katana",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Triple Katana",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Pipe",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Dual-Headed Blade",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Bisento",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Soul Cane",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Pole (2nd Form)",
    ["Description"] = "",
    ["Callback"] = function()
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
    end
})
v3.Shop:AddSection("Fighting Styles")
v3.Shop:AddButton({
    ["Title"] = "Black leg",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Electro",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Fishman Karate",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Dragon Claw",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Superhuman",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Death Step",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Sharkman Karate",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Electric Claw",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Dragon Talon",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Godhuman",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Sanguine Art",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    end
})
v3.Shop:AddSection("Other")
v3.Shop:AddButton({
    ["Title"] = "Reset Stats",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Reroll Race",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
    end
})
v3.Shop:AddButton({
    ["Title"] = "Change to Ghoul Race",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "Ectoplasm",
            "Change",
            4
        }))
    end
})
v3.Shop:AddButton({
    ["Title"] = "Change to Cyborg Race",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "CyborgTrainer",
            "Buy"
        }))
    end
})
v3.Shop:AddButton({
    ["Title"] = "Change to Dragon Race",
    ["Description"] = "Sea 3 Only",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906))
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
        local v977 = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)
        local v978 = game.Players.LocalPlayer
        local v979 = v978.Character
        if not v979 then
            v979 = v978.CharacterAdded:Wait()
        end
        repeat
            task.wait()
        until (v979.HumanoidRootPart.Position - v977).Magnitude < 1
        local v980 = {
            {
                ["NPC"] = "Dragon Wizard",
                ["Command"] = "DragonRace"
            }
        }
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v980))
    end
})
