local Creator = {}

function Creator.New(class, props)
    local obj = Instance.new(class)
    for k,v in pairs(props) do
        obj[k] = v
    end
    return obj
end

function Creator.SetTheme(theme)
    
end

function Creator.Icon(name)
    return {"rbxassetid://0"}
end

function Creator.SafeCallback(fn)
    local success, err = pcall(fn)
    if not success then
        warn(err)
    end
end

return Creator
