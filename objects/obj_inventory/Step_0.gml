var _swapKeyPressed = mouse_check_button_pressed(mb_right)
// Atualizar o nome da sala formatado
var roomname = room_get_name(room); // Pega o nome da sala atual
switch (roomname) {
    case "Debug_room":
		posyr = 95
		posxr = 7
		tamanhoxr = 0.5
		tamanhoyr = 0.5
        roomname_formated = "Debug";
        break;
	case "Room3":
		roomname_formated = "0";
		break;
	case "Room4":
		roomname_formated = "1";
		break;

    default:
        roomname_formated = "Unknown"; // Nome padrão se a sala não for reconhecida
}

var _playerWeapons = global.PlayerWeapons
//cycle through weapons
if _swapKeyPressed{
	// change the selection and wrap around
	selectedWeapon ++
	
	if selectedWeapon >= array_length(_playerWeapons) {selectedWeapon = 0}
	
	// set the new weapon
	weapon = _playerWeapons[selectedWeapon]
}

switch (weapon.sprite){
	case spr_mp7:
		posxw = 12
		break;
	case spr_fireWand:
		posxw = 14
		break;
	case spr_shotgun:
		posxw = 7
		posyw=35
		break;
	
	
}
switch (global.hplayer){
	case 3:
		index_heart = 0
		break;
	case 2:
		index_heart = 1
		break;
	case 1:
		index_heart = 2
		break;
	case 0:
		index_heart = 3
		break;
}