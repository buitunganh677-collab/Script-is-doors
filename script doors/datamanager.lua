local DataManager = {}
local BaseURL = "https://raw.githubusercontent.com/buitunganh677-collab/Script-is-doors/main/"

function DataManager.GetWikiText(fileName)
    local success, content = pcall(function()
        -- Chuyển tên về chữ thường để khớp với file .txt (vd: Rush -> rush.txt)
        return game:HttpGet(BaseURL .. fileName:lower() .. ".txt")
    end)
    if success then return content end
    return nil
end

return DataManager
