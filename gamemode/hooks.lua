
function GM:PlayerNoClip( pl, on )
	--no clip allowed in singleplayer, on planets, is turning off noclip, is admin, or SB_PlanetNoClipOnly is off
	--TODO, allow a little margin away from planet for before disabing noclip so players do get stuck in the walls around the edges of the planets
	if (SinglePlayer()) then return true end
	return false
end

function GM:PlayerSay( ply, txt )
	return(txt)
end
