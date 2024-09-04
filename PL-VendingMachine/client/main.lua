ESX = exports["es_extended"]:getSharedObject()
lib.locale()

local vendingMachineModels = PL.vendingProps

exports.ox_target:addModel(vendingMachineModels, {
    {
        name = locale("vending_title"),
        icon = PL.vendingIcon, 
        label = locale("vending_title"),
        onSelect = function()
            local elements = {}
            for k, v in pairs(PL.vending) do
                table.insert(elements, {
                    title = v.title,  -- Oletetaan, että v.title on jo lokaloitu
                    icon = v.icon,
                    iconColor = v.color,
                    description = v.price .. "€",
                    onSelect = function()
                        local input = lib.inputDialog(locale('purchase_prompt_title'), {
                            {type = 'number', label = locale('quantity_label'), icon = 'hashtag', required = true},
                        })
                        if input then
                            TriggerServerEvent("PL-buy", v.item, v.price, v.title, input[1])
                        end
                    end
                })
            end

            lib.registerContext({
                id = 'limsaautomaatti_menu',
                title = locale('vending_machine_title'),
                options = elements,
            })
            lib.showContext("limsaautomaatti_menu")
        end,
    },
})



local beanmachineProps = PL.beanmachineProps

exports.ox_target:addModel(beanmachineProps, {
    {
        name = locale("beanmachine_title"), 
        icon = PL.beanmachineIcon,  
        label = locale("beanmachine_title"),  
        onSelect = function()
            local elements = {}
            for k, v in pairs(PL.beanmachine) do
                table.insert(elements, {
                    title = v.title,  
                    icon = v.icon,
                    iconColor = v.color,
                    description = v.price .. "€",
                    onSelect = function()
                        local input = lib.inputDialog(locale('purchase_prompt_title'), {
                            {type = 'number', label = locale('quantity_label'), icon = 'hashtag', required = true},
                        })
                        if input then
                            TriggerServerEvent("PL-buy", v.item, v.price, v.title, input[1])
                        end
                    end
                })
            end

            lib.registerContext({
                id = 'beanmachine_menu',  
                title = locale('beanmachine_title'),  
                options = elements,
            })
            lib.showContext("beanmachine_menu")  
        end,
    },
})



local waterProps = PL.waterProps

exports.ox_target:addModel(waterProps, {
    {
        name = locale("water_title"), 
        icon = PL.waterIcon,  
        label = locale("water_title"),  
        onSelect = function()
            local elements = {}
            for k, v in pairs(PL.water) do
                table.insert(elements, {
                    title = v.title,  
                    icon = v.icon,
                    iconColor = v.color,
                    description = v.price .. "€",
                    onSelect = function()
                        local input = lib.inputDialog(locale('purchase_prompt_title'), {
                            {type = 'number', label = locale('quantity_label'), icon = 'hashtag', required = true},
                        })
                        if input then
                            TriggerServerEvent("PL-buy", v.item, v.price, v.title, input[1])
                        end
                    end
                })
            end

            lib.registerContext({
                id = 'water_menu',  
                title = locale('water_title'),  
                options = elements,
            })
            lib.showContext("water_menu")  
        end,
    },
})
