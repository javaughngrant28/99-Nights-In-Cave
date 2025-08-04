local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlayerGui = script.Parent.Parent.Parent
local GameUI = PlayerGui.GameUI
local HudFrame = GameUI.HUD

local imageLable = HudFrame:FindFirstChild('FoundCoin',true) :: ImageLabel
local textLable = imageLable:FindFirstChildWhichIsA('TextLabel',true) :: TextLabel

local VISABLE_DURATION = 4
local lastTimeCoinFound: number
local isLooping = false
local CurrentAmountFound = 0


local FoundEvent: RemoteEvent = ReplicatedStorage.Events.Coin.Found

local function Delay()
    while tick() - lastTimeCoinFound < VISABLE_DURATION do
        task.wait(.1)
    end
end


local function CoinFound(amount: number)
    CurrentAmountFound += amount

    lastTimeCoinFound = tick()
    textLable.Text = `{CurrentAmountFound}`
    imageLable.Visible = true
    
    if isLooping then
        return
    else
        isLooping = true
        Delay()
        isLooping = false
        imageLable.Visible = false
        CurrentAmountFound = 0
    end
end

FoundEvent.OnClientEvent:Connect(CoinFound)


