--[[
        -----Studio Command Bar ModuleScript Auto Loader by dennis96411/PickleSammiches-----
        The purpose of this plugin is to auto-require a ModuleScript and set a reference to it for the studio command bar environment.
       
        Change ScriptName to the name of your ModuleScript, VariableName to the name of the variable you want to access the ModuleScript from in the command bar, and AutoReload to whether you want the variable to auto-update on source change. Add any additional scripts you would like to open up a tab for automatically to the AuxiliaryScripts table.
       
        On initial load, a statement will be printed by the TestService in orange. Copy and paste the last line of the statement and execute it in the command bar. This will make a reference in your studio command bar environment to your ModuleScript. If AutoReload is set to true, subsequential updates to the ModuleScript source will cause the variable to update automatically without user intervention (you MUST switch out of the source code tab/window after changing your ModuleScript's source for ROBLOX to acknowledge a change to the source).
]]
ScriptName, VariableName, AutoReload = "RBXunderscore", "_", true
Script, Plugin, TestService, LoadCommand = game:FindFirstChild(ScriptName, true), PluginManager():CreatePlugin(), game:GetService("TestService"), VariableName .. " = _G[\"" .. VariableName .. "\"]"
AuxiliaryScripts = {
        game:GetService("ServerScriptService").ServerTest
}
 
LoadScript = function(Script, ReloadMode)
        _G[VariableName] = require(Script)
        if AutoReload then Script.Changed:connect(function(Property) if Property == "Source" then ReloadScript(Script) end end) end
        Plugin:OpenScript(Script)
        TestService:Warn(false, ReloadMode and (AutoReload and ScriptName .. " has been reloaded." or "Reload " .. ScriptName .. " (copy and execute):\n" .. LoadCommand) or ("Load " .. ScriptName .. " (copy and execute):\n" .. (AutoReload and "repeat " .. LoadCommand .. " until not wait(1)" or LoadCommand)))
end
 
ReloadScript = function(Script)
        local Source, Parent = Script.Source, Script.Parent
        wait() --Prevents studio from crashing from Ctrl-Tabbing out of the ModuleScript source, because reasons
        Script:Destroy() --We have to create a new script for "require" to see the new source, because more reasons
        Script = ScriptCopy:Clone()
        Script.Source = Source; Script.Parent = Parent; Script.Name = ScriptName
        LoadScript(Script, true)
end
 
game.DescendantAdded:connect(function(Instance)
        if not DescendantAddedDebounce and pcall(function() return Instance.Name end) then
                DescendantAddedDebounce = true
                if Instance == Script then
                        ReloadScript(Script)
                elseif Instance.Name == ScriptName then
                        LoadScript(Script)
                end
                wait(); DescendantAddedDebounce = false
        end
end)
 
if Script then
        wait(0.5) --Let game render tab open first
        ScriptCopy = Script:Clone(); ScriptCopy.Name = "" --Change name to something different from the original to avoid triggering events
        table.foreach(AuxiliaryScripts, function(_, Script) Plugin:OpenScript(Script) end)
        LoadScript(Script)
end
