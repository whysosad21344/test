-- main.lua
local Creator = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/whysosad21344/test/main/Creator.lua"))()

-- Create main frame
local MainFrame = Creator.New("Frame", {
    Size = UDim2.new(0,400,0,300),
    Position = UDim2.new(0.5,-200,0.5,-150),
    BackgroundColor3 = Creator.Theme.Background,
    Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
})

-- Add title
local Title = Creator.New("TextLabel", {
    Text = "🎨 My Cool UI",
    Size = UDim2.new(1,0,0,50),
    BackgroundTransparency = 1,
    TextColor3 = Creator.Theme.TextColor,
    TextSize = 24,
    Font = Enum.Font.GothamBold,
    Parent = MainFrame
})

-- Add button
local Button = Creator.New("TextButton", {
    Text = "Click Me!",
    Size = UDim2.new(0,120,0,40),
    Position = UDim2.new(0.5,-60,0.5,-20),
    BackgroundColor3 = Creator.Theme.Button,
    TextColor3 = Creator.Theme.TextColor,
    AutoButtonColor = true,
    Font = Enum.Font.Gotham,
    Parent = MainFrame
})

-- Hover effect
Button.MouseEnter:Connect(function() Button.BackgroundColor3 = Creator.Theme.ButtonHover end)
Button.MouseLeave:Connect(function() Button.BackgroundColor3 = Creator.Theme.Button end)

-- Click event
Button.MouseButton1Click:Connect(function()
    Creator.SafeCallback(function()
        print("Button clicked!")
    end)
end)
