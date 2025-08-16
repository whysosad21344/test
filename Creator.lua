-- Creator.lua
local Creator = {}

-- Table to store windows
Creator.Windows = {}

-- Function to create a new window
function Creator:CreateWindow(options)
    local Window = {}
    
    local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    -- Main frame
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 400, 0, 300)
    Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 47)
    Frame.Parent = PlayerGui
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.BackgroundTransparency = 1
    Title.Text = options.Title or "Window"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 24
    Title.Font = Enum.Font.GothamBold
    Title.Parent = Frame
    
    -- Store buttons for this window
    Window.Buttons = {}
    Window.Frame = Frame
    
    -- Add a button function
    function Window:AddButton(buttonOptions)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(0, 120, 0, 40)
        Btn.Position = UDim2.new(0.5, -60, 0.5, -20 + (#self.Buttons * 50))
        Btn.BackgroundColor3 = Color3.fromRGB(3, 155, 229)
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Btn.Text = buttonOptions.Text or "Button"
        Btn.Font = Enum.Font.Gotham
        Btn.TextSize = 18
        Btn.Parent = self.Frame
        
        -- Button hover effect
        Btn.MouseEnter:Connect(function()
            Btn.BackgroundColor3 = Color3.fromRGB(2, 119, 189)
        end)
        Btn.MouseLeave:Connect(function()
            Btn.BackgroundColor3 = Color3.fromRGB(3, 155, 229)
        end)
        
        -- Button click callback
        if buttonOptions.Callback then
            Btn.MouseButton1Click:Connect(buttonOptions.Callback)
        end
        
        table.insert(self.Buttons, Btn)
    end
    
    table.insert(self.Windows, Window)
    return Window
end

return Creator
