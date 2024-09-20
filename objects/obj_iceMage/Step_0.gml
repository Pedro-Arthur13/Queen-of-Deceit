var _distancia = point_distance(x,y,obj_player.x,obj_player.y)
if shootTime >0 {
	shootTime --
}
centerY = y + centerYOffset
aimDir = point_direction(x,centerY,obj_player.x,obj_player.y)


if (_distancia < range){
	hostil = true

}
if hostil{
	sprite_index = spr_iceMageAtack
	if shootTime <=0{
		var _dir = point_direction(x,y,obj_player.x,obj_player.y)
		var _xOffset = lengthdir_x(weapon.length + weaponOffsetDist,aimDir)
		var _yOffset = lengthdir_y(weapon.length + weaponOffsetDist,aimDir)
		shootTime = 40	
		var _bulletInst = instance_create_depth(x+_xOffset,centerY+_yOffset,depth-100,weapon.bullet)
		with (_bulletInst){
				dir = _dir
				image_angle = dir-90
			}
}
}else{
	sprite_index = spr_iceMageIdle
}