
move = -keyboard_check(ord("A"))+keyboard_check(ord("D"))
move_v = -keyboard_check(ord("W"))+keyboard_check(ord("S"))
var _shootKey = mouse_check_button(mb_left)
var _diagonalspd = spd * 0.707
colide = [obj_block] // Array de colisão

moveDir = point_direction(0,0,move,move_v)

#region colisão 

#region movimentação diagonal
if(move !=0 and move_v !=0){
	hspd = move* _diagonalspd
	vspd = move_v* _diagonalspd
}
else{
	hspd = move * spd
	vspd = move_v *spd
}
#endregion

if place_meeting(x+hspd,y,obj_block){
	
	while !place_meeting(x+sign(hspd),y,obj_block){
		x += sign(hspd) // Não usar x = sign(hspd)
	}
	hspd = 0
}


x+= hspd

if place_meeting(x,y+vspd,obj_block){
	
	while !place_meeting(x,y+sign(vspd),obj_block){
		y += sign(vspd) // Não usar x = sign(hspd)
	}
	vspd = 0
}
y+= vspd

#endregion
//player aiming
centerY = y + centerYOffset


//aim
aimDir = point_direction(x,centerY,mouse_x,mouse_y)

#region Sprite control

//set player sprite
if aimDir> 90 and aimDir < 270{
	image_xscale = -1
}else{
	image_xscale = 1

}

#endregion
if shooterTime >0 {
	shooterTime --
}
#region shooting
if (_shootKey && shooterTime <=  0){
	shooterTime = shootCooldown
	// por cada instancia ser criada e ter seu propio id, nós podemos manipular ela e guardar seu id
	var _xOffset = lengthdir_x(weaponLenght+ weaponOffsetDist,aimDir)
	var _yOffset = lengthdir_y(weaponLenght+ weaponOffsetDist,aimDir)
	var _bulletInst = instance_create_depth(x+_xOffset, centerY+_yOffset,depth-100,bullet) // topo do jogador
	
	//change the bullet direction
	with(_bulletInst){ // whenerver we use with, that means we are going inside of this other instance
	
		// o codigo aqui dentro deve ser escrito como se estivesse sendo escrito dentro da instancia
		dir = other.aimDir // other significa que vai pegar do obj que esta mais acima no escopo, nesse caso eh o player
		
	}
	
}
#endregion

// IMPORTANTE
// Se o obj_bullet não for destruido ao sair da tela, ele permanecerá consumindo memoria