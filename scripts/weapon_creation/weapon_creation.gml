// Construtctor template for weapons 
// args = default
function create_weapon(_sprite = spr_mp7,_length =  0,_bulletObj = obj_bullet,_coolDown = 1, _bulletNum = 1, _spread = 0) constructor{
	sprite = _sprite;
	length = _length;
	bullet = _bulletObj;
	coolDown = _coolDown;
	bulletNum = _bulletNum
	spread = _spread
}

// inventário de armas do player 
global.PlayerWeapons = array_create(0) //Array vazio



// the weapons

// Quando ta azul significa que nao esta em escopo global, ou seja, nada pode referenciar
// As armas estao aqui porque, por exemplo: se estivesse no obj_player e alguma coisa fosse referenciá-las significa que 
// obrigatoriamente o player teria que existir na sala para referenciar
// o "W" de WeaponList tá maiusculo pra indicar que é global
global.WeaponList = {
	mp7 : new create_weapon(spr_mp7, 
		sprite_get_bbox_right(spr_mp7) - sprite_get_xoffset(spr_mp7),
		obj_bullet,
		10),// new struck, from weapon_creation
	
	cajado : new create_weapon(spr_fireWand, 
		sprite_get_bbox_right(spr_fireWand) - sprite_get_xoffset(spr_fireWand),
		obj_bullet_1,
		2),// new struck, from weapon_creation
	shotgun : new create_weapon(spr_shotgun,
		sprite_get_bbox_right(spr_shotgun) - sprite_get_xoffset(spr_shotgun),
		obj_redBullet,
		16,
		4,
		45),
	iceWand : new create_weapon(spr_iceWand, 
		sprite_get_bbox_right(spr_iceWand) - sprite_get_xoffset(spr_iceWand),
		obj_iceBullet,
		2)
}
