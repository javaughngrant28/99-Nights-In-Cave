
local CreateCoin = require(script.Parent.CreateCoin)
local CoinAPI = require(script.Parent.CoinAPI)
local PlayerCoin = require(script.Parent.PlayerCoins)



local CreateSignal = CoinAPI._GetCreateSignal()
local FoundCoinSignal = CoinAPI._GetFoundCoinSignal()



local function Create(location: Part | Vector3)
    local cframe = typeof(location) == "Vector3" and CFrame.new(location) or location.CFrame
    CreateCoin.Fire(cframe)
end

local function FoundCoin(player: Player, amount)
    PlayerCoin.Add(player,amount)
end



CreateSignal:Connect(Create)
FoundCoinSignal:Connect(FoundCoin)

Create(Vector3.new(14, 3.5, 35.5))


