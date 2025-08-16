-- Load Creator module from GitHub
local Creator = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/whysosad21344/test/main/Creator.lua"))()

-- Set a nice theme
Creator.SetTheme({
    Background = "#1e1e2f",
    TextColor = "#ffffff",
    Button = "#039be5",
    ButtonHover = "#0277bd",
    Icon = "#ffffff"
})

-- Create main window
local MainFrame = Creator.New("Frame", {
    Size = UDim2.new(0, 450, 0, 350),
    Position = UDim2.new(0.5, -225, 0.5, -175),
    BackgroundColor3 = Color3.fromRGB(30,30,47),
    BorderSizePixel = 0,
    ClipsDescendants = true
})
MainFrame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Add title
local Title = Creator.New("TextLabel", {
    Text = "🎨 Fancy UI",
    Size = UDim2.new(1, 0, 0, 60),
    BackgroundTransparency = 1,
    TextSize = 28,
    TextColor3 = Color3.fromRGB(255,255,255),
    Font = Enum.Font.GothamBold
})
Title.Parent = MainFrame

-- Add a gradient to main frame
local Gradient = Creator.New("UIGradient", {
    Rotation = 45,
    Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40,40,60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30,30,47))
    }
})
Gradient.Parent = MainFrame

-- Add a button
local MyButton = Creator.New("TextButton", {
    Text = "Click Me!",
    Size = UDim2.new(0, 140, 0, 50),
    Position = UDim2.new(0.5, -70, 0.6, -25),
    BackgroundColor3 = Color3.fromRGB(3,155,229),
    TextColor3 = Color3.fromRGB(255,255,255),
    Font = Enum.Font.GothamBold,
    AutoButtonColor = false,
    ClipsDescendants = true,
    BorderSizePixel = 0,
    CornerRadius = UDim.new(0, 12)
})
MyButton.Parent = MainFrame

-- Button hover effect
MyButton.MouseEnter:Connect(function()
    MyButton.BackgroundColor3 = Color3.fromRGB(2,119,189)
end)
MyButton.MouseLeave:Connect(function()
    MyButton.BackgroundColor3 = Color3.fromRGB(3,155,229)
end)

-- Button click event
MyButton.MouseButton1Click:Connect(function()
    Creator.SafeCallback(function()
        print("Button clicked!")
        -- Example action: you could also kick or give items
    end)
end)

-- Add a small icon
local Icon = Creator.New("ImageLabel", {
    Size = UDim2.new(0, 36, 0, 36),
    Position = UDim2.new(0, 15, 0, 15),
    BackgroundTransparency = 1,
    Image = Creator.Icon("lucide-star")[1]
})
Icon.Parent = MainFrame
