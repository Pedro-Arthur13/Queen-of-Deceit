
draw_self()
if (instance_exists(obj_lampeao)){
	var _posicao = obj_lampeao.y + (obj_lampeao.sprite_height/2)+3

	


if y> _posicao{
	depth = obj_lampeao.depth -1
}else{
	depth = obj_lampeao.depth +1

}
}
#region debug
draw_text_color(x,y-130,aimDir,c_black, c_black, c_black, c_black, 1)
draw_text_color(x,y-64,hspd,c_black, c_black, c_black, c_black, 1)
draw_text_color(x,y-80,vspd,c_black, c_black, c_black, c_black, 1)
draw_text_color(x,y-95,"HP: "+string(global.hplayer),c_black, c_black, c_black, c_black, 1)
#endregion





draw_my_weapon()