-- Creator.lua
local Creator = {}

-- Convert hex to Color3
local function HexToColor3(hex)
    hex = hex:gsub("#","")
    local r = tonumber(hex:sub(1,2),16)
    local g = tonumber(hex:sub(3,4),16)
    local b = tonumber(hex:sub(5,6),16)
    return Color3.fromRGB(r,g,b)
end

-- Theme storage
Creator.Theme = {
    Background = HexToColor3("1e1e2f"),
    TextColor = HexToColor3("ffffff"),
    Button = HexToColor3("039be5"),
    ButtonHover = HexToColor3("0277bd")
}

-- Set theme
function Creator.SetTheme(theme)
    for k,v in pairs(theme) do
        if k == "Background" or k == "TextColor" or k == "Button" or k == "ButtonHover" then
            Creator.Theme[k] = (type(v)=="string" and HexToColor3(v)) or v
        end
    end
end

-- Create new UI element
function Creator.New(ClassName, Properties)
    local obj = Instance.new(ClassName)
    for k,v in pairs(Properties) do
        obj[k] = v
    end
    return obj
end

-- Optional icon system placeholder
function Creator.Icon(name)
    return {""} -- Replace with actual ImageId logic if needed
end

return Creator
