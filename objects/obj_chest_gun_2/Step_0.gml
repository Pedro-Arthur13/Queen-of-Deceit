// No evento Step do NPC
if (instance_exists(obj_player) and !instance_exists(obj_iceBullet) and !instance_exists(obj_bat)){
	var distancia = point_distance(x, y, obj_player.x, obj_player.y);
	var raio = 75; // Defina o raio do círculo em pixels
	
	// Verifica se a instância já existe
	if (distancia <= raio) and ! abriu{
	    // Jogador está dentro da área
		if !instance_exists(obj_chest_dialog){
	       instance_create_depth(x, y - 25, 0, obj_chest_dialog);
		}
	
		   if keyboard_check_pressed(ord("E")){
				abriu = true
		   }
		 
	}
	else {
	    // Jogador saiu da área
	  instance_destroy(obj_chest_dialog);
	  global.index = 0
	}
	if (sprite_index2 >12) {
		sprite_index2= -1
		instance_create_layer(x,y,"Instances_1_1",obj_supreme_wand)
		cotinua = false
	}
	if (abriu  and cotinua) {
		sprite_index2+= 1}

	image_index = sprite_index2
	
}