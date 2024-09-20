draw_self()
image_yscale = 1.5
image_xscale = 1.5


if hostil{
	//get the weapon of the players body
	var _xOffset = lengthdir_x(weaponOffsetDist,aimDir) 
	var _yOffset = lengthdir_y(weaponOffsetDist,aimDir) 
	var _weaponXscale = 1.5
	//draw weapon
	var _weaponYscale = 1

	if aimDir> 90 and aimDir < 270{
		image_xscale = -1.5

		_weaponYscale = 1.5
	}else{
		_weaponYscale =1.5
		image_xscale = 1.5



	}

	draw_sprite_ext(weapon.sprite ,0,x + _xOffset,centerY + _yOffset,_weaponXscale,_weaponYscale,aimDir-90,c_white,1)
}
/*
draw_text_color(x,y-20,aimDir,c_black, c_black, c_black, c_black, 1)
