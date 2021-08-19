# qb-beanmachine
This is a Bean Machine job script for QBCore that uses qb-target and nh-context, this was forked from https://github.com/DrBlackBeard095/Qb-Burgershot all credit goes to him all I did was make it a Bean Machine Job!


## REQUIREMENTS

PolyZone https://github.com/mkafrin/PolyZone

qb-target https://github.com/BerkieBb/qb-target

nh-context https://github.com/nerohiro/nh-context

## Add this to the shared.lua in qb-core

### Job

```
["bean"] = {
		label = "Bean Machine",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Employee",
                payment = 50
            },
			['1'] = {
                name = "Manager",
                payment = 75
			},
			['2'] = {
                name = "Owner",
				isboss = true,
                payment = 125
            },
        },
	},
```


### Items 


```
-- BEAN MACHINE
	["banana"]		 	         	 = {["name"] = "banana", 			  	  	    ["label"] = "Banana",    	            ["weight"] = 200, 		["type"] = "item", 	    ["image"] = "banana.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Banana."},
	["donut"]		 	         	 = {["name"] = "donut", 			  	  	    ["label"] = "Donut",    	            ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "donut.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Donut."},
	["eggsbacon"]		 	         = {["name"] = "eggsbacon", 			  	  	["label"] = "Eggs & Bacon",    	        ["weight"] = 600, 		["type"] = "item", 	    ["image"] = "eggsbacon.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Eggs & Bacon."},
	["frenchtoast"]		 	         = {["name"] = "frenchtoast", 			  	  	["label"] = "French Toast",    	        ["weight"] = 600, 		["type"] = "item", 	    ["image"] = "frenchtoast.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "French Toast."},
	["icecream"]		 	         = {["name"] = "icecream", 			  	  	    ["label"] = "Ice Cream",    	        ["weight"] = 200, 		["type"] = "item", 	    ["image"] = "icecream.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Ice Cream."},
	["pancakes"]		 	         = {["name"] = "pancakes", 			  	  	    ["label"] = "Pancakes",    	            ["weight"] = 500, 		["type"] = "item", 	    ["image"] = "pancakes.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Pancakes."},
	["panini"]		 	         	 = {["name"] = "panini", 			  	  	    ["label"] = "Panini",    	            ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "panini.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Panini."},
	["muffin"]		 	             = {["name"] = "muffin", 			  	  	    ["label"] = "Muffin", 		            ["weight"] = 600, 		["type"] = "item", 	    ["image"] = "muffin.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Tasty Muffin."},
	["cookie"]		 	             = {["name"] = "cookie", 			  	  	    ["label"] = "Chocolate Chip Cookie",    ["weight"] = 600, 		["type"] = "item", 	    ["image"] = "cookie.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Tasty Cookie."},
	["beans"]		 	             = {["name"] = "beans", 			  	  	    ["label"] = "Coffee Beans", 		    ["weight"] = 500, 		["type"] = "item", 	    ["image"] = "beans.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Coffee Beans."},
```


## Now add this to qb-smallresources server/consumables.lua

```
-- BEAN MACHINE

QBCore.Functions.CreateUseableItem("muffin", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatMuffin", source, item.name) 
    end
end)

QBCore.Functions.CreateUseableItem("cookie", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatCookie", source, item.name) 
    end
end)

QBCore.Functions.CreateUseableItem("panini", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatPaniniSandwich", source, item.name) 
    end
end)

QBCore.Functions.CreateUseableItem("donut", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatDonut", source, item.name) 
    end
end)

QBCore.Functions.CreateUseableItem("eggsbacon", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatEggsBacon", source, item.name) 
    end
end)

QBCore.Functions.CreateUseableItem("frenchtoast", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatFrenchToast", source, item.name) 
    end
end)

QBCore.Functions.CreateUseableItem("icecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name) 
    end
end)

QBCore.Functions.CreateUseableItem("banana", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name) 
    end
end)

QBCore.Functions.CreateUseableItem("pancakes", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatPancakes", source, item.name) 
    end
end)
```


## Then add this into qb-smallresources client/consumables.lua

```
-- BEAN MACHINE

RegisterNetEvent("consumables:client:EatMuffin")
AddEventHandler("consumables:client:EatMuffin", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating muffin", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:EatCookie")
AddEventHandler("consumables:client:EatCookie", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating cookie", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        HealMeth()
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:EatPaniniSandwich")
AddEventHandler("consumables:client:EatPaniniSandwich", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"sandwich"})
    QBCore.Functions.Progressbar("eat_something", "Eating panini sandwich", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:EatDonut")
AddEventHandler("consumables:client:EatDonut", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"donut"})
    QBCore.Functions.Progressbar("eat_something", "Eating donut", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("evidence:client:SetStatus", "food", 200)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:EatEggsBacon")
AddEventHandler("consumables:client:EatEggsBacon", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"sandwich"})
    QBCore.Functions.Progressbar("eat_something", "Eating eggs and bacon", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:EatFrenchToast")
AddEventHandler("consumables:client:EatFrenchToast", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"sandwich"})
    QBCore.Functions.Progressbar("eat_something", "Eating french toast", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("evidence:client:SetStatus", "food", 200)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:EatPancakes")
AddEventHandler("consumables:client:EatPancakes", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"sandwich"})
    QBCore.Functions.Progressbar("eat_something", "Eating pancakes", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        Meatfree()
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

-- END OF BEAN MACHINE
```

## And finally add this into qb-smallresources config.lua under Consumables

    ```
    ["muffin"] = math.random(15, 35),
    ["cookie"] = math.random(15, 35),
    ["eggsbacon"] = math.random(35, 54),
    ["panini"] = math.random(35, 54),
    ["donut"] = math.random(15, 34),
    ["icecream"] = math.random(15, 34),
    ["pancakes"] = math.random(25, 34),
    ["frenchtoast"] = math.random(25, 34),
    ["banana"] = math.random(25, 34),
```

After you do this everything should be good to go! I have also added images for the items in the images folder, just drop those into your inventory images folder and those will be good to go!
