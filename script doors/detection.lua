local Detection = {}
local DataManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/buitunganh677-collab/Script-is-doors/main/script%20doors/datamanager.lua"))()

function Detection.Analyze(entityName)
    local text = DataManager.GetWikiText(entityName)
    if not text then return "None", "" end

    local action = "None"
    local lowerText = text:lower()

    -- Phân tích từ khóa trong file .txt của bạn
    if lowerText:find("hide") or lowerText:find("closet") then
        action = "Hide"
    elseif lowerText:find("look away") or lowerText:find("eyes") then
        action = "LookAway"
    elseif lowerText:find("crouch") or lowerText:find("figure") then
        action = "Crouch"
    elseif lowerText:find("stare") or lowerText:find("screech") then
        action = "Stare"
    end

    return action, text
end

return Detection
