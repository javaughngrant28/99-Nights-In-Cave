

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")


local ProfileStore = require(ServerStorage.Libraries.ProfileStore)
local PlayerDataTemplate = require(script.Parent.PlayerDataTemplate)
local PlayerLeaderstats = require(script.Parent.PlayerLeaderstats)



local  playerStoreName = RunService:IsStudio() and "Save_0" or "Data_0"
local PlayerStore = ProfileStore.New(playerStoreName, PlayerDataTemplate)
local PlayerProfiles = require(script.Parent.PlayerProfiles) :: {[Player]: typeof(PlayerStore:StartSessionAsync())}



local function PlayerAdded(player)
   local profile = PlayerStore:StartSessionAsync(`{player.UserId}`, {
      Cancel = function()
         return player.Parent ~= Players
      end,
   })

   if profile ~= nil then
      profile:AddUserId(player.UserId)
      profile:Reconcile()

      profile.OnSessionEnd:Connect(function()
         PlayerProfiles[player] = nil
         player:Kick(`Profile session end - Please rejoin`)
      end)

      if player.Parent == Players then
         PlayerProfiles[player] = profile
         print(`Profile loaded for {player.DisplayName}!`)

         PlayerLeaderstats.Create(player,PlayerProfiles[player].Data)
      else
         profile:EndSession()
      end

   else
      player:Kick(`Profile load fail - Please rejoin`)
   end

end

for _, player in Players:GetPlayers() do
   task.spawn(PlayerAdded, player)
end

Players.PlayerAdded:Connect(PlayerAdded)

Players.PlayerRemoving:Connect(function(player)
   local profile = PlayerProfiles[player]
   if profile ~= nil then
      profile:EndSession()
   end
end)