
local CoinAPI = require(script.Parent.CoinAPI)
local PlayerCoin = require(script.Parent.PlayerCoins)


local CreateSignal = CoinAPI._GetCreateSignal()
local FoundCoinSignal = CoinAPI._GetFoundCoinSignal()


local function Create(location: Part | Vector3)
    local cframe = typeof(location) == "Vector3" and CFrame.new(location) or location.CFrame
    print(cframe,'Can Not Create Coin In Lobby. I removed it')
end

local function FoundCoin(player: Player, amount: number)
    PlayerCoin.Add(player,amount)
end


CreateSignal:Connect(Create)
FoundCoinSignal:Connect(FoundCoin)


