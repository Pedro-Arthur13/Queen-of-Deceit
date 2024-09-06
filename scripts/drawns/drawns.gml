// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_my_weapon(){
	
	//get the weapon of the players body
	var _xOffset = lengthdir_x(weaponOffsetDist,aimDir) 
	var _yOffset = lengthdir_y(weaponOffsetDist,aimDir) 
	//draw weapon
	var _weaponYscale = 1

	if aimDir> 90 and aimDir < 270{
		_weaponYscale = -1
	}else{
		_weaponYscale = 1

	}

	draw_sprite_ext(spr_mp7,0,x + _xOffset,centerY + _yOffset,1,_weaponYscale,aimDir,c_white,1)
}