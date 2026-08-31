--[[
    Banana Crack Hub - Combat & Inventory Helpers
    Weapon detection, enemy range targeting, and Auto Haki.
]]

function CheckMaterial(p193)
    local v194, v195, v196 = pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory"))
    while true do
        local v197
        v196, v197 = v194(v195, v196)
        if v196 == nil then
            break
        end
        if type(v197) == "table" and (v197.Type == "Material" and v197.Name == p193) then
            return v197.Count
        end
    end
    return 0
end
function GetWeaponInventory(p198)
    local v199, v200, v201 = pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory"))
    while true do
        local v202
        v201, v202 = v199(v200, v201)
        if v201 == nil then
            break
        end
        if type(v202) == "table" and (v202.Type == "Sword" and v202.Name == p198) then
            return true
        end
    end
    return false
end
local vu203 = game.Players.LocalPlayer
function FindEnemiesInRange(p204, p205)
	-- upvalues: (ref) vu203
    local v206 = (vu203.Character or vu203.CharacterAdded:Wait()):GetPivot().Position
    local v207, v208, v209 = ipairs(p205)
    local v210 = nil
    while true do
        local v211
        v209, v211 = v207(v208, v209)
        if v209 == nil then
            break
        end
        if not v211:GetAttribute("IsBoat") and (v211:FindFirstChildOfClass("Humanoid") and v211.Humanoid.Health > 0) then
            local v212 = v211:FindFirstChild("Head")
            if v212 and ((v206 - v212.Position).Magnitude <= 60 and v211 ~= vu203.Character) then
                table.insert(p204, {
                    v211,
                    v212
                })
                v210 = v212
            end
        end
    end
    local v213, v214, v215 = ipairs(game.Players:GetPlayers())
    while true do
        local v216
        v215, v216 = v213(v214, v215)
        if v215 == nil then
            break
        end
        if v216.Character and v216 ~= vu203 then
            local v217 = v216.Character:FindFirstChild("Head")
            if v217 and (v206 - v217.Position).Magnitude <= 60 then
                table.insert(p204, {
                    v216.Character,
                    v217
                })
                v210 = v217
            end
        end
    end
    return v210
end
function GetEquippedTool()
	-- upvalues: (ref) vu203
    local v218 = vu203.Character
    if not v218 then
        return nil
    end
    local v219, v220, v221 = ipairs(v218:GetChildren())
    while true do
        local v222
        v221, v222 = v219(v220, v221)
        if v221 == nil then
            break
        end
        if v222:IsA("Tool") then
            return v222
        end
    end
    return nil
end

function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end
