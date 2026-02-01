local Movement = {}
local LP = game.Players.LocalPlayer
local Char = LP.Character or LP.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")

-- Hàm di chuyển mượt mà tới một vị trí
function Movement.WalkTo(position)
    Hum:MoveTo(position)
end

-- Hàm nhảy
function Movement.Jump()
    Hum.Jump = true
end

-- Hàm ngồi (Crouch) - Cần thiết cho Figure và tránh âm thanh
function Movement.SetCrouch(state)
    -- Giả lập nhấn nút C hoặc thay đổi thuộc tính tùy theo Script Crouch bạn dùng
    if state then
        Hum.WalkSpeed = 8
    else
        Hum.WalkSpeed = 16
    end
end

return Movement
