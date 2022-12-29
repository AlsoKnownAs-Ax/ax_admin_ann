--/////////// vRP bind \\\\\\\\\\\--

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","ax_admin_ann")

--===============================================--

ch_announce = function (player, choice)
    local user_id = vRP.getUserId{player}
    if user_id then
        vRP.prompt({player, "Anunt: ", "", function(player, msg)
            local msg = tostring(msg)

            if string.len(msg) < AxConfig.min_msg_lenght then
                vRPclient.notify(player,{"Anuntul trebuie sa contina minim "..AxConfig.min_msg_lenght.." caractere"})
                return
            end

            local name = GetPlayerName(player)
            
            vRP.sendStaffMessage{"^3"..name.." ^0a dat un anunt ^3administrativ!"}
            SetTimeout(AxConfig.delay*1000, function()
                vRPCax.SendAnnounce(-1, {name,user_id,msg})
            end)
        end})
    end
end


vRP.registerMenuBuilder({"admin", function(add, data)
    local user_id = vRP.getUserId{data.player}
    if user_id then
        local choices = {}
        choices["Anunt Admin AX"] = {ch_announce}

        add(choices)
    end
end})
