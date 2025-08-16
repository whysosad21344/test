-- Load Creator library
local Creator = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/whysosad21344/test/main/Creator.lua"))()


-- Set a theme
Creator.SetTheme({
    Background = "#1e1e2f",
    TextColor = "#ffffff",
    Button = "#039be5",
    ButtonHover = "#0277bd",
    Icon = "#ffffff"
})

-- Create main window
local MainFrame = Creator.New("Frame", {
    Size = UDim2.new(0, 400, 0, 300),
    Position = UDim2.new(0.5, -200, 0.5, -150),
    BackgroundColor3 = Color3.fromHex("#1e1e2f")
})
MainFrame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Add a title
local Title = Creator.New("TextLabel", {
    Text = "🎨 My Cool UI",
    Size = UDim2.new(1, 0, 0, 50),
    BackgroundTransparency = 1,
    TextSize = 24,
    TextColor3 = Color3.fromHex("#ffffff"),
    Font = Enum.Font.GothamBold
})
Title.Parent = MainFrame

-- Add a button
local MyButton = Creator.New("TextButton", {
    Text = "Click Me!",
    Size = UDim2.new(0, 120, 0, 40),
    Position = UDim2.new(0.5, -60, 0.5, -20),
    BackgroundColor3 = Color3.fromHex("#039be5"),
    TextColor3 = Color3.fromHex("#ffffff"),
    AutoButtonColor = true,
    Font = Enum.Font.Gotham
})
MyButton.Parent = MainFrame

-- Button hover effect
MyButton.MouseEnter:Connect(function()
    MyButton.BackgroundColor3 = Color3.fromHex("#0277bd")
end)
MyButton.MouseLeave:Connect(function()
    MyButton.BackgroundColor3 = Color3.fromHex("#039be5")
end)

-- Button click event
MyButton.MouseButton1Click:Connect(function()
    Creator.SafeCallback(function()
        print("Button clicked!")
    end)
end)
