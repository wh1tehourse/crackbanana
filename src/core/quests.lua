-- Level & Quest Database
end
function CheckLevel()
    local v7 = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Sea1 then
        if v7 == 1 or (v7 <= 9 or SelectMonster == "Bandit") then
            Ms = "Bandit"
            NameQuest = "BanditQuest1"
            QuestLv = 1
            NameMon = "Bandit"
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
        elseif v7 == 10 or (v7 <= 14 or SelectMonster == "Monkey") then
            Ms = "Monkey"
            NameQuest = "JungleQuest"
            QuestLv = 1
            NameMon = "Monkey"
            CFrameQ = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(- 1448.1446533203, 50.851993560791, 63.60718536377)
        elseif v7 == 15 or (v7 <= 29 or SelectMonster == "Gorilla") then
            Ms = "Gorilla"
            NameQuest = "JungleQuest"
            QuestLv = 2
            NameMon = "Gorilla"
            CFrameQ = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(- 1142.6488037109, 40.462348937988, - 515.39227294922)
        elseif v7 == 30 or (v7 <= 39 or SelectMonster == "Pirate") then
            Ms = "Pirate"
            NameQuest = "BuggyQuest1"
            QuestLv = 1
            NameMon = "Pirate"
            CFrameQ = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(- 1201.0881347656, 40.628940582275, 3857.5966796875)
        elseif v7 == 40 or (v7 <= 59 or SelectMonster == "Brute") then
            Ms = "Brute"
            NameQuest = "BuggyQuest1"
            QuestLv = 2
            NameMon = "Brute"
            CFrameQ = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(- 1387.5324707031, 24.592035293579, 4100.9575195313)
        elseif v7 == 60 or (v7 <= 74 or SelectMonster == "Desert Bandit") then
            Ms = "Desert Bandit"
            NameQuest = "DesertQuest"
            QuestLv = 1
            NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
        elseif v7 == 75 or (v7 <= 89 or SelectMonster == "Desert Officer") then
            Ms = "Desert Officer"
            NameQuest = "DesertQuest"
            QuestLv = 2
            NameMon = "Desert Officer"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
        elseif v7 == 90 or (v7 <= 99 or SelectMonster == "Snow Bandit") then
            Ms = "Snow Bandit"
            NameQuest = "SnowQuest"
            QuestLv = 1
            NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, - 1328.2418212891)
        elseif v7 == 100 or (v7 <= 119 or SelectMonster == "Snowman") then
            Ms = "Snowman"
            NameQuest = "SnowQuest"
            QuestLv = 2
            NameMon = "Snowman"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, - 1488.0262451172)
        elseif v7 == 120 or (v7 <= 149 or SelectMonster == "Chief Petty Officer") then
            Ms = "Chief Petty Officer"
            NameQuest = "MarineQuest2"
            QuestLv = 1
            NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(- 5035.49609375, 28.677835464478, 4324.1840820313)
            CFrameMon = CFrame.new(- 4931.1552734375, 65.793113708496, 4121.8393554688)
        elseif v7 == 150 or (v7 <= 174 or SelectMonster == "Sky Bandit") then
            Ms = "Sky Bandit"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(- 4842.1372070313, 717.69543457031, - 2623.0483398438)
            CFrameMon = CFrame.new(- 4955.6411132813, 365.46365356445, - 2908.1865234375)
        elseif v7 == 175 or (v7 <= 189 or SelectMonster == "Dark Master") then
            Ms = "Dark Master"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(- 4842.1372070313, 717.69543457031, - 2623.0483398438)
            CFrameMon = CFrame.new(- 5148.1650390625, 439.04571533203, - 2332.9611816406)
        elseif v7 == 190 or (v7 <= 209 or SelectMonster == "Prisoner") then
            Ms = "Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 1
            NameMon = "Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, - 0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, - 0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
        elseif v7 == 210 or (v7 <= 249 or SelectMonster == "Dangerous Prisoner") then
            Ms = "Dangerous Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 2
            NameMon = "Dangerous Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, - 0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, - 0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
        elseif v7 == 250 or (v7 <= 274 or SelectMonster == "Toga Warrior") then
            Ms = "Toga Warrior"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(- 1577.7890625, 7.4151420593262, - 2984.4838867188)
            CFrameMon = CFrame.new(- 1872.5166015625, 49.080215454102, - 2913.810546875)
        elseif v7 == 275 or (v7 <= 299 or SelectMonster == "Gladiator") then
            Ms = "Gladiator"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(- 1577.7890625, 7.4151420593262, - 2984.4838867188)
            CFrameMon = CFrame.new(- 1521.3740234375, 81.203170776367, - 3066.3139648438)
        elseif v7 == 300 or (v7 <= 324 or SelectMonster == "Military Soldier") then
            Ms = "Military Soldier"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(- 5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(- 5369.0004882813, 61.24352645874, 8556.4921875)
        elseif v7 == 325 or (v7 <= 374 or SelectMonster == "Military Spy") then
            Ms = "Military Spy"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(- 5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(- 5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, - 0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
        elseif v7 == 375 or (v7 <= 399 or SelectMonster == "Fishman Warrior") then
            Ms = "Fishman Warrior"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif v7 == 400 or (v7 <= 449 or SelectMonster == "Fishman Commando") then
            Ms = "Fishman Commando"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif v7 == 10 or (v7 <= 474 or SelectMonster == "God\'s Guard") then
            Ms = "God\'s Guard"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God\'s Guard"
            CFrameQ = CFrame.new(- 4721.8603515625, 845.30297851563, - 1953.8489990234)
            CFrameMon = CFrame.new(- 4628.0498046875, 866.92877197266, - 1931.2352294922)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688))
            end
        elseif v7 == 475 or (v7 <= 524 or SelectMonster == "Shanda") then
            Ms = "Shanda"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shanda"
            CFrameQ = CFrame.new(- 7863.1596679688, 5545.5190429688, - 378.42266845703)
            CFrameMon = CFrame.new(- 7685.1474609375, 5601.0751953125, - 441.38876342773)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047))
            end
        elseif v7 == 525 or (v7 <= 549 or SelectMonster == "Royal Squad") then
            Ms = "Royal Squad"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125)
            CFrameMon = CFrame.new(- 7654.2514648438, 5637.1079101563, - 1407.7550048828)
        elseif v7 == 550 or (v7 <= 624 or SelectMonster == "Royal Soldier") then
            Ms = "Royal Soldier"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125)
            CFrameMon = CFrame.new(- 7760.4106445313, 5679.9077148438, - 1884.8112792969)
        elseif v7 == 625 or (v7 <= 649 or SelectMonster == "Galley Pirate") then
            Ms = "Galley Pirate"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
        elseif v7 >= 650 or SelectMonster == "Galley Captain" then
            Ms = "Galley Captain"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    end
    if Sea2 then
        if v7 == 700 or (v7 <= 724 or SelectMonster == "Raider") then
            Ms = "Raider"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(- 427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
        elseif v7 == 725 or (v7 <= 774 or SelectMonster == "Mercenary") then
            Ms = "Mercenary"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(- 427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(- 864.85009765625, 122.47104644775, 1453.1505126953)
        elseif v7 == 775 or (v7 <= 799 or SelectMonster == "Swan Pirate") then
            Ms = "Swan Pirate"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
        elseif v7 == 800 or (v7 <= 874 or SelectMonster == "Factory Staff") then
            Ms = "Factory Staff"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
        elseif v7 == 875 or (v7 <= 899 or SelectMonster == "Marine Lieutenan") then
            Ms = "Marine Lieutenant"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(- 2440.9934082031, 73.04190826416, - 3217.7082519531)
            CFrameMon = CFrame.new(- 2489.2622070313, 84.613594055176, - 3151.8830566406)
        elseif v7 == 900 or (v7 <= 949 or SelectMonster == "Marine Captain") then
            Ms = "Marine Captain"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(- 2440.9934082031, 73.04190826416, - 3217.7082519531)
            CFrameMon = CFrame.new(- 2335.2026367188, 79.786659240723, - 3245.8674316406)
        elseif v7 == 950 or (v7 <= 974 or SelectMonster == "Zombie") then
            Ms = "Zombie"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(- 5494.3413085938, 48.505931854248, - 794.59094238281)
            CFrameMon = CFrame.new(- 5536.4970703125, 101.08577728271, - 835.59075927734)
        elseif v7 == 975 or (v7 <= 999 or SelectMonster == "Vampire") then
            Ms = "Vampire"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(- 5494.3413085938, 48.505931854248, - 794.59094238281)
            CFrameMon = CFrame.new(- 5806.1098632813, 16.722528457642, - 1164.4384765625)
        elseif v7 == 1000 or (v7 <= 1049 or SelectMonster == "Snow Trooper") then
            Ms = "Snow Trooper"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, - 5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, - 5484.9165039063)
        elseif v7 == 1050 or (v7 <= 1099 or SelectMonster == "Winter Warrior") then
            Ms = "Winter Warrior"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, - 5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, - 5174.130859375)
        elseif v7 == 1100 or (v7 <= 1124 or SelectMonster == "Lab Subordinate") then
            Ms = "Lab Subordinate"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(- 6061.841796875, 15.926671981812, - 4902.0385742188)
            CFrameMon = CFrame.new(- 5720.5576171875, 63.309471130371, - 4784.6103515625)
        elseif v7 == 1125 or (v7 <= 1174 or SelectMonster == "Horned Warrior") then
            Ms = "Horned Warrior"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(- 6061.841796875, 15.926671981812, - 4902.0385742188)
            CFrameMon = CFrame.new(- 6292.751953125, 91.181983947754, - 5502.6499023438)
        elseif v7 == 1175 or (v7 <= 1199 or SelectMonster == "Magma Ninja") then
            Ms = "Magma Ninja"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813)
            CFrameMon = CFrame.new(- 5461.8388671875, 130.36347961426, - 5836.4702148438)
        elseif v7 == 1200 or (v7 <= 1249 or SelectMonster == "Lava Pirate") then
            Ms = "Lava Pirate"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813)
            CFrameMon = CFrame.new(- 5251.1889648438, 55.164535522461, - 4774.4096679688)
        elseif v7 == 1250 or (v7 <= 1274 or SelectMonster == "Ship Deckhand") then
            Ms = "Ship Deckhand"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif v7 == 1275 or (v7 <= 1299 or SelectMonster == "Ship Engineer") then
            Ms = "Ship Engineer"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif v7 == 1300 or (v7 <= 1324 or SelectMonster == "Ship Steward") then
            Ms = "Ship Steward"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif v7 == 1325 or (v7 <= 1349 or SelectMonster == "Ship Officer") then
            Ms = "Ship Officer"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif v7 == 1350 or (v7 <= 1374 or SelectMonster == "Arctic Warrior") then
            Ms = "Arctic Warrior"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, - 6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, - 6472.7568359375)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422))
            end
        elseif v7 == 1375 or (v7 <= 1424 or SelectMonster == "Snow Lurker") then
            Ms = "Snow Lurker"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, - 6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, - 6618.3481445313)
        elseif v7 == 1425 or (v7 <= 1449 or SelectMonster == "Sea Soldier") then
            Ms = "Sea Soldier"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(- 3054.5827636719, 236.87213134766, - 10147.790039063)
            CFrameMon = CFrame.new(- 3185.0153808594, 58.789089202881, - 9663.6064453125)
        elseif v7 >= 1450 or SelectMonster == "Water Fighter" then
            Ms = "Water Fighter"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(- 3054.5827636719, 236.87213134766, - 10147.790039063)
            CFrameMon = CFrame.new(- 3262.9301757813, 298.69036865234, - 10552.529296875)
        end
    end
    if Sea3 then
        if v7 == 1500 or (v7 <= 1524 or SelectMonster == "Pirate Millionaire") then
            Ms = "Pirate Millionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 1
            NameMon = "Pirate Millionaire"
            CFrameQ = CFrame.new(- 450.1046447753906, 107.68145751953125, 5950.72607421875)
            CFrameMon = CFrame.new(- 193.99227905273438, 56.12502670288086, 5755.7880859375)
        elseif v7 == 1525 or (v7 <= 1574 or SelectMonster == "Pistol Billionaire") then
            Ms = "Pistol Billionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 2
            NameMon = "Pistol Billionaire"
            CFrameQ = CFrame.new(- 450.1046447753906, 107.68145751953125, 5950.72607421875)
            CFrameMon = CFrame.new(- 188.14462280273438, 84.49613189697266, 6337.0419921875)
        elseif v7 == 1575 or (v7 <= 1599 or SelectMonster == "Dragon Crew Warrior") then
            Ms = "Dragon Crew Warrior"
            NameQuest = "DragonCrewQuest"
            QuestLv = 1
            NameMon = "Dragon Crew Warrior"
            CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, - 711.0979614257812)
            CFrameMon = CFrame.new(6615.2333984375, 50.847679138183594, - 978.93408203125)
        elseif v7 == 1600 or (v7 <= 1624 or SelectMonster == "Dragon Crew Archer") then
            Ms = "Dragon Crew Archer"
            NameQuest = "DragonCrewQuest"
            QuestLv = 2
            NameMon = "Dragon Crew Archer"
            CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, - 711.0979614257812)
            CFrameMon = CFrame.new(6818.58935546875, 483.718994140625, 512.726806640625)
        elseif v7 == 1625 or (v7 <= 1649 or SelectMonster == "Hydra Enforcer") then
            Ms = "Hydra Enforcer"
            NameQuest = "VenomCrewQuest"
            QuestLv = 1
            NameMon = "Hydra Enforcer"
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(4547.115234375, 1001.60205078125, 334.1954650878906)
        elseif v7 == 1650 or (v7 <= 1699 or SelectMonster == "Venomous Assailant") then
            Ms = "Venomous Assailant"
            NameQuest = "VenomCrewQuest"
            QuestLv = 2
            NameMon = "Venomous Assailant"
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(4637.88525390625, 1077.85595703125, 882.4183959960938)
        elseif v7 == 1700 or (v7 <= 1724 or SelectMonster == "Marine Commodore") then
            Ms = "Marine Commodore"
            NameQuest = "MarineTreeIsland"
            QuestLv = 1
            NameMon = "Marine Commodore"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, - 6740.0551757813)
            CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, - 7109.5043945313)
        elseif v7 == 1725 or (v7 <= 1774 or SelectMonster == "Marine Rear Admiral") then
            Ms = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            QuestLv = 2
            NameMon = "Marine Rear Admiral"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, - 6740.0551757813)
            CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, - 7048.6342773438)
        elseif v7 == 1775 or (v7 <= 1799 or SelectMonster == "Fishman Raider") then
            Ms = "Fishman Raider"
            NameQuest = "DeepForestIsland3"
            QuestLv = 1
            NameMon = "Fishman Raider"
            CFrameQ = CFrame.new(- 10582.759765625, 331.78845214844, - 8757.666015625)
            CFrameMon = CFrame.new(- 10553.268554688, 521.38439941406, - 8176.9458007813)
        elseif v7 == 1800 or (v7 <= 1824 or SelectMonster == "Fishman Captain") then
            Ms = "Fishman Captain"
            NameQuest = "DeepForestIsland3"
            QuestLv = 2
            NameMon = "Fishman Captain"
            CFrameQ = CFrame.new(- 10583.099609375, 331.78845214844, - 8759.4638671875)
            CFrameMon = CFrame.new(- 10789.401367188, 427.18637084961, - 9131.4423828125)
        elseif v7 == 1825 or (v7 <= 1849 or SelectMonster == "Forest Pirate") then
            Ms = "Forest Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 1
            NameMon = "Forest Pirate"
            CFrameQ = CFrame.new(- 13232.662109375, 332.40396118164, - 7626.4819335938)
            CFrameMon = CFrame.new(- 13489.397460938, 400.30349731445, - 7770.251953125)
        elseif v7 == 1850 or (v7 <= 1899 or SelectMonster == "Mythological Pirate") then
            Ms = "Mythological Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 2
            NameMon = "Mythological Pirate"
            CFrameQ = CFrame.new(- 13232.662109375, 332.40396118164, - 7626.4819335938)
            CFrameMon = CFrame.new(- 13508.616210938, 582.46228027344, - 6985.3037109375)
        elseif v7 == 1900 or (v7 <= 1924 or SelectMonster == "Jungle Pirate") then
            Ms = "Jungle Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 1
            NameMon = "Jungle Pirate"
            CFrameQ = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375)
            CFrameMon = CFrame.new(- 12267.103515625, 459.75262451172, - 10277.200195313)
        elseif v7 == 1925 or (v7 <= 1974 or SelectMonster == "Musketeer Pirate") then
            Ms = "Musketeer Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 2
            NameMon = "Musketeer Pirate"
            CFrameQ = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375)
            CFrameMon = CFrame.new(- 13291.5078125, 520.47338867188, - 9904.638671875)
        elseif v7 == 1975 or (v7 <= 1999 or SelectMonster == "Reborn Skeleton") then
            Ms = "Reborn Skeleton"
            NameQuest = "HauntedQuest1"
            QuestLv = 1
            NameMon = "Reborn Skeleton"
            CFrameQ = CFrame.new(- 9480.80762, 142.130661, 5566.37305, - 0.00655503059, 4.5295423e-8, - 0.999978542, 2.0492047e-8, 1, 4.5162068e-8, 0.999978542, - 2.0195568e-8, - 0.00655503059)
            CFrameMon = CFrame.new(- 8761.77148, 183.431747, 6168.33301, 0.978073597, - 0.000013950732, - 0.208259016, - 1.0807393e-6, 1, - 0.00007206303, 0.208259016, 0.00007070804, 0.978073597)
        elseif v7 == 2000 or (v7 <= 2024 or SelectMonster == "Living Zombie") then
            Ms = "Living Zombie"
            NameQuest = "HauntedQuest1"
            QuestLv = 2
            NameMon = "Living Zombie"
            CFrameQ = CFrame.new(- 9480.80762, 142.130661, 5566.37305, - 0.00655503059, 4.5295423e-8, - 0.999978542, 2.0492047e-8, 1, 4.5162068e-8, 0.999978542, - 2.0195568e-8, - 0.00655503059)
            CFrameMon = CFrame.new(- 10103.7529, 238.565979, 6179.75977, 0.999474227, 2.7754714e-8, 0.0324240364, - 2.5800633e-8, 1, - 6.068485e-8, - 0.0324240364, 5.981639e-8, 0.999474227)
        elseif v7 == 2025 or (v7 <= 2049 or SelectMonster == "Demonic Soul") then
            Ms = "Demonic Soul"
            NameQuest = "HauntedQuest2"
            QuestLv = 1
            NameMon = "Demonic Soul"
            CFrameQ = CFrame.new(- 9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(- 9712.03125, 204.69589233398, 6193.322265625)
        elseif v7 == 2050 or (v7 <= 2074 or SelectMonster == "Posessed Mummy") then
            Ms = "Posessed Mummy"
            NameQuest = "HauntedQuest2"
            QuestLv = 2
            NameMon = "Posessed Mummy"
            CFrameQ = CFrame.new(- 9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(- 9545.7763671875, 69.619895935059, 6339.5615234375)
        elseif v7 == 2075 or (v7 <= 2099 or SelectMonster == "Peanut Scout") then
            Ms = "Peanut Scout"
            NameQuest = "NutsIslandQuest"
            QuestLv = 1
            NameMon = "Peanut Scout"
            CFrameQ = CFrame.new(- 2105.53198, 37.2495995, - 10195.5088, - 0.766061664, 0, - 0.642767608, 0, 1, 0, 0.642767608, 0, - 0.766061664)
            CFrameMon = CFrame.new(- 2150.587890625, 122.49767303467, - 10358.994140625)
        elseif v7 == 2100 or (v7 <= 2124 or SelectMonster == "Peanut President") then
            Ms = "Peanut President"
            NameQuest = "NutsIslandQuest"
            QuestLv = 2
            NameMon = "Peanut President"
            CFrameQ = CFrame.new(- 2105.53198, 37.2495995, - 10195.5088, - 0.766061664, 0, - 0.642767608, 0, 1, 0, 0.642767608, 0, - 0.766061664)
            CFrameMon = CFrame.new(- 2150.587890625, 122.49767303467, - 10358.994140625)
        elseif v7 == 2125 or (v7 <= 2149 or SelectMonster == "Ice Cream Chef") then
            Ms = "Ice Cream Chef"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 1
            NameMon = "Ice Cream Chef"
            CFrameQ = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664)
            CFrameMon = CFrame.new(- 789.941528, 209.382889, - 11009.9805, - 0.0703101531, "-0", - 0.997525156, "-0", 1.00000012, "-0", 0.997525275, 0, - 0.0703101456)
        elseif v7 == 2150 or (v7 <= 2199 or SelectMonster == "Ice Cream Commander") then
            Ms = "Ice Cream Commander"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 2
            NameMon = "Ice Cream Commander"
            CFrameQ = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664)
            CFrameMon = CFrame.new(- 789.941528, 209.382889, - 11009.9805, - 0.0703101531, "-0", - 0.997525156, "-0", 1.00000012, "-0", 0.997525275, 0, - 0.0703101456)
        elseif v7 == 2200 or (v7 <= 2224 or SelectMonster == "Cookie Crafter") then
            Ms = "Cookie Crafter"
            NameQuest = "CakeQuest1"
            QuestLv = 1
            NameMon = "Cookie Crafter"
            CFrameQ = CFrame.new(- 2022.29858, 36.9275894, - 12030.9766, - 0.961273909, 0, - 0.275594592, 0, 1, 0, 0.275594592, 0, - 0.961273909)
            CFrameMon = CFrame.new(- 2321.71216, 36.699482, - 12216.7871, - 0.780074954, 0, 0.625686109, 0, 1, 0, - 0.625686109, 0, - 0.780074954)
        elseif v7 == 2225 or (v7 <= 2249 or SelectMonster == "Cake Guard") then
            Ms = "Cake Guard"
            NameQuest = "CakeQuest1"
            QuestLv = 2
            NameMon = "Cake Guard"
            CFrameQ = CFrame.new(- 2022.29858, 36.9275894, - 12030.9766, - 0.961273909, 0, - 0.275594592, 0, 1, 0, 0.275594592, 0, - 0.961273909)
            CFrameMon = CFrame.new(- 1418.11011, 36.6718941, - 12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, - 0.997700036, 0, 0.0677844882)
        elseif v7 == 2250 or (v7 <= 2274 or SelectMonster == "Baking Staff") then
            Ms = "Baking Staff"
            NameQuest = "CakeQuest2"
            QuestLv = 1
            NameMon = "Baking Staff"
            CFrameQ = CFrame.new(- 1928.31763, 37.7296638, - 12840.626, 0.951068401, "-0", - 0.308980465, 0, 1, "-0", 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(- 1980.43848, 36.6716766, - 12983.8418, - 0.254443765, 0, - 0.967087567, 0, 1, 0, 0.967087567, 0, - 0.254443765)
        elseif v7 == 2275 or (v7 <= 2299 or SelectMonster == "Head Baker") then
            Ms = "Head Baker"
            NameQuest = "CakeQuest2"
            QuestLv = 2
            NameMon = "Head Baker"
            CFrameQ = CFrame.new(- 1928.31763, 37.7296638, - 12840.626, 0.951068401, "-0", - 0.308980465, 0, 1, "-0", 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(- 2251.5791, 52.2714615, - 13033.3965, - 0.991971016, 0, - 0.126466095, 0, 1, 0, 0.126466095, 0, - 0.991971016)
        elseif v7 == 2300 or (v7 <= 2324 or SelectMonster == "Cocoa Warrior") then
            Ms = "Cocoa Warrior"
            NameQuest = "ChocQuest1"
            QuestLv = 1
            NameMon = "Cocoa Warrior"
            CFrameQ = CFrame.new(231.75, 23.9003029, - 12200.292, - 1, 0, 0, 0, 1, 0, 0, 0, - 1)
            CFrameMon = CFrame.new(167.978516, 26.2254658, - 12238.874, - 0.939700961, 0, 0.341998369, 0, 1, 0, - 0.341998369, 0, - 0.939700961)
        elseif v7 == 2325 or (v7 <= 2349 or SelectMonster == "Chocolate Bar Battler") then
            Ms = "Chocolate Bar Battler"
            NameQuest = "ChocQuest1"
            QuestLv = 2
            NameMon = "Chocolate Bar Battler"
            CFrameQ = CFrame.new(231.75, 23.9003029, - 12200.292, - 1, 0, 0, 0, 1, 0, 0, 0, - 1)
            CFrameMon = CFrame.new(701.312073, 25.5824986, - 12708.2148, - 0.342042685, 0, - 0.939684391, 0, 1, 0, 0.939684391, 0, - 0.342042685)
        elseif v7 == 2350 or (v7 <= 2374 or SelectMonster == "Sweet Thief") then
            Ms = "Sweet Thief"
            NameQuest = "ChocQuest2"
            QuestLv = 1
            NameMon = "Sweet Thief"
            CFrameQ = CFrame.new(151.198242, 23.8907146, - 12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, - 0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(- 140.258301, 25.5824986, - 12652.3115, 0.173624337, "-0", - 0.984811902, 0, 1, "-0", 0.984811902, 0, 0.173624337)
        elseif v7 == 2375 or (v7 <= 2400 or SelectMonster == "Candy Rebel") then
            Ms = "Candy Rebel"
            NameQuest = "ChocQuest2"
            QuestLv = 2
            NameMon = "Candy Rebel"
            CFrameQ = CFrame.new(151.198242, 23.8907146, - 12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, - 0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(47.9231453, 25.5824986, - 13029.2402, - 0.819156051, 0, - 0.573571265, 0, 1, 0, 0.573571265, 0, - 0.819156051)
        elseif v7 == 2400 or (v7 <= 2424 or SelectMonster == "Candy Pirate") then
            Ms = "Candy Pirate"
            NameQuest = "CandyQuest1"
            QuestLv = 1
            NameMon = "Candy Pirate"
            CFrameQ = CFrame.new(- 1149.328, 13.5759039, - 14445.6143, - 0.156446099, 0, - 0.987686574, 0, 1, 0, 0.987686574, 0, - 0.156446099)
            CFrameMon = CFrame.new(- 1437.56348, 17.1481285, - 14385.6934, 0.173624337, "-0", - 0.984811902, 0, 1, "-0", 0.984811902, 0, 0.173624337)
        elseif v7 == 2425 or (v7 <= 2449 or SelectMonster == "Snow Demon") then
            Ms = "Snow Demon"
            NameQuest = "CandyQuest1"
            QuestLv = 2
            NameMon = "Snow Demon"
            CFrameQ = CFrame.new(- 1149.328, 13.5759039, - 14445.6143, - 0.156446099, 0, - 0.987686574, 0, 1, 0, 0.987686574, 0, - 0.156446099)
            CFrameMon = CFrame.new(- 916.222656, 17.1481285, - 14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, - 0.500031412, 0, 0.866007268)
        elseif v7 == 2450 or (v7 <= 2474 or SelectMonster == "Isle Outlaw") then
            Ms = "Isle Outlaw"
            NameQuest = "TikiQuest1"
            QuestLv = 1
            NameMon = "Isle Outlaw"
            CFrameQ = CFrame.new(- 16549.890625, 55.68635559082031, - 179.91360473632812)
            CFrameMon = CFrame.new(- 16162.8193359375, 11.6863374710083, - 96.45481872558594)
        elseif v7 == 2475 or (v7 <= 2499 or SelectMonster == "Island Boy") then
            Ms = "Island Boy"
            NameQuest = "TikiQuest1"
            QuestLv = 2
            NameMon = "Island Boy"
            CFrameQ = CFrame.new(- 16549.890625, 55.68635559082031, - 179.91360473632812)
            CFrameMon = CFrame.new(- 16357.3125, 20.632822036743164, 1005.64892578125)
        elseif v7 == 2500 or (v7 <= 2524 or SelectMonster == "Sun-kissed Warrior") then
            Ms = "Sun-kissed Warrior"
            NameQuest = "TikiQuest2"
            QuestLv = 1
            NameMon = "Sun-kissed Warrior"
            CFrameQ = CFrame.new(- 16541.021484375, 54.77081298828125, 1051.461181640625)
            CFrameMon = CFrame.new(- 16357.3125, 20.632822036743164, 1005.64892578125)
        elseif v7 == 2525 or (v7 <= 2549 or SelectMonster == "Isle Champion") then
            Ms = "Isle Champion"
            NameQuest = "TikiQuest2"
            QuestLv = 2
            NameMon = "Isle Champion"
            CFrameQ = CFrame.new(- 16541.021484375, 54.77081298828125, 1051.461181640625)
            CFrameMon = CFrame.new(- 16848.94140625, 21.68633460998535, 1041.4490966796875)
        elseif v7 == 2550 or (v7 <= 2574 or SelectMonster == "Serpent Hunter") then
            Ms = "Serpent Hunter"
            NameQuest = "TikiQuest3"
            QuestLv = 1
            NameMon = "Serpent Hunter"
            CFrameQ = CFrame.new(- 16665.19140625, 104.59640502929688, 1579.6943359375)
            CFrameMon = CFrame.new(- 16621.4140625, 121.40631103515625, 1290.6881103515625)
        elseif v7 == 2575 or (v7 <= 2599 or SelectMonster == "Skull Slayer") then
            Ms = "Skull Slayer"
            NameQuest = "TikiQuest3"
            QuestLv = 2
            NameMon = "Skull Slayer"
            CFrameQ = CFrame.new(-16665.19140625, 104.59640502929688, 1579.6943359375)
            CFrameMon = CFrame.new(-16811.5703125, 84.625244140625, 1542.235107421875)
        -- Submerged Island (Level 2600 - 2800)
        elseif v7 == 2600 or (v7 <= 2624 or SelectMonster == "Reef Bandit") then
            Ms = "Reef Bandit"
            NameQuest = "SubmergedQuest1"
            QuestLv = 1
            NameMon = "Reef Bandit"
            CFrameQ = CFrame.new(10882.3, -2086.3, 10034.2)
            CFrameMon = CFrame.new(10736.6, -2087.8, 9338.5)
        elseif v7 == 2625 or (v7 <= 2649 or SelectMonster == "Coral Pirate") then
            Ms = "Coral Pirate"
            NameQuest = "SubmergedQuest1"
            QuestLv = 2
            NameMon = "Coral Pirate"
            CFrameQ = CFrame.new(10882.3, -2086.3, 10034.2)
            CFrameMon = CFrame.new(10736.6, -2087.8, 9338.5)
        elseif v7 == 2650 or (v7 <= 2674 or SelectMonster == "Sea Chanter") then
            Ms = "Sea Chanter"
            NameQuest = "SubmergedQuest2"
            QuestLv = 1
            NameMon = "Sea Chanter"
            CFrameQ = CFrame.new(10882.3, -2086.3, 10034.2)
            CFrameMon = CFrame.new(10621.0, -2087.8, 10102.0)
        elseif v7 == 2675 or (v7 <= 2699 or SelectMonster == "High Disciple") then
            Ms = "High Disciple"
            NameQuest = "SubmergedQuest2"
            QuestLv = 2
            NameMon = "High Disciple"
            CFrameQ = CFrame.new(9636.5, -1992.2, 9609.5)
            CFrameMon = CFrame.new(9828.1, -1940.9, 9693.1)
        elseif v7 >= 2700 or SelectMonster == "Grand Devotee" then
            Ms = "Grand Devotee"
            NameQuest = "SubmergedQuest3"
            QuestLv = 1
            NameMon = "Grand Devotee"
            CFrameQ = CFrame.new(9636.5, -1992.2, 9609.5)
            CFrameMon = CFrame.new(9557.6, -1928.0, 9859.2)
        end
    end
end
if Sea1 then
    tableMon = {
        "Bandit",
        "Monkey",
        "Gorilla",
        "Pirate",
        "Brute",
        "Desert Bandit",
        "Desert Officer",
        "Snow Bandit",
        "Snowman",
        "Chief Petty Officer",
        "Sky Bandit",
        "Dark Master",
        "Prisoner",
        "Dangerous Prisoner",
        "Toga Warrior",
        "Gladiator",
        "Military Soldier",
        "Military Spy",
        "Fishman Warrior",
        "Fishman Commando",
        "God\'s Guard",
        "Shanda",
        "Royal Squad",
        "Royal Soldier",
        "Galley Pirate",
        "Galley Captain"
    }
elseif Sea2 then
    tableMon = {
        "Raider",
        "Mercenary",
        "Swan Pirate",
        "Factory Staff",
        "Marine Lieutenant",
        "Marine Captain",
        "Zombie",
        "Vampire",
        "Snow Trooper",
        "Winter Warrior",
        "Lab Subordinate",
        "Horned Warrior",
        "Magma Ninja",
        "Lava Pirate",
        "Ship Deckhand",
        "Ship Engineer",
        "Ship Steward",
        "Ship Officer",
        "Arctic Warrior",
        "Snow Lurker",
        "Sea Soldier",
        "Water Fighter"
    }
elseif Sea3 then
    tableMon = {
        "Pirate Millionaire",
        "Dragon Crew Warrior",
        "Dragon Crew Archer",
        "Hydra Enforcer",
        "Venomous Assailant",
        "Marine Commodore",
        "Marine Rear Admiral",
        "Fishman Raider",
        "Fishman Captain",
        "Forest Pirate",
        "Mythological Pirate",
        "Jungle Pirate",
        "Musketeer Pirate",
        "Reborn Skeleton",
        "Living Zombie",
        "Demonic Soul",
        "Posessed Mummy",
        "Peanut Scout",
        "Peanut President",
        "Ice Cream Chef",
        "Ice Cream Commander",
        "Cookie Crafter",
        "Cake Guard",
        "Baking Staff",
        "Head Baker",
        "Cocoa Warrior",
        "Chocolate Bar Battler",
        "Sweet Thief",
        "Candy Rebel",
        "Candy Pirate",
        "Snow Demon",
        "Isle Outlaw",
        "Island Boy",
        "Sun-kissed Warrior",
        "Isle Champion",
        "Serpent Hunter",
        "Skull Slayer",
        "Reef Bandit",
        "Coral Pirate",
        "Sea Chanter",
        "High Disciple",
        "Grand Devotee"
    }
end
if Sea1 then
    AreaList = {
        "Jungle",
        "Buggy",
        "Desert",
        "Snow",
        "Marine",
        "Sky",
        "Prison",
        "Colosseum",
        "Magma",
        "Fishman",
        "Sky Island",
        "Fountain"
    }
elseif Sea2 then
    AreaList = {
        "Area 1",
        "Area 2",
        "Zombie",
        "Marine",
        "Snow Mountain",
        "Ice fire",
        "Ship",
        "Frost",
        "Forgotten"
    }
elseif Sea3 then
    AreaList = {
        "Pirate Port",
        "Amazon",
        "Marine Tree",
        "Deep Forest",
        "Haunted Castle",
        "Nut Island",
        "Ice Cream Island",
        "Cake Island",
        "Choco Island",
        "Candy Island",
        "Tiki Outpost",
        "Submerged Island"
    }
end
function CheckBossQuest()
    if Sea1 then
        if SelectBoss ~= "The Gorilla King" then
            if SelectBoss ~= "Bobby" then
                if SelectBoss ~= "The Saw" then
                    if SelectBoss ~= "Yeti" then
                        if SelectBoss ~= "Mob Leader" then
                            if SelectBoss ~= "Vice Admiral" then
                                if SelectBoss ~= "Saber Expert" then
                                    if SelectBoss ~= "Warden" then
                                        if SelectBoss ~= "Chief Warden" then
                                            if SelectBoss ~= "Swan" then
                                                if SelectBoss ~= "Magma Admiral" then
                                                    if SelectBoss ~= "Fishman Lord" then
                                                        if SelectBoss ~= "Wysper" then
                                                            if SelectBoss ~= "Thunder God" then
                                                                if SelectBoss ~= "Cyborg" then
                                                                    if SelectBoss ~= "Ice Admiral" then
                                                                        if SelectBoss == "Greybeard" then
                                                                            BossMon = "Greybeard"
                                                                            NameBoss = "Greybeard"
                                                                            CFrameBoss = CFrame.new(- 5081.3452148438, 85.221641540527, 4257.3588867188)
                                                                        end
                                                                    else
                                                                        BossMon = "Ice Admiral"
                                                                        NameBoss = "Ice Admiral"
                                                                        CFrameBoss = CFrame.new(1266.08948, 26.1757946, - 1399.57678, - 0.573599219, 0, - 0.81913656, 0, 1, 0, 0.81913656, 0, - 0.573599219)
                                                                    end
                                                                else
                                                                    BossMon = "Cyborg"
                                                                    NameBoss = "Cyborg"
                                                                    NameQuestBoss = "FountainQuest"
                                                                    QuestLvBoss = 3
                                                                    RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
                                                                    CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                                                                    CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
                                                                end
                                                            else
                                                                BossMon = "Thunder God"
                                                                NameBoss = "Thunder God"
                                                                NameQuestBoss = "SkyExp2Quest"
                                                                QuestLvBoss = 3
                                                                RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
                                                                CFrameQBoss = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125)
                                                                CFrameBoss = CFrame.new(- 7994.984375, 5761.025390625, - 2088.6479492188)
                                                            end
                                                        else
                                                            BossMon = "Wysper"
                                                            NameBoss = "Wysper"
                                                            NameQuestBoss = "SkyExp1Quest"
                                                            QuestLvBoss = 3
                                                            RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
                                                            CFrameQBoss = CFrame.new(- 7861.947265625, 5545.517578125, - 379.85974121094)
                                                            CFrameBoss = CFrame.new(- 7866.1333007813, 5576.4311523438, - 546.74816894531)
                                                        end
                                                    else
                                                        BossMon = "Fishman Lord"
                                                        NameBoss = "Fishman Lord"
                                                        NameQuestBoss = "FishmanQuest"
                                                        QuestLvBoss = 3
                                                        RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
                                                        CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                                                        CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
                                                    end
                                                else
                                                    BossMon = "Magma Admiral"
                                                    NameBoss = "Magma Admiral"
                                                    NameQuestBoss = "MagmaQuest"
                                                    QuestLvBoss = 3
                                                    RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
                                                    CFrameQBoss = CFrame.new(- 5314.6220703125, 12.262420654297, 8517.279296875)
                                                    CFrameBoss = CFrame.new(- 5765.8969726563, 82.92064666748, 8718.3046875)
                                                end
                                            else
                                                BossMon = "Swan"
                                                NameBoss = "Swan"
                                                NameQuestBoss = "ImpelQuest"
                                                QuestLvBoss = 3
                                                RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
                                                CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, - 0.309060812, 0, 0.951042235, 0, 1, 0, - 0.951042235, 0, - 0.309060812)
                                                CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635)
                                            end
                                        else
                                            BossMon = "Chief Warden"
                                            NameBoss = "Chief Warden"
                                            NameQuestBoss = "ImpelQuest"
                                            QuestLvBoss = 2
                                            RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
                                            CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, - 0.00062915677, 0.939684749, 0.00191645394, 0.999998152, - 0.000028042234, - 0.939682961, 0.00181045406, 0.342041939)
                                            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635)
                                        end
                                    else
                                        BossMon = "Warden"
                                        NameBoss = "Warden"
                                        NameQuestBoss = "ImpelQuest"
                                        QuestLvBoss = 1
                                        RewardBoss = "Reward:\n$6,000\n850,000 Exp."
                                        CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, - 4.499464e-6, 0.975376427, - 0.000019541258, 1, 9.031621e-6, - 0.975376427, - 0.000021051976, 0.220546961)
                                        CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635)
                                    end
                                else
                                    NameBoss = "Saber Expert"
                                    BossMon = "Saber Expert"
                                    CFrameBoss = CFrame.new(- 1458.89502, 29.8870335, - 50.633564)
                                end
                            else
                                BossMon = "Vice Admiral"
                                NameBoss = "Vice Admiral"
                                NameQuestBoss = "MarineQuest2"
                                QuestLvBoss = 2
                                RewardBoss = "Reward:\n$10,000\n180,000 Exp."
                                CFrameQBoss = CFrame.new(- 5036.2465820313, 28.677835464478, 4324.56640625)
                                CFrameBoss = CFrame.new(- 5006.5454101563, 88.032081604004, 4353.162109375)
                            end
                        else
                            BossMon = "Mob Leader"
                            NameBoss = "Mob Leader"
                            CFrameBoss = CFrame.new(- 2844.7307128906, 7.4180502891541, 5356.6723632813)
                        end
                    else
                        BossMon = "Yeti"
                        NameBoss = "Yeti"
                        NameQuestBoss = "SnowQuest"
                        QuestLvBoss = 3
                        RewardBoss = "Reward:\n$10,000\n180,000 Exp."
                        CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156)
                        CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, - 1488.0262451172)
                    end
                else
                    BossMon = "The Saw"
                    NameBoss = "The Saw"
                    CFrameBoss = CFrame.new(- 784.89715576172, 72.427383422852, 1603.5822753906)
                end
            else
                BossMon = "Bobby"
                NameBoss = "Bobby"
                NameQuestBoss = "BuggyQuest1"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$8,000\n35,000 Exp."
                CFrameQBoss = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188)
                CFrameBoss = CFrame.new(- 1087.3760986328, 46.949409484863, 4040.1462402344)
            end
        else
            BossMon = "The Gorilla King"
            NameBoss = "The Gorrila King"
            NameQuestBoss = "JungleQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$2,000\n7,000 Exp."
            CFrameQBoss = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameBoss = CFrame.new(- 1088.75977, 8.13463783, - 488.559906, - 0.707134247, 0, 0.707079291, 0, 1, 0, - 0.707079291, 0, - 0.707134247)
        end
    end
    if Sea2 then
        if SelectBoss ~= "Diamond" then
            if SelectBoss ~= "Jeremy" then
                if SelectBoss ~= "Fajita" then
                    if SelectBoss ~= "Don Swan" then
                        if SelectBoss ~= "Smoke Admiral" then
                            if SelectBoss ~= "Awakened Ice Admiral" then
                                if SelectBoss ~= "Tide Keeper" then
                                    if SelectBoss ~= "Darkbeard" then
                                        if SelectBoss ~= "Cursed Captain" then
                                            if SelectBoss == "Order" then
                                                BossMon = "Order"
                                                NameBoss = "Order"
                                                CFrameBoss = CFrame.new(- 6217.2021484375, 28.047645568848, - 5053.1357421875)
                                            end
                                        else
                                            BossMon = "Cursed Captain"
                                            NameBoss = "Cursed Captain"
                                            CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
                                        end
                                    else
                                        BossMon = "Darkbeard"
                                        NameBoss = "Darkbeard"
                                        CFrameMon = CFrame.new(3677.08203125, 62.751937866211, - 3144.8332519531)
                                    end
                                else
                                    BossMon = "Tide Keeper"
                                    NameBoss = "Tide Keeper"
                                    NameQuestBoss = "ForgottenQuest"
                                    QuestLvBoss = 3
                                    RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
                                    CFrameQBoss = CFrame.new(- 3053.9814453125, 237.18954467773, - 10145.0390625)
                                    CFrameBoss = CFrame.new(- 3795.6423339844, 105.88877105713, - 11421.307617188)
                                end
                            else
                                BossMon = "Awakened Ice Admiral"
                                NameBoss = "Awakened Ice Admiral"
                                NameQuestBoss = "FrostQuest"
                                QuestLvBoss = 3
                                RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
                                CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, - 6483.3520507813)
                                CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, - 6894.5595703125)
                            end
                        else
                            BossMon = "Smoke Admiral"
                            NameBoss = "Smoke Admiral"
                            NameQuestBoss = "IceSideQuest"
                            QuestLvBoss = 3
                            RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
                            CFrameQBoss = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813)
                            CFrameBoss = CFrame.new(- 5275.1987304688, 20.757257461548, - 5260.6669921875)
                        end
                    else
                        BossMon = "Don Swan"
                        NameBoss = "Don Swan"
                        CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
                    end
                else
                    BossMon = "Fajita"
                    NameBoss = "Fajita"
                    NameQuestBoss = "MarineQuest3"
                    QuestLvBoss = 3
                    RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
                    CFrameQBoss = CFrame.new(- 2441.986328125, 73.359344482422, - 3217.5324707031)
                    CFrameBoss = CFrame.new(- 2172.7399902344, 103.32216644287, - 4015.025390625)
                end
            else
                BossMon = "Jeremy"
                NameBoss = "Jeremy"
                NameQuestBoss = "Area2Quest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
                CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
                CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
            end
        else
            BossMon = "Diamond"
            NameBoss = "Diamond"
            NameQuestBoss = "Area1Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
            CFrameQBoss = CFrame.new(- 427.5666809082, 73.313781738281, 1835.4208984375)
            CFrameBoss = CFrame.new(- 1576.7166748047, 198.59265136719, 13.724286079407)
        end
    end
    if Sea3 then
        if SelectBoss ~= "Stone" then
            if SelectBoss ~= "Hydra Leader" then
                if SelectBoss ~= "Kilo Admiral" then
                    if SelectBoss ~= "Captain Elephant" then
                        if SelectBoss ~= "Beautiful Pirate" then
                            if SelectBoss ~= "Cake Queen" then
                                if SelectBoss ~= "Longma" then
                                    if SelectBoss ~= "Soul Reaper" then
                                        if SelectBoss == "rip_indra True Form" then
                                            BossMon = "rip_indra True Form"
                                            NameBoss = "rip_indra True Form"
                                            CFrameBoss = CFrame.new(- 5415.3920898438, 505.74133300781, - 2814.0166015625)
                                        end
                                    else
                                        BossMon = "Soul Reaper"
                                        NameBoss = "Soul Reaper"
                                        CFrameBoss = CFrame.new(- 9524.7890625, 315.80429077148, 6655.7192382813)
                                    end
                                else
                                    BossMon = "Longma"
                                    NameBoss = "Longma"
                                    CFrameBoss = CFrame.new(- 10238.875976563, 389.7912902832, - 9549.7939453125)
                                end
                            else
                                BossMon = "Cake Queen"
                                NameBoss = "Cake Queen"
                                NameQuestBoss = "IceCreamIslandQuest"
                                QuestLvBoss = 3
                                RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
                                CFrameQBoss = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664)
                                CFrameBoss = CFrame.new(- 678.648804, 381.353943, - 11114.2012, - 0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, - 0.417492568, 0.0167988986, - 0.90852499)
                            end
                        else
                            BossMon = "Beautiful Pirate"
                            NameBoss = "Beautiful Pirate"
                            NameQuestBoss = "DeepForestIsland2"
                            QuestLvBoss = 3
                            RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
                            CFrameQBoss = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375)
                            CFrameBoss = CFrame.new(5283.609375, 22.56223487854, - 110.78285217285)
                        end
                    else
                        BossMon = "Captain Elephant"
                        NameBoss = "Captain Elephant"
                        NameQuestBoss = "DeepForestIsland"
                        QuestLvBoss = 3
                        RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
                        CFrameQBoss = CFrame.new(- 13232.682617188, 332.40396118164, - 7626.01171875)
                        CFrameBoss = CFrame.new(- 13376.7578125, 433.28689575195, - 8071.392578125)
                    end
                else
                    BossMon = "Kilo Admiral"
                    NameBoss = "Kilo Admiral"
                    NameQuestBoss = "MarineTreeIsland"
                    QuestLvBoss = 3
                    RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
                    CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, - 6739.9741210938)
                    CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, - 7144.4580078125)
                end
            else
                BossMon = "Hydra Leader"
                NameBoss = "Hydra Leader"
                NameQuestBoss = "VenomCrewQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
                CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
                CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
            end
        else
            BossMon = "Stone"
            NameBoss = "Stone"
            NameQuestBoss = "PiratePortQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
            CFrameQBoss = CFrame.new(- 289.76705932617, 43.819011688232, 5579.9384765625)
            CFrameBoss = CFrame.new(- 1027.6512451172, 92.404174804688, 6578.8530273438)
        end
    end
end
function MaterialMon()
    if SelectMaterial ~= "Radioactive Material" then
        if SelectMaterial ~= "Mystic Droplet" then
            if SelectMaterial ~= "Magma Ore" then
                if SelectMaterial ~= "Angel Wings" then
                    if SelectMaterial ~= "Leather" then
                        if SelectMaterial ~= "Scrap Metal" then
                            if SelectMaterial ~= "Fish Tail" then
                                if SelectMaterial ~= "Demonic Wisp" then
                                    if SelectMaterial ~= "Vampire Fang" then
                                        if SelectMaterial ~= "Conjured Cocoa" then
                                            if SelectMaterial ~= "Dragon Scale" then
                                                if SelectMaterial ~= "Gunpowder" then
                                                    if SelectMaterial ~= "Hydra Enforcer" then
                                                        if SelectMaterial ~= "Venomous Assailant" then
                                                            if SelectMaterial == "Mini Tusk" then
                                                                MMon = "Mythological Pirate"
                                                                MPos = CFrame.new()
                                                                SP = "Default"
                                                            end
                                                        else
                                                            MMon = "Venomous Assailant"
                                                            MPos = CFrame.new(4879.92041015625, 1089.46142578125, 1104.00830078125)
                                                            SP = "Default"
                                                        end
                                                    else
                                                        MMon = "Hydra Enforcer"
                                                        MPos = CFrame.new(4581.517578125, 1001.55908203125, 704.9378662109375)
                                                        SP = "Default"
                                                    end
                                                else
                                                    MMon = "Pistol Billionaire"
                                                    MPos = CFrame.new(- 469, 74, 5904)
                                                    SP = "Default"
                                                end
                                            else
                                                MMon = "Dragon Crew Archer"
                                                MPos = CFrame.new(6827.91455078125, 609.4127197265625, 252.3538055419922)
                                                SP = "Default"
                                            end
                                        else
                                            MMon = "Chocolate Bar Battler"
                                            MPos = CFrame.new(620.6344604492188, 78.93644714355469, - 12581.369140625)
                                            SP = "Default"
                                        end
                                    else
                                        MMon = "Vampire"
                                        MPos = CFrame.new(- 6033, 7, - 1317)
                                        SP = "Default"
                                    end
                                else
                                    MMon = "Demonic Soul"
                                    MPos = CFrame.new(- 9507, 172, 6158)
                                    SP = "Default"
                                end
                            elseif Sea3 then
                                MMon = "Fishman Raider"
                                MPos = CFrame.new(- 10993, 332, - 8940)
                                SP = "Default"
                            elseif Sea1 then
                                MMon = "Fishman Warrior"
                                MPos = CFrame.new(61123, 19, 1569)
                                SP = "Default"
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
                                end
                            end
                        elseif Sea1 then
                            MMon = "Brute"
                            MPos = CFrame.new(- 1145, 15, 4350)
                            SP = "Default"
                        elseif Sea2 then
                            MMon = "Swan Pirate"
                            MPos = CFrame.new(878, 122, 1235)
                            SP = "Default"
                        elseif Sea3 then
                            MMon = "Jungle Pirate"
                            MPos = CFrame.new(- 12107, 332, - 10549)
                            SP = "Default"
                        end
                    elseif Sea1 then
                        MMon = "Brute"
                        MPos = CFrame.new(- 1145, 15, 4350)
                        SP = "Default"
                    elseif Sea2 then
                        MMon = "Marine Captain"
                        MPos = CFrame.new(- 2010.5059814453125, 73.00115966796875, - 3326.620849609375)
                        SP = "Default"
                    elseif Sea3 then
                        MMon = "Jungle Pirate"
                        MPos = CFrame.new(- 11975.78515625, 331.7734069824219, - 10620.0302734375)
                        SP = "Default"
                    end
                else
                    MMon = "God\'s Guard"
                    MPos = CFrame.new(- 4698, 845, - 1912)
                    SP = "Default"
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 7859.09814, 5544.19043, - 381.476196)).Magnitude >= 5000 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7859.09814, 5544.19043, - 381.476196))
                    end
                end
            elseif Sea1 then
                MMon = "Military Spy"
                MPos = CFrame.new(- 5815, 84, 8820)
                SP = "Default"
            elseif Sea2 then
                MMon = "Magma Ninja"
                MPos = CFrame.new(- 5428, 78, - 5959)
                SP = "Default"
            end
        else
            MMon = "Water Fighter"
            MPos = CFrame.new(- 3385, 239, - 10542)
            SP = "Default"
        end
    else
        MMon = "Factory Staff"
        MPos = CFrame.new(295, 73, - 56)
        SP = "Default"
    end
end
function UpdateIslandESP()
    local v8, v9, v10 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
    while true do
        local vu11
        v10, vu11 = v8(v9, v10)
        if v10 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu11
            if IslandESP then
                if vu11.Name ~= "Sea" then
                    if vu11:FindFirstChild("NameEsp") then
                        vu11.NameEsp.TextLabel.Text = vu11.Name .. "   \n" .. round((game:GetService("Players").LocalPlayer.Character.Head.Position - vu11.Position).Magnitude / 3) .. " Distance"
                    else
                        local v12 = Instance.new("BillboardGui", vu11)
                        v12.Name = "NameEsp"
                        v12.ExtentsOffset = Vector3.new(0, 1, 0)
                        v12.Size = UDim2.new(1, 200, 1, 30)
                        v12.Adornee = vu11
                        v12.AlwaysOnTop = true
                        local v13 = Instance.new("TextLabel", v12)
                        v13.Font = "GothamBold"
                        v13.FontSize = "Size14"
                        v13.TextWrapped = true
                        v13.Size = UDim2.new(1, 0, 1, 0)
                        v13.TextYAlignment = "Top"
                        v13.BackgroundTransparency = 1
                        v13.TextStrokeTransparency = 0.5
                        v13.TextColor3 = Color3.fromRGB(8, 0, 0)
                    end
                end
            elseif vu11:FindFirstChild("NameEsp") then
                vu11:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
function isnil(p14)
    return p14 == nil
end
local function vu16(p15)
    return math.floor(tonumber(p15) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	-- upvalues: (ref) vu16
    local v17, v18, v19 = pairs(game:GetService("Players"):GetChildren())
    while true do
        local vu20
        v19, vu20 = v17(v18, v19)
        if v19 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu20, (ref) vu16
            if not isnil(vu20.Character) then
                if ESPPlayer then
                    if isnil(vu20.Character.Head) or vu20.Character.Head:FindFirstChild("NameEsp" .. Number) then
                        vu20.Character.Head["NameEsp" .. Number].TextLabel.Text = vu20.Name .. " | " .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - vu20.Character.Head.Position).Magnitude / 3) .. " Distance\nHealth : " .. vu16(vu20.Character.Humanoid.Health * 100 / vu20.Character.Humanoid.MaxHealth) .. "%"
                    else
                        local v21 = Instance.new("BillboardGui", vu20.Character.Head)
                        v21.Name = "NameEsp" .. Number
                        v21.ExtentsOffset = Vector3.new(0, 1, 0)
                        v21.Size = UDim2.new(1, 200, 1, 30)
                        v21.Adornee = vu20.Character.Head
                        v21.AlwaysOnTop = true
                        local v22 = Instance.new("TextLabel", v21)
                        v22.Font = Enum.Font.GothamSemibold
                        v22.FontSize = "Size10"
                        v22.TextWrapped = true
                        v22.Text = vu20.Name .. " \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - vu20.Character.Head.Position).Magnitude / 3) .. " Distance"
                        v22.Size = UDim2.new(1, 0, 1, 0)
                        v22.TextYAlignment = "Top"
                        v22.BackgroundTransparency = 1
                        v22.TextStrokeTransparency = 0.5
                        if vu20.Team ~= game.Players.LocalPlayer.Team then
                            v22.TextColor3 = Color3.new(255, 0, 0)
                        else
                            v22.TextColor3 = Color3.new(0, 0, 254)
                        end
                    end
                elseif vu20.Character.Head:FindFirstChild("NameEsp" .. Number) then
                    vu20.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateChestChams()
	-- upvalues: (ref) vu16
    local v23, v24, v25 = pairs(game.Workspace:GetChildren())
    while true do
        local vu26
        v25, vu26 = v23(v24, v25)
        if v25 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu26, (ref) vu16
            if string.find(vu26.Name, "Chest") then
                if ChestESP then
                    if string.find(vu26.Name, "Chest") then
                        if vu26:FindFirstChild("NameEsp" .. Number) then
                            vu26["NameEsp" .. Number].TextLabel.Text = vu26.Name .. "   \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - vu26.Position).Magnitude / 3) .. " Distance"
                        else
                            local v27 = Instance.new("BillboardGui", vu26)
                            v27.Name = "NameEsp" .. Number
                            v27.ExtentsOffset = Vector3.new(0, 1, 0)
                            v27.Size = UDim2.new(1, 200, 1, 30)
                            v27.Adornee = vu26
                            v27.AlwaysOnTop = true
                            local v28 = Instance.new("TextLabel", v27)
                            v28.Font = Enum.Font.GothamSemibold
                            v28.FontSize = "Size14"
                            v28.TextWrapped = true
                            v28.Size = UDim2.new(1, 0, 1, 0)
                            v28.TextYAlignment = "Top"
                            v28.BackgroundTransparency = 1
                            v28.TextStrokeTransparency = 0.5
                            if vu26.Name == "Chest1" then
                                v28.TextColor3 = Color3.fromRGB(109, 109, 109)
                                v28.Text = "Chest 1" .. " \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - vu26.Position).Magnitude / 3) .. " Distance"
                            end
                            if vu26.Name == "Chest2" then
                                v28.TextColor3 = Color3.fromRGB(173, 158, 21)
                                v28.Text = "Chest 2" .. " \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - vu26.Position).Magnitude / 3) .. " Distance"
                            end
                            if vu26.Name == "Chest3" then
                                v28.TextColor3 = Color3.fromRGB(85, 255, 255)
                                v28.Text = "Chest 3" .. " \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - vu26.Position).Magnitude / 3) .. " Distance"
                            end
                        end
                    end
                elseif vu26:FindFirstChild("NameEsp" .. Number) then
                    vu26:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateDevilChams()
	-- upvalues: (ref) vu16
    local v29, v30, v31 = pairs(game.Workspace:GetChildren())
    while true do
        local vu32
        v31, vu32 = v29(v30, v31)
        if v31 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu32, (ref) vu16
            if DevilFruitESP then
                if string.find(vu32.Name, "Fruit") then
                    if vu32.Handle:FindFirstChild("NameEsp" .. Number) then
                        vu32.Handle["NameEsp" .. Number].TextLabel.Text = vu32.Name .. "   \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - vu32.Handle.Position).Magnitude / 3) .. " Distance"
                    else
                        local v33 = Instance.new("BillboardGui", vu32.Handle)
                        v33.Name = "NameEsp" .. Number
                        v33.ExtentsOffset = Vector3.new(0, 1, 0)
                        v33.Size = UDim2.new(1, 200, 1, 30)
                        v33.Adornee = vu32.Handle
                        v33.AlwaysOnTop = true
                        local v34 = Instance.new("TextLabel", v33)
                        v34.Font = Enum.Font.GothamSemibold
                        v34.FontSize = "Size14"
                        v34.TextWrapped = true
                        v34.Size = UDim2.new(1, 0, 1, 0)
                        v34.TextYAlignment = "Top"
                        v34.BackgroundTransparency = 1
                        v34.TextStrokeTransparency = 0.5
                        v34.TextColor3 = Color3.fromRGB(255, 255, 255)
                        v34.Text = vu32.Name .. " \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - vu32.Handle.Position).Magnitude / 3) .. " Distance"
                    end
                end
            elseif vu32.Handle:FindFirstChild("NameEsp" .. Number) then
                vu32.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end)
    end
end
function UpdateFlowerChams()
	-- upvalues: (ref) vu16
    local v35, v36, v37 = pairs(game.Workspace:GetChildren())
    while true do
        local vu38
        v37, vu38 = v35(v36, v37)
        if v37 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu38, (ref) vu16
            if vu38.Name == "Flower2" or vu38.Name == "Flower1" then
                if FlowerESP then
                    if vu38:FindFirstChild("NameEsp" .. Number) then
                        vu38["NameEsp" .. Number].TextLabel.Text = vu38.Name .. "   \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - vu38.Position).Magnitude / 3) .. " Distance"
                    else
                        local v39 = Instance.new("BillboardGui", vu38)
                        v39.Name = "NameEsp" .. Number
                        v39.ExtentsOffset = Vector3.new(0, 1, 0)
                        v39.Size = UDim2.new(1, 200, 1, 30)
                        v39.Adornee = vu38
                        v39.AlwaysOnTop = true
                        local v40 = Instance.new("TextLabel", v39)
                        v40.Font = Enum.Font.GothamSemibold
                        v40.FontSize = "Size14"
                        v40.TextWrapped = true
                        v40.Size = UDim2.new(1, 0, 1, 0)
                        v40.TextYAlignment = "Top"
                        v40.BackgroundTransparency = 1
                        v40.TextStrokeTransparency = 0.5
                        v40.TextColor3 = Color3.fromRGB(255, 0, 0)
                        if vu38.Name == "Flower1" then
                            v40.Text = "Blue Flower" .. " \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - vu38.Position).Magnitude / 3) .. " Distance"
                            v40.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if vu38.Name == "Flower2" then
                            v40.Text = "Red Flower" .. " \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - vu38.Position).Magnitude / 3) .. " Distance"
                            v40.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    end
                elseif vu38:FindFirstChild("NameEsp" .. Number) then
                    vu38:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateRealFruitChams()
	-- upvalues: (ref) vu16
    local v41, v42, v43 = pairs(game.Workspace.AppleSpawner:GetChildren())
    while true do
        local v44
        v43, v44 = v41(v42, v43)
        if v43 == nil then
            break
        end
        if v44:IsA("Tool") then
            if RealFruitESP then
                if v44.Handle:FindFirstChild("NameEsp" .. Number) then
                    v44.Handle["NameEsp" .. Number].TextLabel.Text = v44.Name .. " " .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - v44.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v45 = Instance.new("BillboardGui", v44.Handle)
                    v45.Name = "NameEsp" .. Number
                    v45.ExtentsOffset = Vector3.new(0, 1, 0)
                    v45.Size = UDim2.new(1, 200, 1, 30)
                    v45.Adornee = v44.Handle
                    v45.AlwaysOnTop = true
                    local v46 = Instance.new("TextLabel", v45)
                    v46.Font = Enum.Font.GothamSemibold
                    v46.FontSize = "Size14"
                    v46.TextWrapped = true
                    v46.Size = UDim2.new(1, 0, 1, 0)
                    v46.TextYAlignment = "Top"
                    v46.BackgroundTransparency = 1
                    v46.TextStrokeTransparency = 0.5
                    v46.TextColor3 = Color3.fromRGB(255, 0, 0)
                    v46.Text = v44.Name .. " \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - v44.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v44.Handle:FindFirstChild("NameEsp" .. Number) then
                v44.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    local v47, v48, v49 = pairs(game.Workspace.PineappleSpawner:GetChildren())
    while true do
        local v50
        v49, v50 = v47(v48, v49)
        if v49 == nil then
            break
        end
        if v50:IsA("Tool") then
            if RealFruitESP then
                if v50.Handle:FindFirstChild("NameEsp" .. Number) then
                    v50.Handle["NameEsp" .. Number].TextLabel.Text = v50.Name .. " " .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - v50.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v51 = Instance.new("BillboardGui", v50.Handle)
                    v51.Name = "NameEsp" .. Number
                    v51.ExtentsOffset = Vector3.new(0, 1, 0)
                    v51.Size = UDim2.new(1, 200, 1, 30)
                    v51.Adornee = v50.Handle
                    v51.AlwaysOnTop = true
                    local v52 = Instance.new("TextLabel", v51)
                    v52.Font = Enum.Font.GothamSemibold
                    v52.FontSize = "Size14"
                    v52.TextWrapped = true
                    v52.Size = UDim2.new(1, 0, 1, 0)
                    v52.TextYAlignment = "Top"
                    v52.BackgroundTransparency = 1
                    v52.TextStrokeTransparency = 0.5
                    v52.TextColor3 = Color3.fromRGB(255, 174, 0)
                    v52.Text = v50.Name .. " \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - v50.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v50.Handle:FindFirstChild("NameEsp" .. Number) then
                v50.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    local v53, v54, v55 = pairs(game.Workspace.BananaSpawner:GetChildren())
    while true do
        local v56
        v55, v56 = v53(v54, v55)
        if v55 == nil then
            break
        end
        if v56:IsA("Tool") then
            if RealFruitESP then
                if v56.Handle:FindFirstChild("NameEsp" .. Number) then
                    v56.Handle["NameEsp" .. Number].TextLabel.Text = v56.Name .. " " .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - v56.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v57 = Instance.new("BillboardGui", v56.Handle)
                    v57.Name = "NameEsp" .. Number
                    v57.ExtentsOffset = Vector3.new(0, 1, 0)
                    v57.Size = UDim2.new(1, 200, 1, 30)
                    v57.Adornee = v56.Handle
                    v57.AlwaysOnTop = true
                    local v58 = Instance.new("TextLabel", v57)
                    v58.Font = Enum.Font.GothamSemibold
                    v58.FontSize = "Size14"
                    v58.TextWrapped = true
                    v58.Size = UDim2.new(1, 0, 1, 0)
                    v58.TextYAlignment = "Top"
                    v58.BackgroundTransparency = 1
                    v58.TextStrokeTransparency = 0.5
                    v58.TextColor3 = Color3.fromRGB(251, 255, 0)
                    v58.Text = v56.Name .. " \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - v56.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v56.Handle:FindFirstChild("NameEsp" .. Number) then
                v56.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
end
function UpdateIslandESP()
	-- upvalues: (ref) vu16
    local v59, v60, v61 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
    while true do
        local vu62
        v61, vu62 = v59(v60, v61)
        if v61 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu62, (ref) vu16
            if IslandESP then
                if vu62.Name ~= "Sea" then
                    if vu62:FindFirstChild("NameEsp") then
                        vu62.NameEsp.TextLabel.Text = vu62.Name .. "   \n" .. vu16((game:GetService("Players").LocalPlayer.Character.Head.Position - vu62.Position).Magnitude / 3) .. " Distance"
                    else
                        local v63 = Instance.new("BillboardGui", vu62)
                        v63.Name = "NameEsp"
                        v63.ExtentsOffset = Vector3.new(0, 1, 0)
                        v63.Size = UDim2.new(1, 200, 1, 30)
                        v63.Adornee = vu62
                        v63.AlwaysOnTop = true
                        local v64 = Instance.new("TextLabel", v63)
                        v64.Font = "GothamBold"
                        v64.FontSize = "Size14"
                        v64.TextWrapped = true
                        v64.Size = UDim2.new(1, 0, 1, 0)
                        v64.TextYAlignment = "Top"
                        v64.BackgroundTransparency = 1
                        v64.TextStrokeTransparency = 0.5
                        v64.TextColor3 = Color3.fromRGB(7, 236, 240)
                    end
                end
            elseif vu62:FindFirstChild("NameEsp") then
                vu62:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
function isnil(p65)
    return p65 == nil
end
local function vu67(p66)
    return math.floor(tonumber(p66) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	-- upvalues: (ref) vu67
    local v68, v69, v70 = pairs(game:GetService("Players"):GetChildren())
    while true do
        local vu71
        v70, vu71 = v68(v69, v70)
        if v70 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu71, (ref) vu67
            if not isnil(vu71.Character) then
                if ESPPlayer then
                    if isnil(vu71.Character.Head) or vu71.Character.Head:FindFirstChild("NameEsp" .. Number) then
                        vu71.Character.Head["NameEsp" .. Number].TextLabel.Text = vu71.Name .. " | " .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - vu71.Character.Head.Position).Magnitude / 3) .. " Distance\nHealth : " .. vu67(vu71.Character.Humanoid.Health * 100 / vu71.Character.Humanoid.MaxHealth) .. "%"
                    else
                        local v72 = Instance.new("BillboardGui", vu71.Character.Head)
                        v72.Name = "NameEsp" .. Number
                        v72.ExtentsOffset = Vector3.new(0, 1, 0)
                        v72.Size = UDim2.new(1, 200, 1, 30)
                        v72.Adornee = vu71.Character.Head
                        v72.AlwaysOnTop = true
                        local v73 = Instance.new("TextLabel", v72)
                        v73.Font = Enum.Font.GothamSemibold
                        v73.FontSize = "Size14"
                        v73.TextWrapped = true
                        v73.Text = vu71.Name .. " \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - vu71.Character.Head.Position).Magnitude / 3) .. " Distance"
                        v73.Size = UDim2.new(1, 0, 1, 0)
                        v73.TextYAlignment = "Top"
                        v73.BackgroundTransparency = 1
                        v73.TextStrokeTransparency = 0.5
                        if vu71.Team ~= game.Players.LocalPlayer.Team then
                            v73.TextColor3 = Color3.new(255, 0, 0)
                        else
                            v73.TextColor3 = Color3.new(0, 255, 0)
                        end
                    end
                elseif vu71.Character.Head:FindFirstChild("NameEsp" .. Number) then
                    vu71.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateChestChams()
	-- upvalues: (ref) vu67
    local v74, v75, v76 = pairs(game.Workspace:GetChildren())
    while true do
        local vu77
        v76, vu77 = v74(v75, v76)
        if v76 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu77, (ref) vu67
            if string.find(vu77.Name, "Chest") then
                if ChestESP then
                    if string.find(vu77.Name, "Chest") then
                        if vu77:FindFirstChild("NameEsp" .. Number) then
                            vu77["NameEsp" .. Number].TextLabel.Text = vu77.Name .. "   \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - vu77.Position).Magnitude / 3) .. " Distance"
                        else
                            local v78 = Instance.new("BillboardGui", vu77)
                            v78.Name = "NameEsp" .. Number
                            v78.ExtentsOffset = Vector3.new(0, 1, 0)
                            v78.Size = UDim2.new(1, 200, 1, 30)
                            v78.Adornee = vu77
                            v78.AlwaysOnTop = true
                            local v79 = Instance.new("TextLabel", v78)
                            v79.Font = Enum.Font.GothamSemibold
                            v79.FontSize = "Size14"
                            v79.TextWrapped = true
                            v79.Size = UDim2.new(1, 0, 1, 0)
                            v79.TextYAlignment = "Top"
                            v79.BackgroundTransparency = 1
                            v79.TextStrokeTransparency = 0.5
                            if vu77.Name == "Chest1" then
                                v79.TextColor3 = Color3.fromRGB(109, 109, 109)
                                v79.Text = "Chest 1" .. " \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - vu77.Position).Magnitude / 3) .. " Distance"
                            end
                            if vu77.Name == "Chest2" then
                                v79.TextColor3 = Color3.fromRGB(173, 158, 21)
                                v79.Text = "Chest 2" .. " \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - vu77.Position).Magnitude / 3) .. " Distance"
                            end
                            if vu77.Name == "Chest3" then
                                v79.TextColor3 = Color3.fromRGB(85, 255, 255)
                                v79.Text = "Chest 3" .. " \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - vu77.Position).Magnitude / 3) .. " Distance"
                            end
                        end
                    end
                elseif vu77:FindFirstChild("NameEsp" .. Number) then
                    vu77:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateDevilChams()
	-- upvalues: (ref) vu67
    local v80, v81, v82 = pairs(game.Workspace:GetChildren())
    while true do
        local vu83
        v82, vu83 = v80(v81, v82)
        if v82 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu83, (ref) vu67
            if DevilFruitESP then
                if string.find(vu83.Name, "Fruit") then
                    if vu83.Handle:FindFirstChild("NameEsp" .. Number) then
                        vu83.Handle["NameEsp" .. Number].TextLabel.Text = vu83.Name .. "   \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - vu83.Handle.Position).Magnitude / 3) .. " Distance"
                    else
                        local v84 = Instance.new("BillboardGui", vu83.Handle)
                        v84.Name = "NameEsp" .. Number
                        v84.ExtentsOffset = Vector3.new(0, 1, 0)
                        v84.Size = UDim2.new(1, 200, 1, 30)
                        v84.Adornee = vu83.Handle
                        v84.AlwaysOnTop = true
                        local v85 = Instance.new("TextLabel", v84)
                        v85.Font = Enum.Font.GothamSemibold
                        v85.FontSize = "Size14"
                        v85.TextWrapped = true
                        v85.Size = UDim2.new(1, 0, 1, 0)
                        v85.TextYAlignment = "Top"
                        v85.BackgroundTransparency = 1
                        v85.TextStrokeTransparency = 0.5
                        v85.TextColor3 = Color3.fromRGB(255, 255, 255)
                        v85.Text = vu83.Name .. " \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - vu83.Handle.Position).Magnitude / 3) .. " Distance"
                    end
                end
            elseif vu83.Handle:FindFirstChild("NameEsp" .. Number) then
                vu83.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end)
    end
end
function UpdateFlowerChams()
	-- upvalues: (ref) vu67
    local v86, v87, v88 = pairs(game.Workspace:GetChildren())
    while true do
        local vu89
        v88, vu89 = v86(v87, v88)
        if v88 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu89, (ref) vu67
            if vu89.Name == "Flower2" or vu89.Name == "Flower1" then
                if FlowerESP then
                    if vu89:FindFirstChild("NameEsp" .. Number) then
                        vu89["NameEsp" .. Number].TextLabel.Text = vu89.Name .. "   \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - vu89.Position).Magnitude / 3) .. " Distance"
                    else
                        local v90 = Instance.new("BillboardGui", vu89)
                        v90.Name = "NameEsp" .. Number
                        v90.ExtentsOffset = Vector3.new(0, 1, 0)
                        v90.Size = UDim2.new(1, 200, 1, 30)
                        v90.Adornee = vu89
                        v90.AlwaysOnTop = true
                        local v91 = Instance.new("TextLabel", v90)
                        v91.Font = Enum.Font.GothamSemibold
                        v91.FontSize = "Size14"
                        v91.TextWrapped = true
                        v91.Size = UDim2.new(1, 0, 1, 0)
                        v91.TextYAlignment = "Top"
                        v91.BackgroundTransparency = 1
                        v91.TextStrokeTransparency = 0.5
                        v91.TextColor3 = Color3.fromRGB(255, 0, 0)
                        if vu89.Name == "Flower1" then
                            v91.Text = "Blue Flower" .. " \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - vu89.Position).Magnitude / 3) .. " Distance"
                            v91.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if vu89.Name == "Flower2" then
                            v91.Text = "Red Flower" .. " \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - vu89.Position).Magnitude / 3) .. " Distance"
                            v91.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    end
                elseif vu89:FindFirstChild("NameEsp" .. Number) then
                    vu89:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateRealFruitChams()
	-- upvalues: (ref) vu67
    local v92, v93, v94 = pairs(game.Workspace.AppleSpawner:GetChildren())
    while true do
        local v95
        v94, v95 = v92(v93, v94)
        if v94 == nil then
            break
        end
        if v95:IsA("Tool") then
            if RealFruitESP then
                if v95.Handle:FindFirstChild("NameEsp" .. Number) then
                    v95.Handle["NameEsp" .. Number].TextLabel.Text = v95.Name .. " " .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - v95.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v96 = Instance.new("BillboardGui", v95.Handle)
                    v96.Name = "NameEsp" .. Number
                    v96.ExtentsOffset = Vector3.new(0, 1, 0)
                    v96.Size = UDim2.new(1, 200, 1, 30)
                    v96.Adornee = v95.Handle
                    v96.AlwaysOnTop = true
                    local v97 = Instance.new("TextLabel", v96)
                    v97.Font = Enum.Font.GothamSemibold
                    v97.FontSize = "Size14"
                    v97.TextWrapped = true
                    v97.Size = UDim2.new(1, 0, 1, 0)
                    v97.TextYAlignment = "Top"
                    v97.BackgroundTransparency = 1
                    v97.TextStrokeTransparency = 0.5
                    v97.TextColor3 = Color3.fromRGB(255, 0, 0)
                    v97.Text = v95.Name .. " \n" .. vu67((game:GetService("Players").LocalPlayer.Character.Head.Position - v95.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v95.Handle:FindFirstChild("NameEsp" .. Number) then
                v95.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
