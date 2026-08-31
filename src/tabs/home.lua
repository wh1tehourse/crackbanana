-- Tab: Information & Socials
        if not isDragging then
            toggleMenu()
        end
        dragStartPos = nil
        isDragging = false
    end
end)
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
    game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
    game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
end
v3.Home:AddButton({
    ["Title"] = "Tik Tok",
    ["Description"] = "Click(Copy)",
    ["Callback"] = function()
        setclipboard("https://www.tiktok.com/@hng.royal2?_t=ZS-8ywjDgNQ1ah&_r=1")
    end
})
v3.Home:AddButton({
    ["Title"] = "Telegram",
    ["Description"] = "Click(Copy)",
    ["Callback"] = function()
        setclipboard("https://t.me/ayasourcecode")
    end
})
v3.Home:AddButton({
    ["Title"] = "Remember:",
    ["Description"] = "Banana Crack Hub by wh1tehourse",
    ["Callback"] = function()
        setclipboard("https://www.tiktok.com/@hng.royal2?_t=ZS-8ywjDgNQ1ah&_r=1")
    end
