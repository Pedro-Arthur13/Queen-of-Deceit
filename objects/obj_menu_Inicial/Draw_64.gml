var _mx = device_mouse_x_to_gui(0) //retorna a pos do mouse na gui
var _my = device_mouse_y_to_gui(0) //retorna a pos do mouse na gui

draw_set_font(F_menu_inicial)

#region alinhamento
draw_set_halign(fa_center) // Vertical
draw_set_valign(fa_middle) // Horizontal
#endregion

var tam_menu = array_length(menu_inicial)

for(var i = 0; i < tam_menu; i++){
	var _wgui = display_get_gui_width() // Largura
	var _hgui = display_get_gui_height() // altura
	
	//Espaço entre um texto e outro
	var _hstr = string_height("I") // heigth string
	var _wstr = string_width(menu_inicial[i])
	
	var x1 = _wgui/2 - _wstr/2
	var y1 = _hgui/2 -_hstr/2 +50+ _hstr * i //top left
	
	var x2 = _wgui/2 + _wstr/2
	var y2 = _hgui/2 +_hstr/2 +50+ _hstr * i // buttom right
	if(point_in_rectangle(_mx,_my,x1,y1,x2,y2)){
		
	escala[i] = lerp(escala[i],1.4,0.15)
	
	if(mouse_check_button_pressed(mb_left)){
		
		switch menu_inicial[i]{
			case menu_inicial[0]: //Jogar
			audio_play_sound(BNA_UI17,10,false)
			
			audio_pause_sound(Teste_Queen)
				create_transicao(Room3)
			case menu_inicial[1]: //Opcoes
				break
			case menu_inicial[2]: //Creditos
				create_transicao(Room17)
				break
			case menu_inicial[3]: // Sair
				game_end()
				break
			}
		}
	
	}
	else{
		escala[i] = lerp(escala[i],1,0.15)


	}	
	draw_text_transformed_color(_wgui/2,50+  _hgui/2 + _hstr*i,menu_inicial[i],escala[i],escala[i],0,c_black, c_black, c_black, c_black, 1)

}


draw_set_halign(-1) 
draw_set_valign(-1) 

draw_set_font(-1) // resetando a fonte (se não todo jogo vai ficar com a mesma font)
