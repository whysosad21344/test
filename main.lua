-- Load Creator module
local Creator = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/whysosad21344/test/main/Creator.lua"))()

-- Set theme
Creator.SetTheme({
    Background = "#1e1e2f",
    TextColor = "#ffffff",
    Button = "#039be5",
    ButtonHover = "#0277bd",
    Icon = "#ffffff"
})

-- Create main frame
local MainFrame = Creator.New("Frame", {
    Size = UDim2.new(0, 400, 0, 300),
    Position = UDim2.new(0.5, -200, 0.5, -150),
    BackgroundColor3 = Color3.fromHex("#1e1e2f"),
    AnchorPoint = Vector2.new(0.5, 0.5)
})
MainFrame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Add title
local Title = Creator.New("TextLabel", {
    Text = "🎨 My Cool UI",
    Size = UDim2.new(1, 0, 0, 50),
    BackgroundTransparency = 1,
    TextSize = 24,
    TextColor3 = Color3.fromHex("#ffffff"),
    Font = Enum.Font.GothamBold
})
Title.Parent = MainFrame

-- Add button
local MyButton = Creator.New("TextButton", {
    Text = "Click Me!",
    Size = UDim2.new(0, 140, 0, 50),
    Position = UDim2.new(0.5, -70, 0.5, -25),
    BackgroundColor3 = Color3.fromHex("#039be5"),
    TextColor3 = Color3.fromHex("#ffffff"),
    AutoButtonColor = true,
    Font = Enum.Font.Gotham,
})
MyButton.Parent = MainFrame

-- Add rounded corners to button
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = MyButton

-- Button hover effect
MyButton.MouseEnter:Connect(function()
    MyButton.BackgroundColor3 = Color3.fromHex("#0277bd")
end)
MyButton.MouseLeave:Connect(function()
    MyButton.BackgroundColor3 = Color3.fromHex("#039be5")
end)

-- Button click action
MyButton.MouseButton1Click:Connect(function()
    Creator.SafeCallback(function()
        game:GetService("Players").LocalPlayer:Kick("You clicked the button!")
    end)
end)

-- Add a small icon (if Creator.Icon exists)
if Creator.Icon then
    local Icon = Creator.New("ImageLabel", {
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundTransparency = 1,
        Image = Creator.Icon("lucide-star")[1] -- icon from Creator
    })
    Icon.Parent = MainFrame
end
