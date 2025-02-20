// Verifica se o objeto ultrapassou a altura máxima
if (y > ystart + distMax) {
    // Pode adicionar lógica extra aqui, se necessário
} else {
    // Verifica colisão horizontal com obj_block antes de mover
    if (!place_meeting(x + hspd, y, obj_block)) {
        x += hspd;
    } else {
        hspd = 0; // Para o movimento horizontal ao colidir
    }

    // Verifica colisão vertical com obj_block antes de mover
    if (!place_meeting(x, y + vspd, obj_block)) {
        y += vspd;
        vspd += gravidade; // Aplica a gravidade
    } else {
        vspd = 0; // Para o movimento vertical ao colidir
    }
}

// Destroi o objeto se sair da sala
if (y > room_height) {
    instance_destroy();
}
