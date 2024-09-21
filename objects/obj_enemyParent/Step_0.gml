
#region damage and death
// receive damage
if place_meeting(x,y,obj_damageEnemy){
	var _inst = instance_place(x,y,obj_damageEnemy) // retorna o id da instancia
	
	//take damage from specific instance
	hp -= _inst.damage
	
	//tell the damage instance to destroy itself
	_inst.destroy = true
}




//death
if (hp<=0){
	instance_destroy()
}
#endregion