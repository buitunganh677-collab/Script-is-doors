-- [[ DOORS AI OVERLORD ]] --
local Base = "https://raw.githubusercontent.com/buitunganh677-collab/Script-is-doors/main/script%20doors/"

local Config = loadstring(game:HttpGet(Base .. "config.lua"))()
local Detection = loadstring(game:HttpGet(Base .. "detection.lua"))()

Config.InitUI()

game:GetService("RunService").Heartbeat:Connect(function()
    if not Config.Enabled then return end

    for _, entity in pairs(workspace:GetChildren()) do
        -- Kiểm tra nếu thực thể có trong danh sách file .txt của bạn
        local action, wiki = Detection.Analyze(entity.Name)
        
        if action == "Hide" then
            -- Thực thi logic trốn (tự tìm tủ gần nhất)
            print("AI Reading Wiki: Cần đi trốn! Chi tiết: " .. wiki)
        elseif action == "AvoidEyeContact" then
            -- Thực thi logic quay mặt đi
            print("AI Reading Wiki: Không được nhìn! Chi tiết: " .. wiki)
        end
    end
end)

print("Hệ thống AI Doors đã sẵn sàng.")
