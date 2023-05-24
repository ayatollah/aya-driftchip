local useDebug = Config.Debug
lib.locale()

local function toggleDriftMode(vehicle, on)
    if lib.progressBar({
        duration = Config.ActivateTime,
        label = locale("drift_label"),
        positions = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            mouse = false,
            combat = true,
        },
    }) then
        SetDriftTyresEnabled(vehicle, on)
        SetVehicleEngineOn(vehicle, true, false)
    else
        lib.notify({
            title = locale("cancel_label"),
            description = locale("canel_desc_chip"),
            type = 'error'
        })
    end
end

RegisterNetEvent('cw-driftchip:client:toggleDrift', function()
    local Player = PlayerPedId()
    local vehicle = GetVehiclePedIsUsing(Player)
    local isOn = GetDriftTyresEnabled(vehicle)
    if vehicle ~= 0 then
        if GetEntitySpeed(vehicle) > 1.0 then
            lib.notify({
               title = locale("stop_vehicle_label"),
               description = locale("stop_veh_desc"),
               type = 'error' 
            })
        else
            SetVehicleEngineOn(vehicle, false, false, true)
            if isOn then
                lib.notify({
                    title = locale("toggle_drift_label"),
                    description = locale("toggle_drift_off"),
                    type = 'inform' 
                })  
                toggleDriftMode(vehicle, false)
            else
                lib.notify({
                    title = locale("toggle_drift_label"),
                    description = locale("toggle_drift_on"),
                    type = 'inform' 
                })
                toggleDriftMode(vehicle, true)
            end
        end
    else
        lib.notify({
            title = locale("outside_veh_label"),
            description = locale("outside_veh_desc"),
            type = 'error' 
         })
    end
end)

RegisterNetEvent('cw-driftchip:client:openbox', function()

    if lib.progressBar({
        duration = Config.BoxTime,
        label = locale("open_box"),
        positions = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            mouse = false,
            combat = true,
        },
    }) then
        TriggerServerEvent('cw-driftchip:server:openbox')
    else
        lib.notify({
            title = locale("cancel_label"),
            description = locale("cancel_desc_box"),
            type = 'error'
        })
    end
end)

RegisterNetEvent('cw-plateswap:client:toggleDebug', function(debug)
   print('Setting debug to', debug)
   useDebug = debug
end)