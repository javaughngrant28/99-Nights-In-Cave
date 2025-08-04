local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CreateCoin = require(script.Parent.CreateCoin)
local CoinAPI = require(script.Parent.CoinAPI)
local PlayerCoin = require(script.Parent.PlayerCoins)


local CreateSignal = CoinAPI._GetCreateSignal()
local FoundCoinSignal = CoinAPI._GetFoundCoinSignal()

local FoundEvent: RemoteEvent = ReplicatedStorage.Events.Coin.Found



local function Create(location: Part | Vector3)
    local cframe = typeof(location) == "Vector3" and CFrame.new(location) or location.CFrame
    CreateCoin.Fire(cframe)
end

local function FoundCoin(player: Player, amount: number)
    PlayerCoin.Add(player,amount)
    FoundEvent:FireClient(player,amount)
end



CreateSignal:Connect(Create)
FoundCoinSignal:Connect(FoundCoin)

Create(Vector3.new(14, 6, 35.5))
Create(Vector3.new(14, 12, 35.5))
Create(Vector3.new(-6.5, 6, 35.5))


