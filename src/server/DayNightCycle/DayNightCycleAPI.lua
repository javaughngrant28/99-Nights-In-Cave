local Signal = require(game.ReplicatedStorage.Shared.Libraries.Signal)

local UpdateDayTimeBoostSignal = Signal.new()
local UpdateNightTimeBoostSignal = Signal.new()


local API = {}

function API._GetUpdateDayTimeBoostSignal(): Signal.SignalType
    return UpdateDayTimeBoostSignal
end

function API._GetUpdateNightTimeBoostSignal(): Signal.SignalType
    return UpdateNightTimeBoostSignal
end


function API.UpdateDayTimeBoost(newBoost: number)
    UpdateDayTimeBoostSignal:Fire(newBoost)
end

function API.UpdateNightTimeBoostSignal(newBoost: number)
    UpdateNightTimeBoostSignal:Fire(newBoost)
end


return API