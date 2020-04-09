----------------------------KillCounter
local id = PlayerId()
local killCount = 0 
AddEventHandler("DamageEvents:PedKilledByPlayer", function(ped, playerId)
	if id == playerId then
		local pedkill = GetPlayerPed(id)
		killCount = killCount+1	
		SetEntityHealth(pedkill, 200)
	end
end)
----------------------------DeathCounter
local dieCount = 0
AddEventHandler("DamageEvents:PedKilledByPlayer", function(ped)
	local peddeath = GetPlayerPed(id)	
	if ped == peddeath then
		dieCount = dieCount+1		
	end
end)

--------------------- Kill Counter Dipslay

alpha = 255
size = 0.8
font = 1

textPosKill = {x = 0.16, y = 0.91}
rgbkill = {r = 1, g = 255, b = 1}
Citizen.CreateThread(function()
	while true do
		Wait(1)
		SetTextColour(rgbkill.r, rgbkill.g, rgbkill.b, alpha)
		SetTextFont(font)
		SetTextScale(size, size)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
		SetTextDropshadow(2, 2, 0, 0, 0)
		SetTextEdge(1, 0, 0, 0, 205)
		SetTextEntry("STRING")
		AddTextComponentString("Kills: ".. killCount)
		DrawText(textPosKill.x, textPosKill.y)
	end
end)

--------------------- Death Counter Dipslay
textPosDeath = {x = 0.157, y = 0.945}
rgbdeath = {r = 255, g = 1, b = 1}
Citizen.CreateThread(function()
	while true do
		Wait(1)
		SetTextColour(rgbdeath.r, rgbdeath.g, rgbdeath.b, alpha)
		SetTextFont(font)
		SetTextScale(size, size)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
		SetTextDropshadow(2, 2, 0, 0, 0)
		SetTextEdge(1, 0, 0, 0, 205)
		SetTextEntry("STRING")
		AddTextComponentString("Deaths: ".. dieCount)
		DrawText(textPosDeath.x, textPosDeath.y)
	end
end)