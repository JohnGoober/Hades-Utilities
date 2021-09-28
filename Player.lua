local Player = {}

do 
    function Player.__index(t, i)
        return Player[i] or rawget(t, i)
    end

    function Player.Create(player)
        local TempPlayer = { Character = player.Character }

        local function CharacterAdded(character)
            TempPlayer.Character = character
        end
        player.CharacterAdded:Connect(CharacterAdded)

        local function CharacterRemoved(character)
            TempPlayer.Character = character
        end
        player.CharacterRemoved:Connect(CharacterRemoved)

        return setmetatable(TempPlayer, Player)
    end
end

return Player
