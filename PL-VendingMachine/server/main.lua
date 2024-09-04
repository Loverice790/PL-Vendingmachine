ESX = exports["es_extended"]:getSharedObject()
lib.locale()

RegisterServerEvent("PL-buy", function(item,price,label,input)
    local xPlayer = ESX.GetPlayerFromId(source)
    local hinta = price*input

    if xPlayer.getInventoryItem("money").count >= hinta then
        xPlayer.removeMoney(hinta)
        xPlayer.addInventoryItem(item, input)
        if PL.notify == "esx" then
            ESX.ShowNotification(locale("you_bought", label, hinta))
        elseif PL.notify == "pl" then
            TriggerClientEvent('pl_notify', xPlayer.source, {
                description = locale("you_bought", label, hinta), 
                type = "success", 
                duration = 8000, 
                position = "top-right" 
            })
        elseif PL.notify == "ox" then
            TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                description = locale("you_bought", label, hinta), 
                type = "success", 
                duration = 8000, 
                position = "top-right" 
            })
        end
    else
        if PL.notify == "esx" then
            ESX.ShowNotification(locale("you_not_have_money"))
        elseif PL.notify == "pl" then
            TriggerClientEvent('pl_notify', xPlayer.source, {
                description = locale("you_not_have_money"), 
                type = "error", 
                duration = 8000, 
                position = "top-right" 
            })
        elseif PL.notify == "ox" then
            TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                description = locale("you_not_have_money"), 
                type = "error", 
                duration = 8000, 
                position = "top-right" 
            })
        end
    end
end)