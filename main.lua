local Library = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/whysosad21344/test/main/Creator.lua"))()

local Window = Library:CreateWindow({Title="My Script"})

Window:AddButton({
    Text="Click Me!",
    Callback=function() print("Clicked!") end
})

Window:AddToggle({
    Text="Enable Feature",
    Default=false,
    Callback=function(state) print("Toggle:", state) end
})

Window:AddTextbox({
    Text="Enter Name",
    Placeholder="Type here...",
    Callback=function(input) print("Input:", input) end
})
