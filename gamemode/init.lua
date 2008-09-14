

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
AddCSLuaFile( 'cl_timerHUD.lua' )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )
include( 'hooks.lua' )



/***********************************************************/
/********************Variable Initialization*******************/
/***********************************************************/

PW_Debug = true
useGravity = true
countDown = 0.5
actualtime = (countDown * 60) + CurTime()
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


	timeLeft = actualtime - CurTime()

for key, ply in pairs(player.GetAll()) do
	umsg.Start("timerTime", ply)
	umsg.Long(timeLeft)
	umsg.End()
end


if CurTime() < (nexttime or 0) then return end

nexttime = CurTime() + 0.1
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
plyTeam = TeamsIndex[math.random(1, table.getn(TeamsIndex))]
ply:SetTeam(plyTeam.index)
ply:SetModel(plyTeam.model)
end

function GM:PlayerLoadout(ply)
	ply:Give("gmod_tool")
	ply:Give("weapon_physgun")
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