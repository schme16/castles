
/*Defence Props*/
defenceList = 
{
	{model = "models/hunter/blocks/cube1x1x025.mdl", tip = "Small brick set"},
	{model = "models/hunter/blocks/cube3x3x025.mdl", tip = "Medium brick set"},
	{model = "models/hunter/blocks/cube3x3x025.mdl", tip = " Large brick set"},
	{model = "models/hunter/blocks/cube4x4x05.mdl", tip = "Huge brick set"},
	{model = "models/hunter/blocks/cube4x4x05.mdl", tip = "Enourmouse Brick set"},
}

/*Offence Prop*/
offenceList = 
{
	{model = "models/cannonballs/smallcannonball.mdl", tip = "Small Cannon Ball; Use with the Cannon."},
	{model = "models/cannonballs/cannonball.mdl", tip = "Large Cannon Ball; Use with the Cannon."},
}

function init() 
	Menu = vgui.Create( "DFrame" )
	Menu:SetPos( ScrW()-(ScrW() - 330), ScrH() -(ScrH()-150) )
	Menu:SetSize( 330, 350 )
	Menu:SetVisible( false )
	Menu:SetTitle( "                Castles Menu" )
	Menu:SetDraggable( true )
	Menu:ShowCloseButton( true )
	Menu:MakePopup()
	
	local PropertySheet = vgui.Create( "DPropertySheet" )
	PropertySheet:SetParent( Menu )
	PropertySheet:SetPos( 2, 25 )
	PropertySheet:SetSize( 326, 323 )

	
	local playerStats = vgui.Create("DListView")
	playerStats:SetParent(Menu)
	playerStats:SizeToContents()
	playerStats:SetMultiSelect(false)
	playerStats:AddColumn("Name") 
	playerStats:AddColumn("Team")
	playerStats:AddColumn("Score")
	playerStats:AddColumn("Props")
	for k,v in pairs(player.GetAll()) do
	ents.GetAll()
	playerStats:AddLine(v:Nick(), TeamsIndex[v:Team()].Name, v:Frags(), tostring(v.money)) // Add lines
	end
	
	
	
	defencePanel = vgui.Create( "DPanelList", Menu )
	defencePanel:EnableVerticalScrollbar( true ) 
 	defencePanel:EnableHorizontal( true ) 
	defencePanel:SetPadding( 4 ) 
	defencePanel:SetVisible( true )
	
	for k,v in pairs( defenceList ) do
		local ico = vgui.Create( "SpawnIcon", Menu )
		ico:SetModel(v.model)
		
		//ico:SetMaterial("models/XQM/Panel360Diffuse")
		ico.DoClick = function( ico )
			RunConsoleCommand("gm_spawn", v.model, 0) 
			surface.PlaySound( "ui/buttonclickrelease.wav") 
		end
		
		ico:SetIconSize( 64 ) 
		ico:InvalidateLayout( true ) 
		ico:SetToolTip( Format( "%s", v.tip ) ) 
		defencePanel:AddItem( ico )
	end

	
	
		
	
	offencePanel = vgui.Create( "DPanelList", Menu )
	offencePanel:EnableVerticalScrollbar( true ) 
 	offencePanel:EnableHorizontal( true ) 
	offencePanel:SetPadding( 4 ) 
	offencePanel:SetVisible( true )
	
	for k,v in pairs( offenceList ) do
		local ico = vgui.Create( "SpawnIcon", Menu )
		ico:SetModel(v.model)
		
		//ico:SetMaterial("models/XQM/Panel360Diffuse")
		ico.DoClick = function( ico )
			RunConsoleCommand("gm_spawn", v.model, 0) 
			surface.PlaySound( "ui/buttonclickrelease.wav") 
		end
		
		ico:SetIconSize( 64 ) 
		ico:InvalidateLayout( true ) 
		ico:SetToolTip( Format( "%s", v.tip ) ) 
		offencePanel:AddItem( ico )
	end

	
	
	PropertySheet:AddSheet( "Scores", playerStats, "gui/silkicons/user", false, false, "Are you kicking ass? Why not check and see?") 
	
	PropertySheet:AddSheet( "Defence", defencePanel, "gui/silkicons/group", false, false, "Base lacking defence; Look no further!" )
	
	PropertySheet:AddSheet( "Weapons", offencePanel, "gui/silkicons/group", false, false, "Want some weapons? Got a need for destruction? We got what you need right here!" ) 
	
 	PropertySheet:AddSheet( "Help", helpPanel, "gui/silkicons/group", false, false, "New to the game? Hers some help." ) 
	Menu = Menu
end

function GM:ScoreboardShow()
	Menu:SetVisible( true )
end

function GM:ScoreboardHide()
	Menu:SetVisible( false )
end

-- function GM:SpawnMenuOpen()
	-- Menu:SetVisible( true )
-- end

-- function GM:OnSpawnMenuClose()
	-- Menu:SetVisible( false )
-- end

function GM:ContextMenuOpen()
	Menu:SetVisible( true )
end

function GM:OnContextMenuClose()
	Menu:SetVisible( false )
end
init() 


local tr = LocalPlayer():GetEyeTrace()
 
if( tr.Hit and ( tr.HitPos - LocalPlayer():GetPos() ):Length() <= 7874 ) then //7874 inches (units) is 200 meters
	print(tr.Entity)
end
