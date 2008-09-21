
				/***************************************************************************************************/
				/*******************************************Prop Damage System**************************************/
				/***************************************************************************************************/


function propDamageSetup(ent, health)
		if(ent:GetClass() == "prop_physics") then
			ent:SetHealth(health)
			ent:SetKeyValue("physdamagescale","99")
			ent:SetKeyValue("explodedamage","10")
			ent:SetKeyValue("exploderadius","100")
			ent.healthSet = true
			if(CastleDebug) then 
				print("Added ".. health .. " Health to Entity:",ent)
			end
		end
end

function propDamageCheck(ent)
		if(ent:GetClass() == "prop_physics") then
			if(CastleDebug) then 
				print("Prop ("..tostring(ent)..")has "..ent:Health().." Health Left")
			end
		end
end