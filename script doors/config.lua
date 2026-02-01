local Config = {}
_G.AI_Enabled = false

function Config.InitUI()
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local MainBtn = Instance.new("TextButton", ScreenGui)
    
    MainBtn.Size = UDim2.new(0, 100, 0, 50)
    MainBtn.Position = UDim2.new(0, 50, 0.5, 0)
    MainBtn.Text = "AI: OFF"
    MainBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

    MainBtn.MouseButton1Click:Connect(function()
        _G.AI_Enabled = not _G.AI_Enabled
        MainBtn.Text = _G.AI_Enabled and "AI: ON" or "AI: OFF"
        MainBtn.BackgroundColor3 = _G.AI_Enabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    end)
end

return Config
