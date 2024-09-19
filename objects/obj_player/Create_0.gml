vspd = 0
hpsd = 0
spd = 3
moveDir = 0

centerYOffset = -9
centerY = y+ centerYOffset
weaponOffsetDist = 4
aimDir = 0

//weppon info

shooterTime = 0

// add weapons to player weapon inventory
array_push(global.PlayerWeapons,global.WeaponList.mp7 ) // funciona como um append
array_push(global.PlayerWeapons, global.WeaponList.cajado ) 
array_push(global.PlayerWeapons, global.WeaponList.shotgun) 

selectedWeapon = 2 //arma atual
weapon =  global.PlayerWeapons[selectedWeapon]


//vida do caboco
hp = 3