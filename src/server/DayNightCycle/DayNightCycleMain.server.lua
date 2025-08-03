local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local dayNightConfig = require(script.Parent.DayNightCycleConfig)
local dayNightAPI = require(script.Parent.DayNightCycleAPI)

local UpdateDayTimeBoostSignal = dayNightAPI._GetUpdateDayTimeBoostSignal()
local UpdateNightTimeBoostSignal = dayNightAPI._GetUpdateNightTimeBoostSignal()

local dayNightValues = ReplicatedStorage.Values.DayNightCycle
local IsDay: BoolValue = dayNightValues.IsDay
local DaySpeedBoost: NumberValue = dayNightValues.DaySpeedBoost
local NightSpeedBoost: NumberValue = dayNightValues.NightSpeedBoost
local DayCount: NumberValue = dayNightValues.DayCount


local cycleTime = 0
local currentDuration = dayNightConfig.DayDuration / dayNightConfig.DaySpeedBoost
Lighting.ClockTime = dayNightConfig.DAY_TIME

IsDay.Value = true
DaySpeedBoost.Value = dayNightConfig.DaySpeedBoost
NightSpeedBoost.Value = dayNightConfig.NightSpeedBoost
DayCount.Value = 1


local function Cycle(deltaTime)
	cycleTime += deltaTime

	local dayDuration = dayNightConfig.DayDuration / dayNightConfig.DaySpeedBoost
	local nightDuration = dayNightConfig.NightDuration / dayNightConfig.NightSpeedBoost

	local progress = cycleTime / currentDuration
	if progress >= 1 then
		IsDay.Value = not IsDay.Value
		cycleTime = 0
		currentDuration = IsDay.Value and dayDuration or nightDuration

		if IsDay.Value then
			DayCount.Value += 1
		end
	end

	if IsDay.Value then
		Lighting.ClockTime = dayNightConfig.DAY_TIME + (12 * progress)
	else
		local clockTime = dayNightConfig.NIGHT_TIME + (12 * progress)
		if clockTime >= 24 then
			clockTime -= 24
		end
		Lighting.ClockTime = clockTime
	end
end


local function UpdateDayTimeBoost(newBoost: number)
    dayNightConfig.DaySpeedBoost = newBoost
    DaySpeedBoost.Value = newBoost
end

local function UpdateNightTimeBoost(newBoost: number)
    dayNightConfig.NightSpeedBoost = newBoost
    NightSpeedBoost.Value = newBoost
end

UpdateDayTimeBoostSignal:Connect(UpdateDayTimeBoost)
UpdateNightTimeBoostSignal:Connect(UpdateNightTimeBoost)
RunService.Heartbeat:Connect(Cycle)
