function init() 
	self = vgui.Create( "DFrame" )
	self:SetPos( 50,50 )
	self:SetSize( 330, 350 )
	self:SetTitle( " =====================Score Panel===================" )
	self:SetVisible( true )
	self:SetDraggable( true )
	self:ShowCloseButton( true )
	self:MakePopup()
	
	local PropertySheet = vgui.Create( "DPropertySheet" )
	PropertySheet:SetParent( self )
	PropertySheet:SetPos( 0, 25 )
	PropertySheet:SetSize( 290, 325 )

	
	local playerStats = vgui.Create("DListView")
	playerStats:SetParent(self)
	playerStats:SizeToContents()
	playerStats:SetMultiSelect(false)
	playerStats:AddColumn("Name") // Add column
	playerStats:AddColumn("Team")
	playerStats:AddColumn("Score")
	playerStats:AddColumn("Cash")
	for k,v in pairs(player.GetAll()) do
	playerStats:AddLine(v:Nick(), TeamsIndex[v:Team()].Name, v:Frags(), tostring(v.money)) // Add lines
	end



	PropertySheet:AddSheet( "player Scores", playerStats, "gui/silkicons/user", false, false, "This is the individual scores for each player." )
	PropertySheet:AddSheet( "Planetary Ownership", teamStats, "gui/silkicons/group", false, false, "This is the planetary control ratios" ) 
	concommand.Add("score",Scores, close) // adding the console command 

end


function panelShow()
	
end

function panelShow()
	
end



init() 