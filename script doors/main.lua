local Base = "https://raw.githubusercontent.com/buitunganh677-collab/Script-is-doors/main/script%20doors/"
local Config = loadstring(game:HttpGet(Base .. "config.lua"))()
local Detection = loadstring(game:HttpGet(Base .. "detection.lua"))()
local Movement = loadstring(game:HttpGet(Base .. "movement.lua"))()

Config.InitUI()

game:GetService("RunService").Heartbeat:Connect(function()
    if not _G.AI_Enabled then return end -- Sử dụng biến toàn cục từ Config

    for _, entity in pairs(workspace:GetChildren()) do
        local action, wiki = Detection.Analyze(entity.Name)

        if action == "Hide" then
            -- Tìm tủ gần nhất
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Closet" and v:IsA("Model") then
                    local primary = v.PrimaryPart or v:FindFirstChild("Main")
                    if primary then
                        Movement.WalkTo(primary.Position)
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - primary.Position).Magnitude < 7 then
                            Movement.Interact(v:FindFirstChildWhichIsA("ProximityPrompt"))
                        end
                    end
                    break
                end
            end
        elseif action == "LookAway" then
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + Vector3.new(0, -10, 0))
        elseif action == "Crouch" then
            Movement.SetCrouch(true)
        elseif action == "Stare" then
            -- Tự động xoay camera nhìn thẳng vào thực thể (dành cho Screech)
            if entity:FindFirstChild("Core") then
                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, entity.Core.Position)
            end
        end
    end
end)
