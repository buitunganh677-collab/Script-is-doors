local Detection = {}
local DataManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/buitunganh677-collab/Script-is-doors/main/script%20doors/datamanager.lua"))()

function Detection.Analyze(entityName)
    local text = DataManager.GetWikiText(entityName)
    if not text then return "Unknown", "" end

    local action = "Info"
    local lowerText = text:lower()

    -- Thuật toán tìm từ khóa trong văn bản Wiki
    if lowerText:find("hide") or lowerText:find("closet") then
        action = "Hide"
    elseif lowerText:find("look away") or lowerText:find("stare") then
        action = "AvoidEyeContact"
    elseif lowerText:find("crouch") then
        action = "Stealth"
    end

    return action, text
end

return Detection
