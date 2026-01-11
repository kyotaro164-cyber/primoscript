local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

getgenv().AntiAFK = true

-- Notify kapag nag-load
StarterGui:SetCore("SendNotification", {
    Title = "Anti-AFK",
    Text = "primoontop | Anti-AFK Loaded",
    Duration = 5
})

Players.LocalPlayer.Idled:Connect(function()
    if getgenv().AntiAFK then
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)

        StarterGui:SetCore("SendNotification", {
            Title = "Anti-AFK",
            Text = "primoontop | Anti-AFK working",
            Duration = 3
        })
    end
end)
