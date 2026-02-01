local Config = {
    Enabled = false
}

function Config.InitUI()
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local MainBtn = Instance.new("TextButton", ScreenGui)
    
    MainBtn.Size = UDim2.new(0, 80, 0, 80)
    MainBtn.Position = UDim2.new(0, 20, 0.4, 0)
    MainBtn.Text = "AI OFF"
    MainBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    MainBtn.Draggable = true

    MainBtn.MouseButton1Click:Connect(function()
        Config.Enabled = not Config.Enabled
        MainBtn.Text = Config.Enabled and "AI ON" or "AI OFF"
        MainBtn.BackgroundColor3 = Config.Enabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    end)
end

return Config
