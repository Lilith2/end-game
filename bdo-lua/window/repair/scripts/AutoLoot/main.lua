Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnScriptStart", function() 
    AutoLoot.Start()
    end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnScriptStop", function() 
    AutoLoot.Stop()
    end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnPulse", function() 
    AutoLoot.OnPulse()
    end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnGUIDraw", function()
    AutoLoot.OnGuiDraw()
  end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnRenderD2D", function()
    AutoLoot.OnRenderD2D()
  end)

Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnPacketReceive", AutoLoot.OnPacketReceive)