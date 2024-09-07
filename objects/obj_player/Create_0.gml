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

//Struct

mp7 = new create_weapon(spr_mp7, sprite_get_bbox_right(spr_mp7) - sprite_get_xoffset(spr_mp7),obj_bullet,3)// new struck, from weapon_creation
cajado = new create_weapon(spr_cajado, sprite_get_bbox_right(spr_cajado) - sprite_get_xoffset(spr_cajado),obj_bullet_1,2,0.7,0.7)// new struck, from weapon_creation

weapon = cajado