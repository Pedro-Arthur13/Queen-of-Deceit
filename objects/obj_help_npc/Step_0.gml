// No evento Step do NPC
var distancia = point_distance(x, y, obj_player.x, obj_player.y);
var raio = 75; // Defina o raio do círculo em pixels

// Verifica se a instância já existe
if (distancia <= raio) {
    // Jogador está dentro da área
	if !instance_exists(obj_dialogo_help_npc){
       instance_create_depth(x, y - 25, 0, obj_dialogo_help_npc);
	}
	
	    if keyboard_check_pressed(vk_space){
			instance_create_layer(0,0,"Inventory",obj_dil)
	   }
}
else {
    // Jogador saiu da área
  instance_destroy(obj_dialogo_help_npc);
  global.index = 0
}
