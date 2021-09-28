local Player = {}

local Camera = game.Workspace.CurrentCamera
local OriginOffset = Vector3.new(0, 1.5, 0)

do 
    function Player.Create(player, parent)
        local TempPlayer = { Instance = player, UI = { Rectangle = {} } }
        local UI = TempPlayer.UI

        UI.Esp = Instance.new("Frame")
        
        UI.Rectangle.Box = Instance.new("Frame")
        UI.Rectangle.Left = Instance.new("Frame")
        UI.Rectangle.Right = Instance.new("Frame")
        UI.Rectangle.Top = Instance.new("Frame")
        UI.Rectangle.Bottom = Instance.new("Frame")

        -- Properties
        do
            UI.Esp.Name = "Esp"
            UI.Esp.Parent = parent
            UI.Esp.BackgroundTransparency = 1.000
            UI.Esp.BorderSizePixel = 0
            UI.Esp.AnchorPoint = Vector2.new(0.5, 0.5)
            
            UI.Rectangle.Box.Name = "Box"
            UI.Rectangle.Box.Parent = UI.Esp
            UI.Rectangle.Box.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            UI.Rectangle.Box.BackgroundTransparency = 0.500
            UI.Rectangle.Box.BorderSizePixel = 0
            UI.Rectangle.Box.Size = UDim2.new(1, 0, 1, 0)
            
            UI.Rectangle.Left.Name = "Left"
            UI.Rectangle.Left.Parent = UI.Rectangle.Box
            UI.Rectangle.Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            UI.Rectangle.Left.BorderSizePixel = 0
            UI.Rectangle.Left.Size = UDim2.new(0, 1, 1, 0)
            
            UI.Rectangle.Right.Name = "Right"
            UI.Rectangle.Right.Parent = UI.Rectangle.Box
            UI.Rectangle.Right.AnchorPoint = Vector2.new(1, 0)
            UI.Rectangle.Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            UI.Rectangle.Right.BorderSizePixel = 0
            UI.Rectangle.Right.Position = UDim2.new(1, 0, 0, 0)
            UI.Rectangle.Right.Size = UDim2.new(0, 1, 1, 0)
            
            UI.Rectangle.Top.Name = "Top"
            UI.Rectangle.Top.Parent = UI.Rectangle.Box
            UI.Rectangle.Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            UI.Rectangle.Top.BorderSizePixel = 0
            UI.Rectangle.Top.Size = UDim2.new(1, 0, 0, 1)
            
            UI.Rectangle.Bottom.Name = "Bottom"
            UI.Rectangle.Bottom.Parent = UI.Rectangle.Box
            UI.Rectangle.Bottom.AnchorPoint = Vector2.new(0, 1)
            UI.Rectangle.Bottom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            UI.Rectangle.Bottom.BorderSizePixel = 0
            UI.Rectangle.Bottom.Position = UDim2.new(0, 0, 1, 0)
            UI.Rectangle.Bottom.Size = UDim2.new(1, 0, 0, 1)
        end

        return setmetatable(TempPlayer, Player)
    end

    function Player.__index(t, i)
        return Player[i] or rawget(t, i) or rawget(t, "Instance")[i]
    end

    function Player:UpdateEsp()
        if self.Character  then
            local PrimaryPart = self.Character.PrimaryPart
            local Head = self.Character:WaitForChild("Head")

            local PrimaryPartPosition, PrimaryPartVisible = Camera:WorldToScreenPoint(PrimaryPart.Position)
            local HeadPosition, HeadVisible = Camera:WorldToScreenPoint(Head.Position)
            local OriginPosition, OriginVisible = Camera:WorldToScreenPoint(PrimaryPart.Position - OriginOffset)

            self.UI.Esp.Visible = OriginVisible and HeadPosition

            if self.UI.Esp.Visible then
                local HeadOriginDelta = (OriginPosition.Y - HeadPosition.Y) * 1.5
                local HeadEspDifference = Vector2.new(HeadPosition.X, HeadPosition.Y) - self.UI.Esp.AbsolutePosition

                self.UI.Esp.Position = UDim2.fromOffset(PrimaryPartPosition.X, PrimaryPartPosition.Y)
                self.UI.Esp.Size = UDim2.fromOffset(HeadOriginDelta / 2, HeadOriginDelta)
                self.UI.Dot.Head.Position = UDim2.fromOffset(HeadEspDifference.X, HeadEspDifference.Y)
            end
        end
    end
end

return Player
