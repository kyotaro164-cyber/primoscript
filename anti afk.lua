local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")

getgenv().AntiAFK = true

Players.LocalPlayer.Idled:Connect(function()
    if getgenv().AntiAFK then
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        print("🔥 primoontop | Anti-AFK working")
    end
end)

print("✅ Anti-AFK Loaded | primoontop")
