--[[
    Banana Crack Hub - Core Services
    Declares Roblox Services & detects current Sea PlaceId.
]]

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local CollectionService = game:GetService("CollectionService")

-- Sea Detection
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
