<p align="center">
    <img width="140" src="https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/128/Letter-M-icon.png" />  
    <h1 align="center">Hi 👋, I'm MaDHouSe</h1>
    <h3 align="center">A passionate allround developer </h3>    
</p>

<p align="center">
    <a href="https://github.com/MH-Scripts/mh-vehiclesabotage/issues">
        <img src="https://img.shields.io/github/issues/MH-Scripts/mh-vehiclesabotage"/> 
    </a>
    <a href="https://github.com/MH-Scripts/mh-vehiclesabotage/watchers">
        <img src="https://img.shields.io/github/watchers/MH-Scripts/mh-vehiclesabotage"/> 
    </a> 
    <a href="https://github.com/MH-Scripts/mh-vehiclesabotage/network/members">
        <img src="https://img.shields.io/github/forks/MH-Scripts/mh-vehiclesabotage"/> 
    </a>  
    <a href="https://github.com/MH-Scripts/mh-vehiclesabotage/stargazers">
        <img src="https://img.shields.io/github/stars/MH-Scripts/mh-vehiclesabotage?color=white"/> 
    </a>
    <a href="https://github.com/MH-Scripts/mh-vehiclesabotage/blob/main/LICENSE">
        <img src="https://img.shields.io/github/license/MH-Scripts/mh-vehiclesabotage?color=black"/> 
    </a>      
</p>

# My Youtube Channel
- [Subscribe](https://www.youtube.com/c/@MaDHouSe79) 

# Demo
[![DEMO](https://img.youtube.com/vi/ipSu6yOrJ1A/0.jpg)](https://www.youtube.com/watch?v=ipSu6yOrJ1A)

# MH Vehicle Sabotage (OneSync Required)
- Sabotage any vehicle, cut brake lines or place a timed expolotion or a speed expolotion,
- when you cut the brake lines this will not happen on the spot, 
- this happends when the player drive the vehicle and use the brakes a few times and than the brake oil leaks, 
- but beware when other players drive over this oil leak and they slip 
- and have no control over the vehicle for a few secs because there is brake oil on the road.
- A player can fix the vehicle if they have the items that is needed,
- but if you set `SV_Config.UseAsJob` to true, then only players with the job can use and fix it.

# Dependencies
- [oxmysql](https://github.com/overextended/oxmysql/releases/tag/v1.9.3)
- [progressbar](https://github.com/qbcore-framework/qb-core/progressbar)
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-inventory](https://github.com/qbcore-framework/qb-core/qb-inventory) (2.0)
- [qb-target](https://github.com/qbcore-framework/qb-target) or [ox_target](https://github.com/overextended/ox_target/releases)
- [qb-minigames](https://github.com/qbcore-framework/qb-core/qb-minigames)

# Inventory Images
![alttext](https://github.com/MH-Scripts/mh-vehiclesabotage/blob/main/image/brake_cutter.png)
![alttext](https://github.com/MH-Scripts/mh-vehiclesabotage/blob/main/image/brake_line.png)
![alttext](https://github.com/MH-Scripts/mh-vehiclesabotage/blob/main/image/brake_oil.png)
![alttext](https://github.com/MH-Scripts/mh-vehiclesabotage/blob/main/image/carbom.png)
![alttext](https://github.com/MH-Scripts/mh-vehiclesabotage/blob/main/image/tire_knife.png)
![alttext](https://github.com/MH-Scripts/mh-vehiclesabotage/blob/main/image/toolbox.png)
![alttext](https://github.com/MH-Scripts/mh-vehiclesabotage/blob/main/image/new_tire.png)

# Installation
- Place the folder `mh-vehiclesabotage` in the folder `[mh]`
- Add the shared items in `qb-core/shared/items.lua`
- Add the images from the `mh-vehiclesabotage/images` folder to the `qb-inventory/html/images` folder.
- Add in server.cfg below `ensure [defaultmaps]` add `ensure [mh]`
- Restart your server.

# QB Shared items
```lua
brake_cutter                 = { name = 'brake_cutter', label = 'Brake Cutter', weight = 100, type = 'item', image = 'brake_cutter.png', unique = true, useable = true, shouldClose = true, description = 'A Brake Cutter to cut brake lines' },
brake_line                   = { name = 'brake_line', label = 'Brake Line', weight = 200, type = 'item', image = 'brake_line.png', unique = false, useable = true, shouldClose = true, description = 'A brake line to fix a vehicle brake' },
brake_oil                    = { name = 'brake_oil', label = 'Brake Oil', weight = 500, type = 'item', image = 'brake_oil.png', unique = false, useable = true, shouldClose = true, description = 'To refill your vehicle brake oil' },
carbom                       = { name = 'carbom', label = 'Car Bom', weight = 1000, type = 'item', image = 'carbom.png', unique = true, useable = true, shouldClose = true, description = 'A carbom' },
toolbox                      = { name = 'toolbox', label = 'Toolbox', weight = 1000, type = 'item', image = 'toolbox.png', unique = false, useable = true, shouldClose = true, description = 'Toolbox' },
tire_knife                   = { name = 'tire_knife', label = 'Tire knife', weight = 100, type = 'item', image = 'tire_knife.png', unique = true, useable = true, shouldClose = true, description = 'A Tire knife' },
new_tire                     = { name = 'new_tire', label = 'New Tire', weight = 2500, type = 'item', image = 'new_tire.png', unique = true, useable = true, shouldClose = true, description = 'A new vehicle tire' },
```

# Replace code in `qb-core` (client side)
- in `qb-core/client/functions.lua` around line 396
```lua
function QBCore.Functions.DeleteVehicle(vehicle)
    SetEntityAsMissionEntity(vehicle, true, true)
    TriggerServerEvent('mh-vehiclesabotage:server:unregisterVehicle', NetworkGetNetworkIdFromEntity(vehicle)) -- or add here
    DeleteVehicle(vehicle)
end
```

# Add code for `qb-radialmenu`
- in `qb-radialmenu/client/main.lua` around line 107
```lua
VehicleMenu.items[#VehicleMenu.items + 1] = {
    id = 'check_brakeline',
    title = 'Check Vehicle',
    icon = "check",
    type = 'client',
    event = "mh-vehiclesabotage:client:checkvehicle",
    shouldClose = true
}
```

# LICENSE
[GPL LICENSE](./LICENSE)<br />
&copy; [MaDHouSe79](https://www.youtube.com/@MaDHouSe79)
