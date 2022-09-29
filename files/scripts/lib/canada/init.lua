return {
    init = function(path)
        path = path:gsub("/$", "") .. "/"
        local files = {
            "canada_util.lua",
            "canada_actions.lua"
        }
        for i, v in ipairs(files) do 
            local m = ModTextFileGetContent(path .. v)
            m = m:gsub("CANADA_PATH", path)
            ModTextFileSetContent(path .. v, m)
        end
    end
}