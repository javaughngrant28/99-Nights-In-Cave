local Players = game:GetService("Players")

local MaidModule = require(game.ReplicatedStorage.Shared.Libraries.Maid)
local CoinAPI = require(script.Parent.CoinAPI)


export type CoinType = {
    Model: Model,
    Amount: number,

    new: (Model: Model) -> CoinType,
    Destroy: (self: CoinType) -> nil,
}


local Coin = {}
Coin.__index = Coin

Coin.Model = nil
Coin._MAID = nil
Coin.Amount = 4



function Coin.new(Model: Model): CoinType
    local self = setmetatable({}, Coin)
    self:__Constructor(Model)
    return self
end


function Coin:__Constructor(Model: Model)
    self._MAID = MaidModule.new()
    self.Model = Model
    print(Model)

    self:_TouchConnection()
end

function Coin:_TouchConnection()
    local part = self.Model.PrimaryPart :: Part
    local touched = false

    self._MAID['Connection'] = part.Touched:Connect(function(hit: Part)
        if touched then return end

        local player = Players:GetPlayerFromCharacter(hit.Parent)
        if not player then return end

        touched = true

        CoinAPI.FoundCoin(player,self.Amount)
        self.Model:Destroy()
    end) 
end


function Coin:Destroy()
    self._MAID:Destroy()
    for index, _ in pairs(self) do
         self[index] = nil
     end
end

return Coin


