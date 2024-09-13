
move = -keyboard_check(ord("A"))+keyboard_check(ord("D"))
move_v = -keyboard_check(ord("W"))+keyboard_check(ord("S"))
var _shootKey = mouse_check_button(mb_left)
var _diagonalspd = spd * 0.707
var _swapKeyPressed = mouse_check_button_pressed(mb_right) // botao pra trocar arma


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



#region weapon swapping
// weapon swapping
var _playerWeapons = global.PlayerWeapons
//cycle through weapons
if _swapKeyPressed{
	// change the selection and wrap around
	selectedWeapon ++
	
	if selectedWeapon >= array_length(_playerWeapons) {selectedWeapon = 0}
	
	// set the new weapon
	weapon = _playerWeapons[selectedWeapon]
}
#endregion
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
	shooterTime = weapon.coolDown
	// por cada instancia ser criada e ter seu propio id, nós podemos manipular ela e guardar seu id
	var _xOffset = lengthdir_x(weapon.length+ weaponOffsetDist,aimDir)
	var _yOffset = lengthdir_y(weapon.length+ weaponOffsetDist,aimDir)
	var _spread = weapon.spread
	// weapon.bulletNum-1 pq temos que dividir pela quantidade de espaços que temos, caso contariao teriamos um erro 
	// com amras que usam apenas 3 balas
	var _spreadDiv = _spread/max(weapon.bulletNum-1,1) // o minimo que pode ter de bala eh 1
	
	//create the correct number of bullets
	for (var i = 0; i < weapon.bulletNum; i++  ){
		
		var _bulletInst = instance_create_depth(x+_xOffset, centerY+_yOffset,depth-100,weapon.bullet) // topo do jogador
	
		//change the bullet direction
		with(_bulletInst){ // whenerver we use with, that means we are going inside of this other instance
	
			// o codigo aqui dentro deve ser escrito como se estivesse sendo escrito dentro da instancia
			dir = other.aimDir - _spread/2 + _spreadDiv*i // other significa que vai pegar do obj que esta mais acima no escopo, nesse caso eh o player
			//turn the bullet to the correct direction
			if dir_fix{
				image_angle = dir
			}
		}
	
	}
	
}
#endregion

// IMPORTANTE
// Se o obj_bullet não for destruido ao sair da tela, ele permanecerá consumindo memoria

