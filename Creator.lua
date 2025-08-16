-- Creator.lua
local Creator = {}

-- Utility: create UI elements
function Creator.New(class, props)
    local obj = Instance.new(class)
    for k,v in pairs(props) do
        if obj[k] ~= nil then
            obj[k] = v
        end
    end
    return obj
end

-- Theme (for simplicity)
Creator.Theme = {
    Background = Color3.fromRGB(30,30,47),
    TextColor = Color3.fromRGB(255,255,255),
    Button = Color3.fromRGB(3,155,229),
    ButtonHover = Color3.fromRGB(2,119,189)
}

-- Set theme
function Creator.SetTheme(tbl)
    for k,v in pairs(tbl) do
        Creator.Theme[k] = v
    end
end

-- Safe callback (prevent executor crashes)
function Creator.SafeCallback(func)
    local success, err = pcall(func)
    if not success then warn("Callback error:", err) end
end

return Creator
