local UI = { screen = nil, buttons = {} }

function UI.init(context)
    local config = context.Config
    local screen = Instance.new("ScreenGui")
    screen.Name = "TeoHubCore"
    screen.ResetOnSpawn = false

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, config.UI.Width, 0, config.UI.Height)
    frame.Position = UDim2.new(0.72, 0, 0.25, 0)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    frame.BorderSizePixel = 0
    frame.Active, frame.Draggable = true, true
    frame.Parent = screen

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 32)
    title.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    title.TextColor3 = Color3.fromRGB(255, 215, 0)
    title.Text = "TÉO HUB CORE 2026"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 15
    title.Parent = frame

    local names = {}
    for name in pairs(config.Features) do table.insert(names, name) end
    table.sort(names)

    for index, name in ipairs(names) do
        local enabled = config.Features[name]
        local row = Instance.new("Frame")
        row.Size = UDim2.new(1, -12, 0, 28)
        row.Position = UDim2.new(0, 6, 0, 38 + (index - 1) * 31)
        row.BackgroundTransparency = 1
        row.Parent = frame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 160, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Text = name
        label.Font = Enum.Font.GothamSemibold
        label.TextSize = 12
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = row

        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, 48, 0, 22)
        button.Position = UDim2.new(1, -48, 0.5, -11)
        button.BackgroundColor3 = enabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(140, 30, 30)
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Text = enabled and "ON" or "OFF"
        button.Font = Enum.Font.GothamBold
        button.TextSize = 11
        button.Parent = row
        UI.buttons[name] = button

        button.MouseButton1Click:Connect(function()
            config.Features[name] = not config.Features[name]
            local state = config.Features[name]
            button.Text = state and "ON" or "OFF"
            button.BackgroundColor3 = state and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(140, 30, 30)
            if context.Status and context.Status.set then
                context.Status.set(name .. (state and " enabled" or " disabled"))
            end
        end)
    end

    context.UserInputService.InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == config.ToggleKey then
            screen.Enabled = not screen.Enabled
        end
    end)

    screen.Parent = game:GetService("CoreGui")
    UI.screen = screen
end

return UI
