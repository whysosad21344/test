-- Creator.lua
local Creator = {}

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Default theme
local Theme = {
    Background = Color3.fromRGB(30, 30, 47),
    TextColor = Color3.fromRGB(255, 255, 255),
    Button = Color3.fromRGB(3, 155, 229),
    ButtonHover = Color3.fromRGB(2, 119, 189)
}

function Creator.SetTheme(newTheme)
    for k,v in pairs(newTheme) do
        if Theme[k] ~= nil then
            Theme[k] = v
        end
    end
end

-- Utility function to create UI elements
local function New(type_, props)
    local obj = Instance.new(type_)
    for k,v in pairs(props) do
        obj[k] = v
    end
    return obj
end

-- Window creation
function Creator:CreateWindow(options)
    local Window = {}
    Window.Options = options or {}

    -- Main frame
    local Frame = New("Frame", {
        Size = UDim2.new(0, 400, 0, 300),
        Position = UDim2.new(0.5, -200, 0.5, -150),
        BackgroundColor3 = Theme.Background,
        Parent = PlayerGui
    })

    -- Title
    local Title = New("TextLabel", {
        Text = Window.Options.Title or "Window",
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundTransparency = 1,
        TextColor3 = Theme.TextColor,
        Font = Enum.Font.GothamBold,
        TextSize = 24,
        Parent = Frame
    })

    -- Store buttons/toggles/sliders
    Window.Elements = {}

    -- Add button
    function Window:AddButton(opts)
        local Btn = New("TextButton", {
            Text = opts.Text or "Button",
            Size = UDim2.new(0, 120, 0, 40),
            BackgroundColor3 = Theme.Button,
            TextColor3 = Theme.TextColor,
            Font = Enum.Font.Gotham,
            Parent = Frame
        })

        Btn.MouseEnter:Connect(function()
            Btn.BackgroundColor3 = Theme.ButtonHover
        end)
        Btn.MouseLeave:Connect(function()
            Btn.BackgroundColor3 = Theme.Button
        end)
        Btn.MouseButton1Click:Connect(function()
            if opts.Callback then
                opts.Callback()
            end
        end)

        table.insert(Window.Elements, Btn)
        return Btn
    end

    -- Add toggle
    function Window:AddToggle(opts)
        local State = opts.Default or false
        local Btn = New("TextButton", {
            Text = (State and "✅ " or "❌ ")..(opts.Text or "Toggle"),
            Size = UDim2.new(0, 150, 0, 40),
            BackgroundColor3 = Theme.Button,
            TextColor3 = Theme.TextColor,
            Font = Enum.Font.Gotham,
            Parent = Frame
        })
        Btn.MouseButton1Click:Connect(function()
            State = not State
            Btn.Text = (State and "✅ " or "❌ ")..(opts.Text or "Toggle")
            if opts.Callback then opts.Callback(State) end
        end)
        table.insert(Window.Elements, Btn)
        return Btn
    end

    -- Add slider
    function Window:AddSlider(opts)
        local Slider = New("TextLabel", {
            Text = (opts.Text or "Slider").." : "..(opts.Default or 0),
            Size = UDim2.new(0, 200, 0, 40),
            BackgroundColor3 = Theme.Button,
            TextColor3 = Theme.TextColor,
            Font = Enum.Font.Gotham,
            Parent = Frame
        })
        -- Slider functionality can be added here
        table.insert(Window.Elements, Slider)
        return Slider
    end

    -- Add textbox
    function Window:AddTextbox(opts)
        local Box = New("TextBox", {
            Text = "",
            PlaceholderText = opts.Placeholder or "",
            Size = UDim2.new(0, 200, 0, 40),
            BackgroundColor3 = Theme.Button,
            TextColor3 = Theme.TextColor,
            Font = Enum.Font.Gotham,
            Parent = Frame
        })
        Box.FocusLost:Connect(function(enterPressed)
            if enterPressed and opts.Callback then
                opts.Callback(Box.Text)
            end
        end)
        table.insert(Window.Elements, Box)
        return Box
    end

    return Window
end

return Creator
