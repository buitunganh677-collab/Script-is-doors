local Movement = {}
local LP = game.Players.LocalPlayer
local Char = LP.Character or LP.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")

function Movement.WalkTo(pos)
    Hum:MoveTo(pos)
end

function Movement.SetCrouch(state)
    if state then
        Hum.WalkSpeed = 8
    else
        Hum.WalkSpeed = 16
    end
end

function Movement.Interact(prompt)
    if prompt and prompt:IsA("ProximityPrompt") then
        fireproximityprompt(prompt)
    end
end

return Movement
