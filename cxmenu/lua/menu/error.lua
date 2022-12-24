cxmenu.error = false
cxmenu.time = CurTime()+5
cxmenu.errorstr = ""
function cxmenu.CreateError(error,addon)
    cxmenu.error = true
    cxmenu.time = CurTime()+5
    cxmenu.errorstr = error
end

hook.Add("DrawOverlay","cxmenu.errordraw",function()
    if cxmenu.error then
        draw.SimpleText(cxmenu.errorstr,"cxmenu.esf",5,5,Color(255,255,255))
    end
end)

hook.Add("OnLuaError","cxmenu.luaerror",function(error,realm,stack,addon,addonid)
    cxmenu.CreateError(error,addon)
end)