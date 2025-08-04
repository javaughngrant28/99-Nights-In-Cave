
local function SetPlayerCoinValue(player: Player, amount: number)
    print(player,'SET COIN AMOUNT TO',amount)
end

local function AddToPlayerCoinValue(player: Player, amount: number)
    print(player,'ADDED TO COIN AMOUNT',amount)
end

local function SubPlayerCoinValue(player: Player, amount: number)
    print(player,'SUB COIN AMOUNT',amount)
end

return {
    Set = SetPlayerCoinValue,
    Add = AddToPlayerCoinValue,
    Sub = SubPlayerCoinValue,
}