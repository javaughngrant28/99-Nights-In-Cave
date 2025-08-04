local Signal = require(game.ReplicatedStorage.Shared.Libraries.Signal)

local CreateSignal = Signal.new()
local FoundCoinSignal = Signal.new()

local API = {}

function API._GetCreateSignal(): Signal.SignalType
    return CreateSignal
end

function API._GetFoundCoinSignal(): Signal.SignalType
    return FoundCoinSignal
end

function API.Create(location: Part | Vector3)
    CreateSignal:Fire(location)
end

function API.FoundCoin(player: Player, amount: number)
    FoundCoinSignal:Fire(player, amount)
end

return API