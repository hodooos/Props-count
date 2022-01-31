--/ Responsive
local x, y = ScrW(), ScrH()

local function ChangeResponsive()
    x = ScrW()
    y = ScrH()
end
hook.Add("OnScreenSizeChanged", "Hodos:Responsive", ChangeResponsive)


--/ Fonts
surface.CreateFont( "Hodos:text", {
	font = Hodos.Font,
	size = 14,
	weight = 500,
})


--/ Materials
local box = Material(Hodos.Image)


--/ Core
function HodosPropsCount()
    if(IsValid(LocalPlayer():GetActiveWeapon())) then
		if(LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool") then
            surface.SetFont("Hodos:text")
            draw.RoundedBox(0, x*0.027, y*0.0125, y*0.08, y*0.025, Hodos.Colors["Colors"])
            surface.SetTextColor(Hodos.Colors["Font"])
            surface.SetTextPos(x*0.030, y*0.018)
            surface.DrawText("Props : ".. (LocalPlayer():GetCount("props") or 0) .. "/" ..  (cvars.Number( "sbox_maxprops" ) or 0))
            surface.SetMaterial(box)
            surface.SetDrawColor(255, 255, 255)
            surface.DrawTexturedRect(x*0.005, y*0.01, y*0.03, y*0.03)
        end;
    end;
end

hook.Add("HUDPaint", "HodosPropsCount", HodosPropsCount)