skyvrversion = '2.0.0'

VR_Model_Customization_GUI = game:GetObjects("rbxassetid://18596045046")[1]
VR_Model_Customization_GUI.Parent = game.CoreGui

loadstring(game:HttpGet("https://raw.githubusercontent.com/loadlua/skyvr/main/VRCustomizationMain.lua"))()
coroutine.wrap(fakescript)()
