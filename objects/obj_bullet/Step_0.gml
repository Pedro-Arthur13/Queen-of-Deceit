
#region move

hspd = lengthdir_x(spd,dir)
vspd = lengthdir_y(spd,dir)

x += hspd
y += vspd
#endregion

#region cleanup

colide = [obj_block,obj_wall]
#region colisao
if(place_meeting(x,y,colide)){
	destroy = true
}
#endregion

//bullet out of range

// Quando uma nova instancia é criada no gamemaker ela armazena seu x inicial assim como seu y incial
// dessa forma podemos usar essas variaveis built-in para calcular quantos pixels as balas ja percorreram
if point_distance(xstart,ystart,x,y) > max_dist{
	destroy = true
	
}


if (destroy){
	//vfx here
	instance_destroy()
}

#endregion
