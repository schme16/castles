


function GM:Think()
	if think > CurTime() then return end
	
	timerHUD()
	think = CurTime() + 0.1
end

function timerTime( um )
time = um:ReadLong()
	if( time > 1) then

		timeLeft = math.floor(time/60)
		timeLeftSec = (time%60)
		if(timeLeftSec < 10) then
			nilvar = "0"
		else
			nilvar = ""
		end
	
		msg = "Peace Timer: "..timeLeft..":"..nilvar..timeLeftSec
	else
		msg = "War!"
	end
end
usermessage.Hook("timerTime", timerTime) 

function timerHUD()
	draw.SimpleText(msg, "ScoreboardText",  ScrW()/2, 7, Color(244, 187, 63, 255), 1, 1)
end
hook.Add("HUDPaint", "timerHUD", timerHUD) 