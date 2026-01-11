-- Loadstring-ready Anti-AFK with Timer GUI
local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

getgenv().AntiAFK = true

local player = Players.LocalPlayer

-- Notify when loaded
StarterGui:SetCore("SendNotification", {
    Title = "Anti-AFK",
    Text = "primoontop | Anti-AFK Loaded",
    Duration = 5
})

-- Create GUI for Timer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AntiAFKTimer"
screenGui.Parent = player:WaitForChild("PlayerGui")

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0, 250, 0, 50)
timerLabel.Position = UDim2.new(0.5, -125, 0, 10) -- top center
timerLabel.BackgroundTransparency = 0.5
timerLabel.BackgroundColor3 = Color3.fromRGB(0,0,0)
timerLabel.TextColor3 = Color3.fromRGB(255,255,0)
timerLabel.Font = Enum.Font.SourceSansBold
timerLabel.TextSize = 24
timerLabel.Text = "Anti-AFK Timer: 0s"
timerLabel.Parent = screenGui

local afkTime = 0

-- Update Timer every second
RunService.RenderStepped:Connect(function(dt)
    if getgenv().AntiAFK then
        afkTime = afkTime + dt
        timerLabel.Text = string.format("Anti-AFK Timer: %ds", math.floor(afkTime))
    end
end)

-- Anti-AFK logic
Players.LocalPlayer.Idled:Connect(function()
    if getgenv().AntiAFK then
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)

        -- Notification tuwing nag-work
        StarterGui:SetCore("SendNotification", {
            Title = "Anti-AFK",
            Text = "primoontop | Anti-AFK working",
            Duration = 3
        })

        -- Reset timer
        afkTime = 0
    end
end)
