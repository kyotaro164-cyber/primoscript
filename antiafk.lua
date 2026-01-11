-- UI Library (Inayos ang URL)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library"))()

-- Window
local window = library:AddWindow("SLH Clan | PUBLIC SCRIPT", {
    main_color = Color3.fromRGB(255, 212, 42),
    min_size = Vector2.new(500, 400), -- Ginawa ko lang mas compact ang default size
})

-- Services
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer
local AntiAFK = false

-- Tab
local mainTab = window:AddTab("Main")

-- Anti-AFK Toggle
mainTab:AddSwitch("Anti AFK", function(state)
    AntiAFK = state
    if AntiAFK then
        print("🟢 Anti-AFK is now ON")
    else
        print("🔴 Anti-AFK is now OFF")
    end
end)

-- Anti-AFK Logic
-- Ito ay gagana lang kapag ang character ay hindi gumagalaw ng 20 minutes (Roblox default)
player.Idled:Connect(function()
    if AntiAFK then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        warn("Anti-AFK: Action executed to prevent disconnect.")
    end
end)
