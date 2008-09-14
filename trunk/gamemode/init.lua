

				/***************************************************************************************************/
				/***********************************************CASTLE********************************************/
				/***************************************************************************************************/
/*------------------------------------------------
Castle Credits:
	Original Concept: Big Blue/Large Aqua: (http://forums.facepunchstudios.com/showthread.php?t=603387)
	Coding: Josef Stalin
	Mapping: Original Concept: Big Blue/Large Aqua

	Version: 0.5
------------------------------------------------*/
				
				
/************************************************************/
/**********************Calling the Incudes*********************/
/************************************************************/				
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( 'cl_spawnpanel.lua' )
AddCSLuaFile( 'cl_spawnmenu.lua' )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )
include( 'hooks.lua' )



/***********************************************************/
/********************Variable Initialization*******************/
/***********************************************************/

Locations = {}
local locationsEmpty = true
PW_Debug = true
useGravity = true
gravGunExcludes = {
{name = "Colony", class = "spawner"},
{name = "Atlantis DHD", class = "dhd_atlantis"},
{name = "SG1 DHD", class = "dhd_sg1"},
{name = "Base DHD", class = "dhd_base"},
{name = "Stargate SG1", class = "stargate_sg1"},
{name = "Stargate Atlantis", class = "stargate_atlantis"},
{name = "Stargate Base", class = "stargate_base"},



}



/***********************************************************/
/*************************Functions*************************/
/***********************************************************/

function GM:Think()
if CurTime() < (nexttime or 0) then return end
nexttime = CurTime() + 0.1

/*This is the locations setup and update call*/
	if(locationsEmpty) then
		locationsSetup()
		locationsEmpty = false
	else
		locationsTick()		
	end

	
end

function GM:InitPostEntity()
end

function GM:PlayerSpawn(ply)
	hook.Call("PlayerLoadout", GAMEMODE, ply)
	hook.Call("PlayerSetModel", GAMEMODE, ply)
	ply:SetTeam(1)
	ply:SetGravity(0)
end

function GM:PlayerInitialSpawn(ply)

end

function GM:PlayerLoadout(ply)
	ply:Give("gmod_tool")
	ply:Give("weapon_physgun")
end

function locationsSetup() --Sets the locations up; Spacebuild Compatible

	for k,v in pairs(ents.FindByClass("logic_case")) do
		locationTemp = v:GetKeyValues()
		if(tostring(locationTemp.Case04) == "location") then
			local tableTemp =
				{
					Index = #Locations+1,
					Name = locationTemp.Case01,
					Gravity = locationTemp.Case02,
					Radius = tonumber(locationTemp.Case03) / 2,
					Diameter = locationTemp.Case03,
					Type = locationTemp.Case04,
					Position = v:GetPos(),
					Owner = "None"
				}
								
			table.insert(Locations, #Locations+1, tableTemp)
			
			gravity = ents.Create("point_push")
			gravity:SetPos(v:GetPos())
			gravity.enabled = true
			gravity.magnitude  = 100
			gravity.inner_radius = (tonumber(locationTemp.Case03) / 2) +300
			gravity.radius  = (tonumber(locationTemp.Case03) / 2) +300
			if(gravity:IsValid()) then  gravStatus = "Successfully" else  gravStatus = "Unsuccessfully" end
			
			if(PW_Debug) then
				print("Location Added:", tableTemp.Name, "Gravity Added "..gravStatus)
			end
		end
	end

end

function locationsTick()
	
	for key,ply in pairs(player.GetAll()) do
			umsg.Start("locationValid_HUD", ply)
			umsg.String("false")
			umsg.End()
	end
	
//Set up player Values
	for key,location in pairs(Locations) do
		for subkey,ply in pairs(ents.FindInSphere(location.Position, (location.Radius + 300))) do
			if(ply:IsPlayer()) then
				umsg.Start("locationValid_HUD", ply)
				umsg.String("true")
				umsg.End()
				
				umsg.Start("locationName_HUD", ply)
				umsg.String(location.Name)
				umsg.End()
				
				umsg.Start("locationOwner_HUD", ply)
				umsg.String(location.Owner)
				umsg.End()
				
				umsg.Start("locationRadius_HUD", ply)
				umsg.Long(location.Radius)
				umsg.End()
				
				-- umsg.Start("locationPosX", ply)
				-- umsg.String(tostring(location.Position.x))
				-- umsg.End()
				
				-- umsg.Start("locationPosY", ply)
				-- umsg.String(tostring(location.Position.y))
				-- umsg.End()
				
				-- umsg.Start("locationPosZ", ply)
				-- umsg.String(tostring(location.Position.z))
				-- umsg.End()
			end
				
				-- if(useGravity) then
					-- gravityTick(ply)
				-- end
			
		end
		
	end

end

function PhysGravGunPickupTest(ply, ent)
	if(!ent:IsValid()) then return end
	for k,v in pairs(gravGunExcludes) do
		if(ent:GetClass() == v.class) then
			return false
		end
	end
	

end

function CanToolTest(ply, tr, toolgun)
	if(tr.HitWorld) then return end
	ent = tr.Entity
	if(!ent:IsValid()) then return end
	if(string.find(string.lower(ent:GetModel()), string.lower("models/props_wasteland/rockgranite")) == 1 or string.find(string.lower(ent:GetModel()), string.lower("models/props_wasteland/rockcliff")) == 1 ) then
		return false
	end
end

function CanSpawnProp(ply, model, propID)
	if(moneySystem) then
		if(ply.money < 100) then
			propID:Remove()
		else
			ply.money = ply.money - 100
		end
	end
end




/***********************************************************/
/***********************Gamemode Hooks*********************/
/***********************************************************/

hook.Add("GravGunPunt", "PhysGravGunPickupTest", PhysGravGunPickupTest)
hook.Add("GravGunPickupAllowed", "PhysGravGunPickupTest", PhysGravGunPickupTest)
hook.Add("PhysgunPickup", "PhysGravGunPickupTest", PhysGravGunPickupTest)
hook.Add("CanTool", "CanToolTest", CanToolTest)