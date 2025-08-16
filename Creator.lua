-- Creator.lua
local Creator = {}

-- Simple theme storage
Creator.Theme = {
    Background = Color3.fromRGB(30, 30, 47),
    TextColor = Color3.fromRGB(255, 255, 255),
    Button = Color3.fromRGB(3, 155, 229),
    ButtonHover = Color3.fromRGB(2, 119, 189)
}

-- Set theme
function Creator.SetTheme(theme)
    for k,v in pairs(theme) do
        if k == "Background" or k == "TextColor" or k == "Button" or k == "ButtonHover" then
            Creator.Theme[k] = (type(v) == "string" and Color3.fromHex(v)) or v
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

return Creator
