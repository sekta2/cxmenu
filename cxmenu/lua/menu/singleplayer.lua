pnlAddonsMenu = nil

local PANEL = {}

function PANEL:Init()
    self:Dock( FILL )
	self:SetKeyboardInputEnabled( true )
	self:SetMouseInputEnabled( true )

    local ascnumy = 0

    local function crtButtonM(name,doclick)
        local but = self:Add("DButton")
    
        but.xdpos = 0
        but.name = name
        surface.SetFont("cxmenu.mmb")
        local x,y = surface.GetTextSize(but.name)
        but:SetPos(50,50+ascnumy) but:SetSize(x+15,y) but:SetText("")
        but.Paint = function(self,w,h)
            if self:IsHovered() then but.xdpos = but.xdpos+(15-but.xdpos)/10 else but.xdpos = but.xdpos+(0-but.xdpos)/10 end
            draw.SimpleText(but.name,"cxmenu.mmb",but.xdpos,0,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
        end
        but.DoClick = function()
            doclick()
        end
        ascnumy = ascnumy + 50
    end

    crtButtonM("All",function() end)
    crtButtonM("Favorites",function() end)
    crtButtonM("Legacy Browser",function() end)

    local back = self:Add("DButton")
    
    back.xdpos = 0
    back.name = "Back"
    surface.SetFont("cxmenu.mmb")
    local x,y = surface.GetTextSize(back.name)
    back:SetPos(50,ScrH()-(y+50)) back:SetSize(x+15,y) back:SetText("")
    back.Paint = function(self,w,h)
        if self:IsHovered() then back.xdpos = back.xdpos+(15-back.xdpos)/10 else back.xdpos = back.xdpos+(0-back.xdpos)/10 end
        draw.SimpleText(back.name,"cxmenu.mmb",back.xdpos,0,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
    end
    back.DoClick = function()
        pnlMainMenu = vgui.Create("MainMenuPanel")
        pnlAddonsMenu:Remove()
    end

    self:MakePopup()
	self:SetPopupStayAtBack( true )

    if ( gui.IsConsoleVisible() ) then
		gui.ShowConsole()
	end
end

function PANEL:Call()
end

function PANEL:Paint()
    surface.SetDrawColor( 255, 255, 255, 255 )
    surface.SetMaterial(cxmenu.background)
    surface.DrawTexturedRect(0,0,ScrW(),ScrH())
    surface.SetMaterial(Material( "html/img/gradient.png", "nocull smooth" ))
	surface.DrawTexturedRect( 0, 0, 1024, ScrH() )

    if ( !self.IsInGame ) then return end

end

vgui.Register( "AddonsMenuPanel", PANEL, "EditablePanel" )