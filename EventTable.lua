local EventTable = {}

do 
    function EventTable.Create()
        return setmetatable({ AddedEvents = {}, RemovedEvents = {} }, EventTable)
    end

    function EventTable.__index(t, i)
        return EventTable[i] or rawget(t, i)
    end

    function EventTable:CallEvents(type, ...)
        for key, eventFunction in pairs(self[type .. "Events"]) do
            eventFunction(...)
        end
    end

    function EventTable:Added(eventFunction)
        self.AddedEvents[#self.AddedEvents + 1] = eventFunction
    end

    function EventTable:Removed(eventFunction)
        self.RemovedEvents[#self.RemovedEvents + 1] = eventFunction
    end

    function EventTable:RemoveEvent(type, eventFunction)
        local CurrentEvents = self[type .. "Events"]
        local CurrentIndex = table.find(CurrentEvents, eventFunction)
        
        if CurrentIndex then
            CurrentEvents[CurrentIndex] = nil
        end
    end
end

return EventTable