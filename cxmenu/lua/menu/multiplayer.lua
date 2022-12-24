pnlMPMenu = nil

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
        but.hover = false
        surface.SetFont("cxmenu.mmb")
        local x,y = surface.GetTextSize(but.name)
        but:SetPos(50,50+ascnumy) but:SetSize(x+15,y) but:SetText("")
        but.Paint = function(self,w,h)
            if self:IsHovered() then 
                but.xdpos = but.xdpos+(15-but.xdpos)/10
                if but.hover == false then 
                    surface.PlaySound("ui/buttonrollover.wav")
                    but.hover = true 
                end 
            else 
                if but.hover == true then but.hover = false end
                but.xdpos = but.xdpos+(0-but.xdpos)/10 
            end
            draw.SimpleText(but.name,"cxmenu.mmb",but.xdpos,0,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
        end
        but.DoClick = function()
            surface.PlaySound("ui/buttonclickrelease.wav")
            doclick()
        end
        ascnumy = ascnumy + 50
    end

    crtButtonM(cxmenu.GetPhrase("#internet"),function() end)
    crtButtonM(cxmenu.GetPhrase("#favo"),function() end)
    crtButtonM(cxmenu.GetPhrase("#legacy"),function() RunGameUICommand("OpenServerBrowser") end)

    local back = self:Add("DButton")
    
    back.xdpos = 0
    back.name = cxmenu.GetPhrase("#back")
    back.hover = false
    surface.SetFont("cxmenu.mmb")
    local x,y = surface.GetTextSize(back.name)

    back:SetPos(50,ScrH()-(y+50)) back:SetSize(x+15,y) back:SetText("")
    back.Paint = function(self,w,h)
        if self:IsHovered() then 
            back.xdpos = back.xdpos+(15-back.xdpos)/10
                if back.hover == false then 
                    surface.PlaySound("ui/buttonrollover.wav")
                    back.hover = true 
                end 
            else 
                if back.hover == true then back.hover = false end
                back.xdpos = back.xdpos+(0-back.xdpos)/10 
            end
            draw.SimpleText(back.name,"cxmenu.mmb",back.xdpos,0,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
    end
    back.DoClick = function()
        surface.PlaySound("ui/buttonclickrelease.wav")
        pnlMainMenu = vgui.Create("MainMenuPanel")
        pnlMPMenu:Remove()
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
    if (!IsInGame()) then
        surface.SetMaterial(cxmenu.background)
        surface.DrawTexturedRect(0*0.5,0*0.5,ScrH() * 1 * cxmenu.bgratio,ScrH() * 1)
    end
    surface.SetMaterial(Material( "html/img/gradient.png", "nocull smooth" ))
	surface.DrawTexturedRect( 0, 0, 1024, ScrH() )

    if ( !self.IsInGame ) then return end

end

vgui.Register( "MPMenuPanel", PANEL, "EditablePanel" )