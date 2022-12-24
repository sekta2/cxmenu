pnlMainMenu = nil

local PANEL = {}

local function reloadmainpnl()
    pnlMainMenu:Remove()
    pnlMainMenu = vgui.Create( "MainMenuPanel" )
end

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
        but:SetPos(50,200+ascnumy) but:SetSize(x+15,y) but:SetText("")
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

    crtButtonM(cxmenu.GetPhrase("#sp"),function()
        pnlSPMenu = vgui.Create( "SPMenuPanel" )
        pnlMainMenu:Remove()
    end)
    crtButtonM(cxmenu.GetPhrase("#mp"),function()
        pnlMPMenu = vgui.Create( "MPMenuPanel" )
        pnlMainMenu:Remove()
    end)
    crtButtonM(cxmenu.GetPhrase("#lg"),function()
        pnlLangMenu = vgui.Create( "LangMenuPanel" )
        pnlMainMenu:Remove()
    end)
    crtButtonM(cxmenu.GetPhrase("#gm"),function()
        pnlGMMenu = vgui.Create( "GMMenuPanel" )
        pnlMainMenu:Remove()
    end)
    crtButtonM(cxmenu.GetPhrase("#add"),function() RunGameUICommand("OpenOptionsDialog") end)
    crtButtonM(cxmenu.GetPhrase("#sett"),function() RunGameUICommand("OpenOptionsDialog") end)
    if (IsInGame()) then
        crtButtonM(cxmenu.GetPhrase("#leave"),function() reloadmainpnl() RunGameUICommand("Disconnect") end)
    end
    crtButtonM(cxmenu.GetPhrase("#qu"),function() RunGameUICommand("Quit") end)

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

    if ( engine.ActiveGamemode() ) then
        surface.SetMaterial(Material( "gamemodes/"..engine.ActiveGamemode().."/logo.png"))
        surface.DrawTexturedRect( 45, 100/2, 288, 128 )
    end

    if ( !self.IsInGame ) then return end

end

vgui.Register( "MainMenuPanel", PANEL, "EditablePanel" )

pnlMainMenu = vgui.Create( "MainMenuPanel" )