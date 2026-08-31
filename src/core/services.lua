-- Core Services & Game Setup
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")

-- Sea PlaceId Detection
Sea1 = false
Sea2 = false
Sea3 = false
local placeId = game.PlaceId
if placeId == 2753915549 then
    Sea1 = true
elseif placeId == 4442272183 then
    Sea2 = true
elseif placeId == 7449423635 then
    Sea3 = true
end

-- Anti-Idle Handler
Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    task.wait()
    VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
end)
