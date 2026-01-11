-- [[ SLH CLAN | PRIMO PUBLIC SCRIPT (PAID FEATURES VERSION) ]] --
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library", true))()

-- Anti-AFK Setup
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

local window = library:AddWindow(" PRIMO | MUSCLE LEGENDS (PAID)", {
    main_color = Color3.fromRGB(255, 212, 42),
    min_size = Vector2.new(650, 820),
})

-- [[ TABS ]] --
local Main = window:AddTab("Main Farming")
local Stats = window:AddTab("Auto Stats")
local Pets = window:AddTab("Crystal/Pets")
local TP = window:AddTab("Gym Teleport")
local Misc = window:AddTab("Misc/Visuals")

-- [[ 1. MAIN FARMING LOGIC ]] --
Main:AddSwitch("Auto Lift (Strength)", function(state)
    _G.AutoLift = state
    task.spawn(function()
        while _G.AutoLift do
            -- Target weights directly without tool equip requirement
            game:GetService("ReplicatedStorage").rEvents.liftingEvent:FireServer("Weight")
            task.wait()
        end
    end)
end)

Main:AddSwitch("Auto Pushups (Durability)", function(state)
    _G.AutoPush = state
    task.spawn(function()
        while _G.AutoPush do
            game:GetService("ReplicatedStorage").rEvents.pushupsEvent:FireServer("Pushups")
            task.wait()
        end
    end)
end)

Main:AddSwitch("Auto Rock Farm", function(state)
    _G.AutoRock = state
    task.spawn(function()
        while _G.AutoRock do
            game:GetService("ReplicatedStorage").rEvents.miningEvent:FireServer("Rock")
            task.wait()
        end
    end)
end)

-- [[ 2. AUTO STATS LOGIC ]] --
Stats:AddSwitch("Auto Rebirth", function(state)
    _G.AutoRebirth = state
    task.spawn(function()
        while _G.AutoRebirth do
            game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
            task.wait(2)
        end
    end)
end)

-- [[ 3. CRYSTAL/PETS LOGIC ]] --
local selectCrystal = "Blue Crystal"
Pets:AddDropdown("Select Crystal", {"Blue Crystal", "Green Crystal", "Frost Crystal", "Mythical Crystal", "Legendary Crystal", "Inferno Crystal"}, function(v)
    selectCrystal = v
end)

Pets:AddSwitch("Fast Hatch Crystal", function(state)
    _G.AutoHatch = state
    task.spawn(function()
        while _G.AutoHatch do
            game:GetService("ReplicatedStorage").rEvents.openCrystalEvent:FireServer(selectCrystal)
            task.wait(0.8) -- Optimized delay for fast hatching
        end
    end)
end)

-- [[ 4. GYM TELEPORTS ]] --
TP:AddButton("Spawn Island", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 4, 0)
end)
TP:AddButton("Mythical Gym (100k+)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2285, 13, 1056)
end)
TP:AddButton("Legendary Gym (5m+)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4182, 987, -3906)
end)
TP:AddButton("Eternal Gym (10m+)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6696, 13, -1320)
end)

-- [[ 5. MISC & VISUALS ]] --
Misc:AddSlider("WalkSpeed", 16, 500, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

Misc:AddButton("Unlock All Gyms (Bypass)", function()
    for _, v in pairs(game:GetService("Workspace").gyms:GetChildren()) do
        if v:FindFirstChild("canEnter") then
            v.canEnter.Value = true
        end
    end
end)

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "PRIMO SCRIPT LOADED",
    Text = "All Paid Features are now Active!",
    Duration = 5
})
