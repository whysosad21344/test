-- Creator.lua
local Creator = {}
Creator.__index = Creator

-- Helper functions
local function HexColor(hex)
    local r = tonumber(hex:sub(2,3),16)/255
    local g = tonumber(hex:sub(4,5),16)/255
    local b = tonumber(hex:sub(6,7),16)/255
    return Color3.new(r,g,b)
end

-- Create a Window
function Creator:CreateWindow(options)
    local Window = {}
    Window.Frame = Instance.new("Frame")
    Window.Frame.Size = UDim2.new(0,400,0,300)
    Window.Frame.Position = UDim2.new(0.5,-200,0.5,-150)
    Window.Frame.BackgroundColor3 = HexColor("#1e1e2f")
    Window.Frame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Title
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1,0,0,50)
    Title.Text = options.Title or "Window"
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.new(1,1,1)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 24
    Title.Parent = Window.Frame

    Window:AddButton = function(self, config)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(0,120,0,40)
        Btn.Position = UDim2.new(0.5,-60,0.5,-20)
        Btn.Text = config.Text or "Button"
        Btn.BackgroundColor3 = HexColor("#039be5")
        Btn.TextColor3 = Color3.new(1,1,1)
        Btn.Font = Enum.Font.Gotham
        Btn.TextSize = 18
        Btn.Parent = Window.Frame
        Btn.MouseButton1Click:Connect(function()
            if config.Callback then
                config.Callback()
            end
        end)
    end

    Window:AddToggle = function(self, config)
        local Toggle = Instance.new("TextButton")
        Toggle.Size = UDim2.new(0,120,0,40)
        Toggle.Position = UDim2.new(0.5,-60,0.5,30)
        Toggle.Text = (config.Text or "Toggle").." [OFF]"
        Toggle.BackgroundColor3 = HexColor("#039be5")
        Toggle.TextColor3 = Color3.new(1,1,1)
        Toggle.Font = Enum.Font.Gotham
        Toggle.TextSize = 18
        Toggle.Parent = Window.Frame
        local state = config.Default or false
        Toggle.MouseButton1Click:Connect(function()
            state = not state
            Toggle.Text = (config.Text or "Toggle").." ["..(state and "ON" or "OFF").."]"
            if config.Callback then
                config.Callback(state)
            end
        end)
    end

    Window:AddTextbox = function(self, config)
        local Box = Instance.new("TextBox")
        Box.Size = UDim2.new(0,200,0,30)
        Box.Position = UDim2.new(0.5,-100,0.5,80)
        Box.PlaceholderText = config.Placeholder or ""
        Box.Text = config.Text or ""
        Box.BackgroundColor3 = HexColor("#2e2e3f")
        Box.TextColor3 = Color3.new(1,1,1)
        Box.Font = Enum.Font.Gotham
        Box.TextSize = 18
        Box.Parent = Window.Frame
        Box.FocusLost:Connect(function(enterPressed)
            if enterPressed and config.Callback then
                config.Callback(Box.Text)
            end
        end)
    end

    return Window
end

return Creator
