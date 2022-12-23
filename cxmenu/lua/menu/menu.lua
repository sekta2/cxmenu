cxmenu = {}
cxmenu.background = Material("cxmenu/backgrounds/candyapple_kleiner_and_lamarr.jpg")

surface.CreateFont("cxmenu.mmb",{
    font = "Roboto",
    weight = 300,
    size = 35,
    extended = true,
    shadow = true
})

include("mainmenu.lua")
include("singleplayer.lua")