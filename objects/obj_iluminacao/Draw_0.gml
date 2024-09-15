if surface_exists(sombra_surface){ // para nao dar problema de memoria
	
	surface_set_target(sombra_surface) // para setar a surface, isso loca memoria
	depth = -10
	draw_set_color(c_black)
	draw_set_alpha(0.8)
	draw_rectangle(0,0,room_width,room_height,false)
	draw_set_alpha(1)
	draw_set_color(c_white)
	
	gpu_set_blendmode(bm_subtract) // basicamente vai alterar a forma em que se esta desenhando as coisas na tela (tipo excluir camada, iluminacao, etc)
	if instance_exists(obj_lampeao){
		var _num = instance_number(obj_lampeao) // quantas tochas temos
		for (var i =0; i < _num; i++){
			var _inst = instance_find(obj_lampeao,i) // verificar os ids das instancias
			
			draw_circle(_inst.x,_inst.y, 24 + irandom(-1),false)
	
			draw_set_alpha(0.5)
			draw_circle(_inst.x,_inst.y, 32 + irandom(-1),false) // circulo externo

			draw_set_alpha(1)
			gpu_set_blendmode(bm_normal)
		}
	}
	
	surface_reset_target() // pra sair da surface
}else{
	sombra_surface = surface_create(room_width,room_height)
}
draw_surface(sombra_surface,0,0)