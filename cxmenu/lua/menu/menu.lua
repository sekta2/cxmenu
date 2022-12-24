cxmenu = {}

--Languanes
cxmenu.langs = {}
cxmenu.currentlang = "en"
cxmenu.langs["ru"] = {
    ["title"] = "Russian",
    ["titleon"] = "Русский",
    ["phrases"] = {
        ["#sp"] = "Одиночная игра",
        ["#mp"] = "Мультиплеер",
        ["#lg"] = "Язык",
        ["#gm"] = "Режим",
        ["#add"] = "Аддоны",
        ["#sett"] = "Настройки",
        ["#qu"] = "Выйти",
        ["#back"] = "Назад",
        ["#internet"] = "Интернет",
        ["#favo"] = "Избранное",
        ["#legacy"] = "Браузер серверов",
        ["#play"] = "Играть",
        ["#leave"] = "Отключится",
    }
}
cxmenu.langs["en"] = {
    ["title"] = "English",
    ["titleon"] = "English",
    ["phrases"] = {
        ["#sp"] = "Singleplayer",
        ["#mp"] = "Multiplayer",
        ["#lg"] = "Languane",
        ["#gm"] = "Gamemode",
        ["#add"] = "Addons",
        ["#sett"] = "Settings",
        ["#qu"] = "Quit",
        ["#back"] = "Back",
        ["#internet"] = "Internet",
        ["#favo"] = "Favorite",
        ["#legacy"] = "Legacy",
        ["#play"] = "Play",
        ["#leave"] = "Leave",
    }
}

function cxmenu.GetPhrase(id)
    local phrase = "#none"
    for k,v in pairs(cxmenu.langs[cxmenu.currentlang]["phrases"]) do
        if k==id then phrase = v end
    end
    return phrase
end

cxmenu.bgs = file.Find("materials/cxmenu/backgrounds/*.*","GAME")
cxmenu.background = Material("materials/cxmenu/backgrounds/" .. table.Random(cxmenu.bgs))
cxmenu.bgratio = cxmenu.background:GetInt( "$realwidth" ) / cxmenu.background:GetInt( "$realheight" )
timer.Create("cxmenu.changebackground",35,0,function()
    cxmenu.background = Material("materials/cxmenu/backgrounds/" .. table.Random(cxmenu.bgs))
    cxmenu.bgratio = cxmenu.background:GetInt( "$realwidth" ) / cxmenu.background:GetInt( "$realheight" )
end)

surface.CreateFont("cxmenu.mmb",{
    font = "Roboto",
    weight = 300,
    size = 35,
    extended = true,
    shadow = true
})

surface.CreateFont("cxmenu.esf",{
    font = "Roboto",
    weight = 300,
    size = 25,
    extended = true,
    shadow = true
})

include("mainmenu.lua")
include("getmaps.lua")
include("singleplayer.lua")
include("multiplayer.lua")
include("languane.lua")
include("gamemode.lua")
include("addons.lua")
include("loading.lua")