local Player = {}

local LocalPlayer = game.Players.LocalPlayer.Character

do 
    function Player.__index(t, i)
        return Player[i] or rawget(t, i) or rawget(t, "Instance")[i]
    end

    function Player.Create(player)
        local TempPlayer = { Instance = player, Info = {} }

        local function PositionChanged()
            if LocalPlayer.Character then
                TempPlayer.Info.Distance = (player.Character.PrimaryPart.Position - LocalPlayer.Character.PrimaryPart.Position).Magnitude
                print(TempPlayer.Info.Distance)
            end
        end

        local function CharacterAdded(character)
            repeat wait() until character.PrimaryPart
            character.PrimaryPart:GetPropertyChangedSignal("Position"):Connect(PositionChanged)
        end
        player.CharacterAdded:Connect(CharacterAdded)

        return setmetatable(TempPlayer, Player)
    end
end

return Player
