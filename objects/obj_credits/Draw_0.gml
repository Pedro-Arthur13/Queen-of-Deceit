var y_pos = y_offset;
for (var i = 0; i < array_length(creditos); i++) {
    var entry = creditos[i];

    if (is_array(entry)) {
        var texto = entry[0];
        var tamanho = entry[1];

        switch (tamanho) {
            case "grande":
                draw_set_font(font_grande);
                break;
            case "normal":
                draw_set_font(font_normal);
                break;
            case "pequeno":
                draw_set_font(font_pequeno);
                break;
            case "menor":
                draw_set_font(font_menor);
                break;
        }
        var text_width = string_width(texto);
        draw_text((room_width / 2) - (text_width / 2), y_pos, texto);
    } else if (entry != "") {
        // Usa fonte normal para textos simples
        draw_set_font(font_normal);
        var text_width = string_width(entry);
        draw_text((room_width / 2) - (text_width / 2), y_pos, entry);
    }

    y_pos += 40; // Espaço entre linhas
}

// Movimenta o texto para cima
y_offset -= scroll_speed;

// Reinicia indo para Room1 após terminar a rolagem
if (y_pos < 0) {
    create_transicao(Room1);  // Substitua Room1 pelo nome correto da sala
}