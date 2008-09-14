include( 'shared.lua' )
include( 'cl_spawnpanel.lua' )
include( 'cl_timerHUD.lua' )



local think = CurTime() + 0.1
local owner = " "
local location = " "
local DFC = 1

function GM:Think()
	if think > CurTime() then return end
	
	drawHUD(LocalPlayer())
	
	
	think = CurTime() + 0.1
end

function drawHUD()

	if(locationValid) then
	// DFC = math.Round(math.sqrt( (LocalPlayer():GetPos().x - locationPos.x)^2 + (LocalPlayer():GetPos().y - locationPos.y)^2 + (LocalPlayer():GetPos().z - locationPos.z)^2))
		draw.SimpleText(locationName, "ScoreboardText",  50, ScrH() -  150, Color(244, 187, 63, 255), 1, 1)
		draw.SimpleText(tostring( DFC  ), "ScoreboardText",  150, 150, Color(244, 187, 63, 255), 1, 1)
	end

end

function hidehud(name)
	for k, v in pairs{"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"} do
		if name == v then return false end
	end
end

hook.Add("Think", "gravityTick", gravityTick)
hook.Add("HUDPaint", "drawHUD", drawHUD) 
hook.Add("HUDShouldDraw", "hidehud", hidehud) 