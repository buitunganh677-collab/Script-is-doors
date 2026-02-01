local Pathfinder = {}
local PathService = game:GetService("PathfindingService")

function Pathfinder.GetPath(targetPos)
    local char = game.Players.LocalPlayer.Character
    local root = char.HumanoidRootPart
    
    local path = PathService:CreatePath({
        AgentCanJump = true,
        AgentHeight = 5
    })
    
    local success, errorMessage = pcall(function()
        path:ComputeAsync(root.Position, targetPos)
    end)
    
    if success and path.Status == Enum.PathStatus.Success then
        return path:GetWaypoints()
    end
    return nil
end

return Pathfinder
