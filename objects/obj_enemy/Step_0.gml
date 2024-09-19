/// @description Insert description here
//negoço pro bixo seguir o caboco

dir = point_direction(x, y, obj_player.x, obj_player.y)
hspd = lengthdir_x(spd, dir)
vspd = lengthdir_y(spd, dir)

x += hspd
y += vspd

if hp <= 0{
	instance_destroy()
}