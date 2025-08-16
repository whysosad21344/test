-- main.lua
local Library = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/whysosad21344/test/main/Creator.lua"))()

local Window = Library:CreateWindow({Title="My Script"})

Window:AddButton({
    Text="Click Me!",
    Callback=function()
        print("Button clicked!")
    end
})

Window:AddToggle({
    Text="Enable Feature",
    Default=false,
    Callback=function(state)
        print("Toggle state:", state)
    end
})

Window:AddTextbox({
    Text="",
    Placeholder="Type something...",
    Callback=function(input)
        print("Input:", input)
    end
})
