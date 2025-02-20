// No evento Step do NPC
var distancia = point_distance(x, y, obj_player.x, obj_player.y);
var raio = 75; // Defina o raio do círculo em pixels

// Verifica se a instância já existe
if (distancia <= raio) {
 
	   if keyboard_check_pressed(vk_space){
			instance_create_layer(0,0,"Instances_1",obj_dil)
	   }
}
