PLUGIN = nil
 
function Initialize(Plugin)
        Plugin:SetName("HomeTP")
        Plugin:SetVersion(2)
 
  cPluginManager.BindCommand("/addhome", "hometp.addhome", Addhome, " ~ Teleports a player home");
 
        -- Hooks
 
        PLUGIN = Plugin -- NOTE: only needed if you want OnDisable() to use GetName() or something like that
 
        -- Command Bindings
 
        LOG("Initialised " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
        return true
end
 
function SetHome(Split)
 
if (#Split ~= 2) then
                -- There was more or less than one argument (excluding the "/explode" bit)
                -- Send the proper usage to the player and exit
                Player:SendMessage("Usage: /addhome [home name]")
                return true
        end
 
local coordinateX = cPlayer.GetPosX;
local coordinateY = cPlayer.GetPosY;
local coordinateZ = cPlayer.GetPosZ;
 
local homeName;
 
 
end
 
function OnDisable()
        LOG(PLUGIN:GetName() .. " is shutting down...")
end
