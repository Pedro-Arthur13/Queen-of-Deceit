if (!global.pause) and hp > 0 and !global.indialog{
	#region damage and death
	// receive damage
	if place_meeting(x,y,obj_damageEnemy){
		var _inst = instance_place(x,y,obj_damageEnemy) // retorna o id da instancia
	
		//take damage from specific instance
		hp-= _inst.damage
	
		//tell the damage instance to destroy itself
		_inst.destroy = true
	}




	
	#endregion


	if (instance_exists(obj_player)){
		var _distancia = point_distance(x,y,obj_player.x,obj_player.y)
		colide = [obj_block,obj_wall]
		if shootTime >0 {
			shootTime --
		}
		centerY = y + centerYOffset
		aimDir = point_direction(x,centerY,obj_player.x,obj_player.y)


		if (_distancia < range){
			hostil = true

		}
		if hostil{
			sprite_index = spr_bossFrog
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
			sprite_index = spr_bossFrog
		}
	}
	#region randomSteps

	contador++;
    
	// Se chegou no tempo máximo, sorteia um novo destino
	if (contador >= tempo_max) {
	    contador = 0;
	    var deslocamento = irandom_range(40, 50);
        
	    if (choose(true, false)) {
	        destino_x = x + choose(-deslocamento, deslocamento);
	    } else {
	        destino_y = y + choose(-deslocamento, deslocamento);
	    }
	}
    
	// Movimento gradual até o destino
colide = [obj_block, obj_wall, obj_blocked];

// Movimento no eixo X
if (!place_meeting_multiple(x + sign(destino_x - x) * velocidade, y, colide)) {
    x += sign(destino_x - x) * min(velocidade, abs(destino_x - x));
} else {
    // Ajuste fino após colisão
    while (!place_meeting_multiple(x + sign(destino_x - x), y, colide)) {
        x += sign(destino_x - x);
    }
}

// Movimento no eixo Y
if (!place_meeting_multiple(x, y + sign(destino_y - y) * velocidade, colide)) {
    y += sign(destino_y - y) * min(velocidade, abs(destino_y - y));
} else {
    // Ajuste fino após colisão
    while (!place_meeting_multiple(x, y + sign(destino_y - y), colide)) {
        y += sign(destino_y - y);
    }
}


	#endregion



}
//death

if (hp<=0){
	// dialogo
	create_transicao(Room16)
}