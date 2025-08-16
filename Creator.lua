-- Creator.lua
local Creator = {}
Creator.__index = Creator

-- Helper to convert hex to Color3
function Creator.HexColor(hex)
    hex = hex:gsub("#","")
    return Color3.fromRGB(
        tonumber("0x"..hex:sub(1,2)),
        tonumber("0x"..hex:sub(3,4)),
        tonumber("0x"..hex:sub(5,6))
    )
end

-- Create a window
function Creator:CreateWindow(options)
    local Window = {}
    Window.Title = options.Title or "Window"
    Window.Footer = options.Footer or ""
    Window.Frame = Instance.new("Frame")
    Window.Frame.Size = UDim2.new(0, 400, 0, 300)
    Window.Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
    Window.Frame.BackgroundColor3 = Creator.HexColor("#1e1e2f")
    Window.Frame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Title
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = Window.Title
    TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Color3.fromRGB(255,255,255)
    TitleLabel.TextSize = 24
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Parent = Window.Frame

    Window:AddButton = function(self, buttonOptions)
        local Btn = Instance.new("TextButton")
        Btn.Text = buttonOptions.Text or "Button"
        Btn.Size = UDim2.new(0, 120, 0, 40)
        Btn.Position = UDim2.new(0.5, -60, 0.5, -20)
        Btn.BackgroundColor3 = Creator.HexColor("#039be5")
        Btn.TextColor3 = Color3.fromRGB(255,255,255)
        Btn.Font = Enum.Font.Gotham
        Btn.Parent = Window.Frame

        Btn.MouseButton1Click:Connect(function()
            if buttonOptions.Callback then
                buttonOptions.Callback()
            end
        end)
    end

    return Window
end

return Creator
