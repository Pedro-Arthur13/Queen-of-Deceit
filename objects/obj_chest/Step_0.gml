// No evento Step do NPC
var distancia = point_distance(x, y, obj_player.x, obj_player.y);
var raio = 75; // Defina o raio do círculo em pixels

// Verifica se a instância já existe
if (distancia <= raio) and ! abriu{
    // Jogador está dentro da área
	if !instance_exists(obj_dialogo_help_npc) and !abriu{
       instance_create_depth(x, y - 25, 0, obj_dialogo_help_npc);
	}
	
	   if keyboard_check_pressed(ord("E")){
			global.index +=1 // Por algum motivo essa misera só funciona se vocë colocar metade dos frames
			instance_create_layer(x,y,"Instances_1_1",obj_apple)
			abriu = true
			sprite_index2 = 1
	   }
}
else {
    // Jogador saiu da área
  instance_destroy(obj_dialogo_help_npc);
  global.index = 0
}
image_index = sprite_index2