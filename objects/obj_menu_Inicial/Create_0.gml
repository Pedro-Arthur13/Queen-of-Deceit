menu_inicial = ["Jogar","Opções","Créditos","Sair"]
escala[array_length(menu_inicial)-1] = 0// -1 pq essa função começa com 1 inves de 0

for(var i = 0; i<array_length(escala); i++){
	escala[i] = 1
}

instance_destroy(obj_player)