if instance_exists(obj_player){
//chase the player
	dir = point_direction(x,y,obj_player.x,obj_player.y)
}
// pegando as velocidade
hspd =  lengthdir_x(spd,dir)
vspd = lengthdir_y(spd,dir)

if hspd > 0{
	face = 1
}
if hspd < 0{
	face = -1 
}

if place_meeting(x+hspd,y,obj_block) || place_meeting(x+hspd,y,obj_enemyParent){
	while !place_meeting(x+sign(hspd),y,obj_block){
		x += sign(hspd) // Não usar x = sign(hspd)
	}
	hspd = 0
}


x+= hspd

if place_meeting(x,y+vspd,obj_block) ||  place_meeting(x,y+vspd,obj_enemyParent){
	
	while !place_meeting(x,y+sign(vspd),obj_block){
		y += sign(vspd) // Não usar x = sign(hspd)
	}
	vspd = 0
}
y+= vspd

// Inherit the parent event
// die
event_inherited();

