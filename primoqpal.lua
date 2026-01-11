-- [[ SLH Clan | PUBLIC SCRIPT made by PRIMO ]] --
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library", true))()

local window = library:AddWindow(" SLH Clan | PUBLIC SCRIPT made by primo", {
    main_color = Color3.fromRGB(255, 212, 42), -- Yellow/Gold Theme
    min_size = Vector2.new(650, 820),
})

-- [[ TABS SYSTEM ]] --
local MainTab = window:AddTab("Main")
local FarmTab = window:AddTab("Farming")
local ServerTab = window:AddTab("Server")
local KillTab = window:AddTab("Killing")
local SpecsTab = window:AddTab("Specs")
local StatsTab = window:AddTab("Stats")
local CrystalTab = window:AddTab("Crystal")
local TPTab = window:AddTab("Teleport")
local MiscTab = window:AddTab("Misc")
local InfoTab = window:AddTab("Info")

-- [[ MAIN TAB ]] --
MainTab:AddSwitch("Auto Lift (Weights)", function(state)
    _G.Lift = state
    task.spawn(function()
        while _G.Lift do
            game:GetService("ReplicatedStorage").rEvents.liftingEvent:FireServer("Weight")
            task.wait(0.1)
        end
    end)
end)

MainTab:AddSwitch("Auto Pushups", function(state)
    _G.Pushups = state
    task.spawn(function()
        while _G.Pushups do
            game:GetService("ReplicatedStorage").rEvents.pushupsEvent:FireServer("Pushups")
            task.wait(0.1)
        end
    end)
end)

-- [[ FARMING TAB ]] --
FarmTab:AddSwitch("Auto Rock Farm", function(state)
    _G.Rock = state
    task.spawn(function()
        while _G.Rock do
            game:GetService("ReplicatedStorage").rEvents.miningEvent:FireServer("Rock")
            task.wait(0.1)
        end
    end)
end)

-- [[ KILLING TAB ]] --
KillTab:AddSwitch("Kill Aura", function(state)
    _G.KillAura = state
    task.spawn(function()
        while _G.KillAura do
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                    if dist < 25 then
                        game:GetService("ReplicatedStorage").rEvents.punchEvent:FireServer("Punch")
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end)

-- [[ CRYSTAL TAB ]] --
CrystalTab:AddDropdown("Select Crystal", {"Blue Crystal", "Green Crystal", "Frost Crystal", "Mythical Crystal", "Legendary Crystal"}, function(selected)
    _G.SelectedCrystal = selected
end)

CrystalTab:AddSwitch("Auto Hatch", function(state)
    _G.Hatch = state
    task.spawn(function()
        while _G.Hatch do
            if _G.SelectedCrystal then
                game:GetService("ReplicatedStorage").rEvents.openCrystalEvent:FireServer(_G.SelectedCrystal)
            end
            task.wait(1.2)
        end
    end)
end)

-- [[ MISC TAB ]] --
MiscTab:AddSlider("WalkSpeed", 16, 500, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v 
end)

MiscTab:AddSlider("JumpPower", 50, 500, function(v) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v 
end)

MiscTab:AddButton("Anti-AFK", function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end)
end)

-- [[ INFO TAB ]] --
InfoTab:AddLabel("Script: PRIMO PUBLIC")
InfoTab:AddLabel("Made by: PRIMO")
InfoTab:AddLabel("SLH Clan Official")
InfoTab:AddLabel("Theme: Yellow Gold Edition")

game.StarterGui:SetCore("SendNotification", {
    Title = "PRIMO PUBLIC",
    Text = "Yellow UI Loaded Successfully!",
    Duration = 5
})
