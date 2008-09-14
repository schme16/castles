function init() 
	self = vgui.Create( "DFrame" )
	self:SetPos( ScrW()-(ScrW() - 330), ScrH() -(ScrH()-150) )
	self:SetSize( 330, 350 )
	self:SetVisible( false )
	self:SetTitle( " =====================Score Panel===================" )
	self:SetDraggable( true )
	self:ShowCloseButton( true )
	self:MakePopup()
	
	local PropertySheet = vgui.Create( "DPropertySheet" )
	PropertySheet:SetParent( self )
	PropertySheet:SetPos( 2, 25 )
	PropertySheet:SetSize( 326, 323 )

	
	local playerStats = vgui.Create("DListView")
	playerStats:SetParent(self)
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


	PropertySheet:AddSheet( "Props", teamStats, "gui/silkicons/group", false, false, "This is the planetary control ratios" )
	PropertySheet:AddSheet( "Scores", playerStats, "gui/silkicons/user", false, false, "This is the individual scores for each player." )

 	PropertySheet:AddSheet( "Help", helpPanel, "gui/silkicons/group", false, false, "New to the game? Hers some help." ) 

	
	propsPanel = self
end

function GM:ScoreboardShow()
		propsPanel:SetVisible( true )
end

function GM:ScoreboardHide()
		propsPanel:SetVisible( false )
end



init() --Initializes the derma panels