local EspLink = {}

do 
    function EspLink.Create(object, screenGui)
        local Esp = Instance.new("Frame")

        do
            local BottomLabel = Instance.new("TextLabel")

            local TextLabel = Instance.new("TextLabel")

            local Box = Instance.new("Frame")
            local Left = Instance.new("Frame")
            local Right = Instance.new("Frame")
            local Top = Instance.new("Frame")
            local Bottom = Instance.new("Frame")

            local Health = Instance.new("Frame")
            local Bar = Instance.new("Frame")

            Esp.Name = "Esp"
            Esp.Parent = screenGui
            Esp.BackgroundTransparency = 1.000

            BottomLabel.Name = "BottomLabel"
            BottomLabel.Parent = Esp
            BottomLabel.BackgroundTransparency = 1.000
            BottomLabel.Position = UDim2.new(0, 0, 1, 5)
            BottomLabel.Size = UDim2.new(1, 0, 0, 0)
            BottomLabel.Font = Enum.Font.Arial
            BottomLabel.Text = "Bottom Label"
            BottomLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            BottomLabel.TextStrokeTransparency = 0.750
            BottomLabel.TextYAlignment = Enum.TextYAlignment.Top

            TextLabel.Parent = Esp
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Position = UDim2.new(0, 0, 0, -5)
            TextLabel.Size = UDim2.new(1, 0, 0, 0)
            TextLabel.Font = Enum.Font.Arial
            TextLabel.Text = "Top Label"
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextStrokeTransparency = 0.750
            TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom

            Box.Name = "Box"
            Box.Parent = Esp
            Box.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            Box.BackgroundTransparency = 0.500
            Box.BorderSizePixel = 0
            Box.Size = UDim2.new(1, 0, 1, 0)

            Left.Name = "Left"
            Left.Parent = Box
            Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Left.BorderSizePixel = 0
            Left.Size = UDim2.new(0, 1, 1, 0)

            Right.Name = "Right"
            Right.Parent = Box
            Right.AnchorPoint = Vector2.new(1, 0)
            Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Right.BorderSizePixel = 0
            Right.Position = UDim2.new(1, 0, 0, 0)
            Right.Size = UDim2.new(0, 1, 1, 0)

            Top.Name = "Top"
            Top.Parent = Box
            Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Top.BorderSizePixel = 0
            Top.Size = UDim2.new(1, 0, 0, 1)

            Bottom.Name = "Bottom"
            Bottom.Parent = Box
            Bottom.AnchorPoint = Vector2.new(0, 1)
            Bottom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Bottom.BorderSizePixel = 0
            Bottom.Position = UDim2.new(0, 0, 1, 0)
            Bottom.Size = UDim2.new(1, 0, 0, 1)

            Health.Name = "Health"
            Health.Parent = Esp
            Health.AnchorPoint = Vector2.new(1, 0)
            Health.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            Health.BackgroundTransparency = 0.500
            Health.BorderSizePixel = 0
            Health.Position = UDim2.new(0, -2, 0, 0)
            Health.Size = UDim2.new(0, 4, 1, 0)

            Bar.Name = "Bar"
            Bar.Parent = Health
            Bar.AnchorPoint = Vector2.new(0.5, 1)
            Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Bar.BorderSizePixel = 0
            Bar.Position = UDim2.new(0.5, 0, 1, -1)
            Bar.Size = UDim2.new(0, 2, 0.5, -2)
        end

        return setmetatable({ Instances = { Object = object, GuiInstance = Esp } }, EspLink)
    end

    function EspLink.__index(t, i)
        return EspLink[i] or rawget(t, i) or rawget(rawget(t, "Instances"), i)
    end

    function EspLink:UpdateHealth(health)
        local TempHealth = health or self.Instances.Object:FindFirstChildOfClass("Humanoid").Health or 0
        print(TempHealth)
    end
end

return EspLink