draw_self()


depth = -11
draw_sprite_ext(weapon.sprite ,weapon,posxw,posyw,1,1,0,c_white,1)
draw_sprite_ext(spr_life_inventory ,index_heart,10,155,1.3,1.3,0,c_white,1)
if (global.selected_sprite == spr_apple){
	draw_sprite_ext(global.selected_sprite, 0,15, 250, 1, 1, 0, c_white, 1); 
	draw_text_transformed_color(25,232,global.itemqtd,tamanhoxr,tamanhoyr,0,12632256,12632256,12632256,12632256,1)

}


//draw_text(5,100,string(roomname_formated))

draw_text_transformed_color(posxr+10,posyr,roomname_formated,tamanhoxr,tamanhoyr,0,12632256,12632256,12632256,12632256,1)