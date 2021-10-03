local Object = {}

do 
    function Object.Create(objectType, instance)
        return setmetatable({ Type = objectType, Name = instance.Name, Instances = { Primary = instance } }, Object)
    end

    function Object.__index(t, i)
        return Object[i] or rawget(t, i) or rawget(rawget(t, "Instances"), i)
    end
end

return Object