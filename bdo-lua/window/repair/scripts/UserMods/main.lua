Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnScriptStart", function() 
    UserMods.Start()
    end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnScriptStop", function() 
    UserMods.Stop()
    end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnPulse", function()
    UserMods.OnPulse()
  end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnGUIDraw", function()
    UserMods.OnGuiDraw()
  end)

Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnPacketReceive", UserMods.OnPacketReceive)