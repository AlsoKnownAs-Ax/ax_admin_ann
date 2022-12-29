--/////////// vRP bind \\\\\\\\\\\--

vRPCax = {}
Tunnel.bindInterface("ax_admin_ann",vRPCax)
Proxy.addInterface("ax_admin_ann",vRPCax)
vRP = Proxy.getInterface("vRP")
vRPSax = Tunnel.getInterface("ax_admin_ann","ax_admin_ann")

--===============================================--

local send_config = function()
    local style = AxConfig.style
    SendNUIMessage({
        type = "config",
        show_sender = AxConfig.show_sender,
        border_color = style.border_color,
        background_color = style.background_color,
        title_color = style.title_color,
        text_color = style.text_color,
        sender_color = style.sender_color
    })

end

--===============================================--

RegisterNUICallback('action', function(data, cb)
    if data.type == 'ready' then
        send_config()
        cb('ok')
    end
end)


local NUI_sender = function (f_s,s_s)
    SendNUIMessage({
        type = "open",
        first = f_s,
        second = s_s
    })
end

local NUI_close = function()
    SendNUIMessage({
        type = 'close',
    }) 
end

function vRPCax.SendAnnounce(name,user_id,msg)
    local f_string = tostring(name.." [ "..user_id.." ]")
    local s_string = tostring(msg)
    if f_string and s_string then
        NUI_sender(f_string,s_string)
        SetTimeout(AxConfig.show_time*1000,function ()
            NUI_close()
        end)
    end
end