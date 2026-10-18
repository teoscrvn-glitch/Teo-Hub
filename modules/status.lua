local Status = { label = nil, screen = nil }

function Status.init(context)
    local screen = Instance.new("ScreenGui")
    screen.Name = "TeoCoreStatus"
    screen.ResetOnSpawn = false

    local label = Instance.new("TextLabel")
    label.Name = "StatusLabel"
    label.Size = UDim2.new(0, 320, 0, 30)
    label.Position = UDim2.new(1, -330, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    label.BackgroundTransparency = 0.2
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 13
    label.Text = "TÉO HUB CORE 2026: starting..."
    label.Parent = screen

    screen.Parent = game:GetService("CoreGui")
    Status.screen, Status.label = screen, label
end

function Status.set(message)
    if Status.label and Status.label.Parent then
        Status.label.Text = "Trạng thái: " .. tostring(message)
    end
end

return Status
