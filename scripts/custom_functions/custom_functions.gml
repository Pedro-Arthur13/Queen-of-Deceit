// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.room = noone

function create_transicao(Room_index){
	global.room = Room_index
	instance_create_layer(0,0,"Instances_menu",obj_transicao)
	
}

function transicao_room(){
	
	if(global.opacidade_transicao <1){
	global.opacidade_transicao += 0.03
	}else{
		room_goto(global.room)

	}
}

// Adiciona um item ao inventário
function add_item(item_name, amount) {
    if (inventory[? item_name]) {
        inventory[? item_name] += amount;
    } else {
        inventory[? item_name] = amount;
    }
}

// Remove um item do inventário
function remove_item(item_name, amount) {
    if (inventory[? item_name] && inventory[? item_name] >= amount) {
        inventory[? item_name] -= amount;
    }
}
/// @function place_meeting_multiple(x, y, obj_array)
/// @desc Verifica colisão com múltiplos objetos no array
/// @param {real} x - Posição X para checar
/// @param {real} y - Posição Y para checar
/// @param {array} obj_array - Array de objetos para colisão

function place_meeting_multiple(_x, _y, _objs) {
    for (var i = 0; i < array_length(_objs); i++) {
        if (place_meeting(_x, _y, _objs[i])) {
            return true;
        }
    }
    return false;
}
