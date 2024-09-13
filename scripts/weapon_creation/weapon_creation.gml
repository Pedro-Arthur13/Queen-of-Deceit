// Construtctor template for weapons 
// args = default
function create_weapon(_sprite = spr_mp7,_length =  0,_bulletObj = obj_bullet,_coolDown = 1, _xScale=1,_yScale=1) constructor{
	sprite = _sprite;
	length = _length;
	bullet = _bulletObj;
	coolDown = _coolDown;
	xScale = _xScale;
	yScale = _yScale;
}

// the weapons

// Quando ta azul significa que nao esta em escopo global, ou seja, nada pode referenciar
// As armas estao aqui porque, por exemplo: se estivesse no obj_player e alguma coisa fosse referenciá-las significa que 
// obrigatoriamente o player teria que existir na sala para referenciar
// o "W" de WeaponList tá maiusculo pra indicar que é global
global.WeaponList = {
	mp7 : new create_weapon(spr_mp7, 
		sprite_get_bbox_right(spr_mp7) - sprite_get_xoffset(spr_mp7),
		obj_bullet,
		3),// new struck, from weapon_creation
	
	cajado : new create_weapon(spr_cajado, 
		sprite_get_bbox_right(spr_cajado) - sprite_get_xoffset(spr_cajado),
		obj_bullet_1,
		2,
		0.7,
		0.7)// new struck, from weapon_creation
}
