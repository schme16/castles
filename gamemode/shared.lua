DeriveGamemode("sandbox")

TeamsIndex = 
{
	{index = 1, Name = "Brittons", color = Color(0, 13, 211, 255), model = "models/player/heavyknight2/heavyknigh2.mdl"},
	{index = 2, Name = "Normans", color = Color(186, 65, 5, 255)},
}

 
for k,v in pairs(TeamsIndex) do
    team.SetUp(v.index, v.Name, v.color)
end

