Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnScriptStart", function() 
    AutoFood.Start()
    end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnScriptStop", function() 
    AutoFood.Stop()
    end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnPulse", function()
    AutoFood.OnPulse()
  end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnGUIDraw", function()
    AutoFood.OnGuiDraw()
  end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnAutoLoginAutoLoad", function()
    AutoFood.OnAutoLoginAutoLoad()
  end)