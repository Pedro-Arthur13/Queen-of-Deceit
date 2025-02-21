if (!global.pause and !global.indialog){
	move = -keyboard_check(ord("A"))+keyboard_check(ord("D"))
	move_v = -keyboard_check(ord("W"))+keyboard_check(ord("S"))
	var _shootKey = mouse_check_button(mb_left)
	var _diagonalspd = spd * 0.707
	var _swapKeyPressed = mouse_check_button_pressed(mb_right) // botao pra trocar arma
	//show_debug_message(selectedWeapon)
	if (global.hplayer >3){
		global.hplayer =3
	}
	if (keyboard_check_pressed(ord("L"))){
		room_goto_next()
	}
	#region inventory
	// Muda o item selecionado com as teclas <- e ->
	if (keyboard_check_pressed(vk_right)) {
	    selected_index = (selected_index + 1) mod array_length(inventory_items);
	}

	if (keyboard_check_pressed(vk_left)) {
	    selected_index = (selected_index - 1 + array_length(inventory_items)) mod array_length(inventory_items);
	}

	// Obtem o item selecionado
	global.selected_item = inventory_items[selected_index];
	global.selected_sprite = item_sprites[? global.selected_item];

	if (place_meeting(x,y,obj_apple)){
		inventory[? "apple"] += 1;
		var apple_instance = instance_place(x, y, obj_apple); // Obtém a instância específica do obj_heart que está na posição
	    if (apple_instance != noone) {
	        instance_destroy(apple_instance); // Destrói apenas a instância detectada
	    }
	}
	if (place_meeting(x,y,obj_flame_wand)){
		array_push(global.PlayerWeapons, global.WeaponList.cajado ) 
		var flame_wand_instance = instance_place(x, y, obj_flame_wand); // Obtém a instância específica do obj_heart que está na posição
	    if (flame_wand_instance != noone) {
	        instance_destroy(flame_wand_instance); // Destrói apenas a instância detectada
	    }
	}
	if (place_meeting(x,y,obj_supreme_wand)){
		array_push(global.PlayerWeapons, global.WeaponList.supreme_wand ) 
		var supreme_wand_instance = instance_place(x, y, obj_supreme_wand); // Obtém a instância específica do obj_heart que está na posição
	    if (supreme_wand_instance != noone) {
	        instance_destroy(supreme_wand_instance); // Destrói apenas a instância detectada
	    }
	}

	if (keyboard_check_pressed(ord("F")) and (inventory[? global.selected_item] > 0)){
		global.hplayer += 2
		inventory[? global.selected_item] -= 1
	}

	#endregion

	// Teste de colisao com projeteis inimigos
	enemy_projectiles = [obj_iceBullet,obj_bullet_enemy,obj_bullet_Frog]

	enemys = [obj_iceMage,obj_bat]
	if (place_meeting(x,y,obj_bat)){
		spd = 2.5
	}else{
		spd = 3
	}
	#region VOID FALL
	// A lógica aqui é fazer a mecanica de se ele encostar no obj_fall, ele reproduzir a animação de cair, perder uma vida e voltar
	// para o xstart e ystart, tipo que nem o tower of 100 floors
	//if (place_meeting(x,y,obj_fall)){ 
	//	room_restart()
	//}
	#endregion

	#region Debug Sala
	// Apenas pra Debug
	if (keyboard_check(ord("R"))){
		room_goto(Debug_room)
	}
	#endregion

	colide = [obj_block,obj_wall,obj_blocked] // Array de colisão

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

	if place_meeting(x+hspd,y,colide){
	
		while !place_meeting(x+sign(hspd),y,colide){
			x += sign(hspd) // Não usar x = sign(hspd)
		}
		hspd = 0
	}


	x+= hspd

	if place_meeting(x,y+vspd,colide){
	
		while !place_meeting(x,y+sign(vspd),colide){
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
		if (selectedWeapon != 3) instance_create_layer(x,y,"Instances_1_1",obj_bulletParticle)


	
	}
	#endregion

	if place_meeting(x,y,enemy_projectiles){
		with(obj_iceBullet){
			instance_destroy()
		}
		with(obj_bullet_enemy){
			instance_destroy()
		}
		with(obj_bullet_Frog){
			instance_destroy()
		}
		global.hplayer -= 1
	}

	if global.hplayer <= 0{
		
		instance_destroy()

		room_restart()
		if (room == Room15){
			instance_create_layer(290,220,"Instances_1_1",obj_player)
		}else{
			instance_create_layer(290,267,"Instances_1_1",obj_player)}
		//instance_destroy()
	}

	if place_meeting(x, y, obj_nextRoom) {
	    if (room == Room13) { 
	        y = 220;
	    } else {
	        y = 267;
	    }
	    x = 290;
	    room_goto_next();
}

	if (place_meeting(x, y, obj_heart)) {
	    var heart_instance = instance_place(x, y, obj_heart); // Obtém a instância específica do obj_heart que está na posição
	    if (heart_instance != noone) {
	        global.hplayer += 1;
	        instance_destroy(heart_instance); // Destrói apenas a instância detectada
	    }
	}
	global.itemqtd = string(inventory[? global.selected_item]);



	// IMPORTANTE
	// Se o obj_bullet não for destruido ao sair da tela, ele permanecerá consumindo memoria

	if (!instance_exists(obj_iceMage) and !instance_exists(obj_bat) and !instance_exists(obj_bossFrog)) {
	    with(obj_blocked){
			instance_destroy()
		}
	
	
	}
}