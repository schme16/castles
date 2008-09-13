include( 'shared.lua' )

local think = CurTime() + 0.5
local owner = " "
local location = " "
local DFC = 1
//local locationPos = " "
function GM:Think()
	if think > CurTime() then return end
	
	drawHUD(LocalPlayer())
	
	
	think = CurTime() + 1
end




function drawHUD()

	if(locationValid) then
	// DFC = math.Round(math.sqrt( (LocalPlayer():GetPos().x - locationPos.x)^2 + (LocalPlayer():GetPos().y - locationPos.y)^2 + (LocalPlayer():GetPos().z - locationPos.z)^2))
		draw.SimpleText(locationName, "ScoreboardText",  50, ScrH() -  150, Color(244, 187, 63, 255), 1, 1)
		draw.SimpleText(tostring( DFC  ), "ScoreboardText",  150, 150, Color(244, 187, 63, 255), 1, 1)
	end

end

function locationName_HUD( um )
	locationName = um:ReadString()
end

function locationOwner_HUD( um )
	pnaetOwner = um:ReadString()
end

function locationValid_HUD( um )
	locationValid = tobool(um:ReadString())
end

-- function locationPosX( um )
	-- locationPos.x = um:ReadString()
-- end

-- function locationPosY( um )
	-- locationPos.y = um:ReadString()
-- end

-- function locationPosZ( um )
	-- locationPos.z = um:ReadString()
-- end

function locationRadius_HUD( um )
	valid = um:ReadLong()
end

function hidehud(name)
	for k, v in pairs{"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"} do
		if name == v then return false end
	end
end


usermessage.Hook("locationValid_HUD", locationValid_HUD) 
usermessage.Hook("locationRadius_HUD", locationValid_HUD) 
-- usermessage.Hook("locationPosX", locationPosX) 
-- usermessage.Hook("locationPosY", locationPosY) 
-- usermessage.Hook("locationPosZ", locationPosZ) 
usermessage.Hook("locationOwner_HUD", locationOwner_HUD) 
usermessage.Hook("locationName_HUD", locationName_HUD) 
hook.Add("Think", "gravityTick", gravityTick)
hook.Add("HUDPaint", "drawHUD", drawHUD)
hook.Add("HUDShouldDraw", "hidehud", hidehud) 