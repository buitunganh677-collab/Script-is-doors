local DataManager = {}
local BaseURL = "https://raw.githubusercontent.com/buitunganh677-collab/Script-is-doors/main/"

-- Hàm lấy nội dung chữ từ file .txt
function DataManager.GetWikiText(fileName)
    local success, content = pcall(function()
        return game:HttpGet(BaseURL .. fileName .. ".txt")
    end)
    if success then
        return content
    end
    return nil
end

return DataManager
