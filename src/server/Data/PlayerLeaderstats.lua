
local PlayerDataTemplate = require(script.Parent.PlayerDataTemplate)

local function CreateLeaderStats(player: Player, Data: PlayerDataTemplate.DataType)

    local folder = Instance.new('Folder')
    folder.Name = 'leaderstats'
    folder.Parent = player

    local Coins = Instance.new('NumberValue')
    Coins.Name = 'Coins'
    Coins.Value = Data.Coins
    Coins.Parent = folder
end

return {
    Create = CreateLeaderStats
}