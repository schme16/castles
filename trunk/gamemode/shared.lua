DeriveGamemode("sandbox")

TeamsIndex = 
{
	{index = 1, Name = "Brittons", color = Color(0, 13, 211, 255)},
	{index = 2, Name = "Normans", color = Color(186, 65, 5, 255)},
}

 
for k,v in pairs(TeamsIndex) do
    team.SetUp(v.index, v.Name, v.color)
end

