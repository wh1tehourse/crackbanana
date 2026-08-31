-- Tab: Fake Visuals (Level, Bounty, Beli, Fragments)
v3.Visual:AddButton({
    ["Title"] = "Fake Stats",
    ["Description"] = "",
    ["Callback"] = function()
        local v844 = game:GetService("Players").LocalPlayer
        local v845 = require(game:GetService("ReplicatedStorage").Notification)
        local v846 = v844:WaitForChild("Data")
        local v847 = require(game.ReplicatedStorage:WaitForChild("EXPFunction"))
        local v848 = require(game:GetService("ReplicatedStorage").Effect.Container.LevelUp)
        local v849 = require(game:GetService("ReplicatedStorage").Util.Sound)
        local v850 = game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy") or game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp")
        function v129(p851)
            repeat
                local v852
                p851, v852 = string.gsub(p851, "^(-?%d+)(%d%d%d)", "%1,%2")
            until v852 == 0
            return p851
        end
        v845.new("<Color=Yellow>QUEST COMPLETED!<Color=/>"):Display()
        v845.new("Earned<Color=Yellow>9,999,999,999,999 Exp.<Color=/>(+None)"):Display()
        v845.new("Earned<Color=Green>$9,999,999,999,999<Color=/>"):Display()
        v844.Data.Exp.Value = 999999999999
        v844.Data.Beli.Value = v844.Data.Beli.Value + 999999999999
        delay = 0
        count = 0
        while v844.Data.Exp.Value - v847(v846.Level.Value) > 0 do
            v844.Data.Exp.Value = v844.Data.Exp.Value - v847(v846.Level.Value)
            v844.Data.Level.Value = v844.Data.Level.Value + 1
            v844.Data.Points.Value = v844.Data.Points.Value + 3
            v848({
                v844
            })
            v849:Play(v850.Value)
            v845.new("<Color=Green>LEVEL UP!<Color=/>(" .. v844.Data.Level.Value .. ")"):Display()
            count = count + 1
            if count >= 5 then
                delay = tick()
                count = 0
                task.wait()
            end
        end
    end
})
v3.Visual:AddInput("Input_Level", {
    ["Title"] = "Fake Level",
    ["Default"] = "",
    ["Placeholder"] = "...",
    ["Numeric"] = false,
    ["Finished"] = false,
    ["Callback"] = function(p853)
        game:GetService("Players").LocalPlayer.Data.Level.Value = tonumber(p853)
    end
})
v3.Visual:AddInput("Input_EXP", {
    ["Title"] = "Fake Bounty / EXP",
    ["Default"] = "",
    ["Placeholder"] = "...",
    ["Numeric"] = false,
    ["Finished"] = false,
    ["Callback"] = function(p854)
        game:GetService("Players").LocalPlayer.Data.Exp.Value = tonumber(p854)
    end
})
v3.Visual:AddInput("Input_Beli", {
    ["Title"] = "Fake Beli",
    ["Default"] = "",
    ["Placeholder"] = "...",
    ["Numeric"] = false,
    ["Finished"] = false,
    ["Callback"] = function(p855)
        game:GetService("Players").LocalPlayer.Data.Beli.Value = tonumber(p855)
    end
})
v3.Visual:AddInput("Input_Fragments", {
    ["Title"] = "Fake Fragments",
    ["Default"] = "",
    ["Placeholder"] = "...",
    ["Numeric"] = false,
    ["Finished"] = false,
    ["Callback"] = function(p856)
        game:GetService("Players").LocalPlayer.Data.Fragments.Value = tonumber(p856)
    end
})
local v857 = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits")
Table_DevilFruitSniper = {}
ShopDevilSell = {}
local v858 = next
local v859 = nil
while true do
    local v860
    v859, v860 = v858(v857, v859)
    if v859 == nil then
        break
    end
    table.insert(Table_DevilFruitSniper, v860.Name)
    if v860.OnSale then
        table.insert(ShopDevilSell, v860.Name)
    end
end
_G.SelectFruit = "Dragon-Dragon"
_G.PermanentFruit = "Dragon-Dragon"
_G.AutoBuyFruitSniper = false
_G.AutoSwitchPermanentFruit = false
