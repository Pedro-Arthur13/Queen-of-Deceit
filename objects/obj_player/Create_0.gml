vspd = 0
hpsd = 0
spd = 5
moveDir = 0
global.indialog = false
centerYOffset = -9
centerY = y+ centerYOffset
weaponOffsetDist = 4
aimDir = 0

//weppon info

shooterTime = 0

// add weapons to player weapon inventory
array_push(global.PlayerWeapons,global.WeaponList.mp7 ) // funciona como um append
//array_push(global.PlayerWeapons,global.WeaponList.supreme_wand ) // funciona como um append

//array_push(global.PlayerWeapons, global.WeaponList.cajado ) 
//array_push(global.PlayerWeapons, global.WeaponList.shotgun) 

selectedWeapon = 0 //arma atual
weapon =  global.PlayerWeapons[selectedWeapon]


//vida do caboco
global.hplayer = 3



// Cria o inventário como um dicionário
inventory = ds_map_create();

// Inicializa os itens com 0 unidades
inventory[? "apple"] = 0;
//inventory[? "juice"] = 0;

// Lista dos itens para seleção
//inventory_items = ["apple", "juice"];
inventory_items = ["apple"];
selected_index = 0; // Começa com "apple"

// Dicionário de sprites associadas aos itens
item_sprites = ds_map_create();
item_sprites[? "apple"] = spr_apple; // Substitua por sua sprite real da maçã
//item_sprites[? "juice"] = spr_juice; // Substitua por sua sprite real do suco
