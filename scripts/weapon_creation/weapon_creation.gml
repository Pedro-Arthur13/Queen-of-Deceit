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