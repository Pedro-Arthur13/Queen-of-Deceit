if (!global.pause){
	#region damage and death
	// receive damage
	if place_meeting(x,y,obj_damageEnemy){
		var _inst = instance_place(x,y,obj_damageEnemy) // retorna o id da instancia
	
		//take damage from specific instance
		hp-= _inst.damage
	
		//tell the damage instance to destroy itself
		_inst.destroy = true
	}




	//death

	if (hp<=0){
		if(choose(true,false)){
			instance_create_layer(x,y,layer,obj_heart)
		}
		if(choose(true,false)){
			instance_create_layer(x,y,layer,obj_apple)
		}
		instance_create_layer(x, y, layer, obj_death_effect);
		instance_destroy()
	
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
	colide = [obj_block,obj_wall,obj_blocked]


	if place_meeting(x+velocidade,y,colide){
	
		while !place_meeting(x+sign(velocidade),y,colide){
			x += sign(velocidade) // Não usar x = sign(hspd)
			if (x < destino_x) x += sign(min(velocidade, destino_x - x));
			if (x > destino_x) x -= sign(min(velocidade, x - destino_x));
		}
		velocidade = 0
	}


	if (x < destino_x) x += min(velocidade, destino_x - x);
	if (x > destino_x) x -= min(velocidade, x - destino_x);

	if place_meeting(x,y+velocidade,colide){
	
		while !place_meeting(x,y+sign(velocidade),colide){
			if (y < destino_y) y += sign(min(velocidade, destino_y - y));
			if (y > destino_y) y -= sign(min(velocidade, y - destino_y));
		}
		velocidade = 0
	}
	if (y < destino_y) y += min(velocidade, destino_y - y);
	if (y > destino_y) y -= min(velocidade, y - destino_y);


	#endregion



}
