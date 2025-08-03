local DEFAULT_DAY_DURATION = 30 -- How long the day lasts in seconds
local DEFAULT_NIGHT_DURATION = 30 -- How long the night lasts in seconds
local DEFAULT_DAY_SPEED_BOOST = 1 -- Day speed multiplier
local DEFAULT_NIGHT_SPEED_BOOST = 1 -- Night speed multiplier


return {
    DAY_TIME = 6, -- Starting Time Of Day
    NIGHT_TIME = 18, -- When Night Starts
    
    DayDuration = DEFAULT_DAY_DURATION,
    NightDuration = DEFAULT_NIGHT_DURATION,
    DaySpeedBoost = DEFAULT_DAY_SPEED_BOOST,
    NightSpeedBoost = DEFAULT_NIGHT_SPEED_BOOST,
}
