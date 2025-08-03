local ReplicatedStorage = game:GetService("ReplicatedStorage")

local DayNightValues = ReplicatedStorage.Values.DayNightCycle
local DayCount: NumberValue = DayNightValues.DayCount
local DayBoost: NumberValue = DayNightValues.DaySpeedBoost

local ScreenGui = script.Parent.Parent.Parent.GameUI
local HUDFrame = ScreenGui.HUD
local DayLable: TextLabel = HUDFrame:FindFirstChild('Day',true)
local MultiplierLable: TextLabel = DayLable:FindFirstChild('Multiplier', true)

local function UpdateDayCount()
    DayLable.Text = `Day {DayCount.Value}`
end

local function UpdateMultiplier()
    MultiplierLable.Text = `x{DayBoost.Value}`
end

DayCount.Changed:Connect(UpdateDayCount)
DayBoost.Changed:Connect(UpdateMultiplier)

UpdateDayCount()
UpdateMultiplier()

