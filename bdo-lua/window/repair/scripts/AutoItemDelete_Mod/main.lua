Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnScriptStart", function()
  AutoItemDelete.Start()
end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnScriptStop", function()
  AutoItemDelete.Stop()
end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnGUIDraw", function()
  AutoItemDelete.OnGuiDraw()
end)
Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnAutoLoginAutoLoad", function()
  AutoItemDelete.OnAutoLoginAutoLoad()
end)

Infinity.Scripting.CurrentScript:RegisterCallback("Infinity.OnPulse", AutoItemDelete.OnPulse)