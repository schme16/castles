
				/***************************************************************************************************/
				/*******************************************Prop Damage System**************************************/
				/***************************************************************************************************/


function propDamageSetup(ent)
		if(!ent:IsPlayer() and !ent:IsWeapon() and !ent:IsWorld() and  ent.healthSet == nil) then
			ent:SetHealth(200)
			ent.healthSet = true
			if(CastleDebug) then 
				print("Added ".. 200 .. " Health to Entity:",ent)
			end
		end
end

function propDamageSetup(ent)
		if(!ent:IsPlayer() and !ent:IsWeapon() and !ent:IsWorld() and  ent.healthSet == nil) then
			ent:SetHealth(200)
			ent.healthSet = true
			if(CastleDebug) then 
				print("Added ".. 200 .. " Health to Entity:",ent)
			end
		end
end