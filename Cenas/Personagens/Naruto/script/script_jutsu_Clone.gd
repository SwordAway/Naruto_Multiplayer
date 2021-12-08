extends Area2D


var mov = Vector2 (200, 0)
func _ready():
	if(Global.personagem == 1):
		$Anima.play("clone_voando_naruto")
	if(Global.personagem == 2):
		$Anima.play("clone_voando_sasuke")
	if(Global.personagem == 3):
		$Anima.play("clone_voando_sakura")
func _process(delta):
	
	translate(mov * delta)
	pass

# PRECISO DE AJUDA NESSA PARTE PARA ACERTAR O INIMIGO
func _on_Clone_body_entered(body):
	if(body):
		
		mov.x = 0
		if(Global.personagem == 1):
			$Anima.play("ataque_clone_naruto")
		if(Global.personagem == 2):
			$Anima.play("ataque_clone_sasuke")
		if(Global.personagem == 3):
			$Anima.play("ataque_clone_sakura")
		$Timer.queue_free()
		$Clone_corpo.queue_free()
		$Area_range.queue_free()
	pass


func _on_Anima_animation_finished(anim_name):
	
	if anim_name == "ataque_clone_naruto" or anim_name == "ataque_clone_sasuke" or "ataque_clone_sakura":
		mov.x = 0
		$Anima.play("fumaca")
		
	if anim_name == "fumaca":
		queue_free()
	pass 





func _on_Timer_timeout():
	mov.x = 0
	if(Global.personagem == 1):
		$Anima.play("ataque_clone_naruto")
	if(Global.personagem == 2):
		$Anima.play("ataque_clone_sasuke")
	if(Global.personagem == 3):
		$Anima.play("ataque_clone_sakura")
	$Clone_corpo.queue_free()
	$Area_range.queue_free()
	pass 



func _on_Clone_area_entered(area):
	if(area):
		mov.x = 0
		if(Global.personagem == 1):
			$Anima.play("ataque_clone_naruto")
		if(Global.personagem == 2):
			$Anima.play("ataque_clone_sasuke")
		if(Global.personagem == 3):
			$Anima.play("ataque_clone_sakura")
		$Timer.queue_free()
		$Clone_corpo.queue_free()
		$Soco.queue_free()
		$Area_range.queue_free()
	pass 
