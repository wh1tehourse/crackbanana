--[[
    Banana Crack Hub - FastAttack & Metatable Hook Engine
    Zero-delay skill and melee attack execution.
]]

task.spawn(function()
    local v184 = getrawmetatable(game)
    local vu185 = v184.__namecall
    setreadonly(v184, false)
    v184.__namecall = newcclosure(function(...)
		-- upvalues: (ref) vu185
        local v186 = getnamecallmethod()
        local v187 = {
            ...
        }
        if tostring(v186) ~= "FireServer" or (tostring(v187[1]) ~= "RemoteEvent" or (tostring(v187[2]) == "true" or (tostring(v187[2]) == "false" or not _G.UseSkill))) then
            return vu185(...)
        end
        if type(v187[2]) ~= "vector" then
            v187[2] = CFrame.new(PositionSkillMasteryDevilFruit)
        else
            v187[2] = PositionSkillMasteryDevilFruit
        end
        return vu185(unpack(v187))
    end)
end)

function AttackNoCoolDown()
    local vu223 = {}
    local v224 = game:GetService("Workspace").Enemies:GetChildren()
    local vu225 = FindEnemiesInRange(vu223, v224)
    if vu225 then
        if GetEquippedTool() then
            pcall(function()
				-- upvalues: (ref) vu223, (ref) vu225
                local v226 = game:GetService("ReplicatedStorage")
                local v227 = v226:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
                local v228 = v226:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
                if # vu223 <= 0 then
                    task.task.wait(1e-9)
                else
                    v227:FireServer(1e-9)
                    v228:FireServer(vu225, vu223)
                end
            end)
        end
    else
        return
    end
end
Type = 1
