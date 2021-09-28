local Player = {}

do 
    function Player.__index(t, i)
        return Player[i] or rawget(t, i) or rawget(t, "Instance")[i]
    end

    function Player.Create(player)
        local TempPlayer = { Instance = player }

        return setmetatable(TempPlayer, Player)
    end
end

return Player
