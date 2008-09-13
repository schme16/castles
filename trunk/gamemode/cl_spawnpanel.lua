
function spawnPanel(boolean)

	spawnPanel =vgui.Create( "onslaught_menu" )
	spawnPanel:SetTitle( "Onslaught Menu" )
	spawnPanel.ContentPanel = vgui.Create( "DPropertySheet", spawnPanel )
	spawnPanel:ShowCloseButton( false )
	local HelpLab = vgui.Create("DLabel")
	HelpLab:SetText( "Welcome to Onslaught: Evolved!\nSpawn props and use them to build a base.\nThen fight off the hordes of NPCs!" )
	HelpLab:SetTextColor( Color( 255, 255, 255, 255 ) )
	HelpLab:SizeToContents( )

	spawnPanel.ContentPanel:AddSheet( "Help", HelpLab, "onslaught/help", true, true )
	spawnPanel.ContentPanel:AddSheet( "Class", vgui.Create( "onslaught_classselect", spawnPanel ), "gui/silkicons/group", true, true )
	spawnPanel.ContentPanel:AddSheet( "Build", vgui.Create( "onslaught_PropSpawn", spawnPanel ), "onslaught/bricks", true, true )
	spawnPanel.ContentPanel:AddSheet( "Commands", vgui.Create("onslaught_commands", spawnPanel), "onslaught/help", true, true )
	
	if LocalPlayer( ):IsAdmin( ) then
		spawnPanel.ContentPanel:AddSheet( "Admin", vgui.Create( "onslaught_admin", spawnPanel ), "onslaught/bricks", true, true )
	end
	
	
	
			spawnPanel:SetVisible( boolean )
end

spawnPanel(true)