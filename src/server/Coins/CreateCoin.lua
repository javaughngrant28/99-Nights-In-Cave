local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CoinModel: Model = ReplicatedStorage.Assets.Models.CoinModel

local Binder = require(game.ReplicatedStorage.Shared.Binder)
local Coin = require(script.Parent.Coin)

local binder = Binder.new("Coin",Coin)
binder:bind()


local function GetCoinModel(): Model
    assert(CoinModel.PrimaryPart,`{CoinModel} Has No PrimaryPart`)
    local modelClone = CoinModel:Clone()
    modelClone:AddTag('Coin')
    return modelClone
end


local function CreateCoinAtLocation(location: CFrame)
    local coinModel = GetCoinModel()
    coinModel.PrimaryPart.CFrame = location
    coinModel.Parent = workspace
end


return {
    Fire = CreateCoinAtLocation
}