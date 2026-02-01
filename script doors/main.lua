-- [[ DOORS AI OVERLORD - ACTION VERSION ]] --
local Base = "https://raw.githubusercontent.com/buitunganh677-collab/Script-is-doors/main/script%20doors/"

local Config = loadstring(game:HttpGet(Base .. "config.lua"))()
local Detection = loadstring(game:HttpGet(Base .. "detection.lua"))()
local Movement = loadstring(game:HttpGet(Base .. "movement.lua"))()

Config.InitUI()

-- Vòng lặp chính xử lý hành động
game:GetService("RunService").Heartbeat:Connect(function()
    if not Config.Enabled then return end

    for _, entity in pairs(workspace:GetChildren()) do
        -- AI Phân tích từ khóa trong file .txt của bạn
        local action, wikiText = Detection.Analyze(entity.Name)
        
        if action == "Hide" then
            -- TỰ ĐỘNG TÌM TỦ GẦN NHẤT VÀ NHẢY VÀO
            local player = game.Players.LocalPlayer
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Closet" and v:IsA("Model") then
                    local dist = (player.Character.HumanoidRootPart.Position - v.PrimaryPart.Position).Magnitude
                    if dist < 50 then
                        Movement.WalkTo(v.PrimaryPart.Position)
                        -- Kích hoạt tủ
                        fireproximityprompt(v:FindFirstChildWhichIsA("ProximityPrompt"))
                        break
                    end
                end
            end
        elseif action == "AvoidEyeContact" then
            -- TỰ ĐỘNG XOAY CAMERA XUỐNG ĐẤT
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + Vector3.new(0, -10, 0))
        elseif action == "Stealth" then
            -- TỰ ĐỘNG NGỒI XUỐNG
            Movement.SetCrouch(true)
        end
    end
end)
