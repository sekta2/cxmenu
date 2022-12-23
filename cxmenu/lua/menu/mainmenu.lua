pnlMainMenu = nil

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
        but:SetPos(50,200+ascnumy) but:SetSize(x+15,y) but:SetText("")
        but.Paint = function(self,w,h)
            if self:IsHovered() then but.xdpos = but.xdpos+(15-but.xdpos)/10 else but.xdpos = but.xdpos+(0-but.xdpos)/10 end
            draw.SimpleText(but.name,"cxmenu.mmb",but.xdpos,0,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
        end
        but.DoClick = function()
            doclick()
        end
        ascnumy = ascnumy + 50
    end

    --singleplayer
    crtButtonM("Singleplayer",function()
        pnlAddonsMenu = vgui.Create( "AddonsMenuPanel" )
        pnlMainMenu:Remove()
    end)
    crtButtonM("Multiplayer",function() end)
    crtButtonM("Languane",function() RunGameUICommand("OpenOptionsDialog") end)
    crtButtonM("Gamemode",function() RunGameUICommand("OpenOptionsDialog") end)
    crtButtonM("Addons",function() RunGameUICommand("OpenOptionsDialog") end)
    crtButtonM("Settings",function() RunGameUICommand("OpenOptionsDialog") end)
    crtButtonM("Quit",function() RunGameUICommand("Quit") end)

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

    if ( engine.ActiveGamemode() ) then
        surface.SetMaterial(Material( "gamemodes/"..engine.ActiveGamemode().."/logo.png"))
        surface.DrawTexturedRect( 45, 100/2, 288, 128 )
    end

    if ( !self.IsInGame ) then return end

end

vgui.Register( "MainMenuPanel", PANEL, "EditablePanel" )

pnlMainMenu = vgui.Create( "MainMenuPanel" )