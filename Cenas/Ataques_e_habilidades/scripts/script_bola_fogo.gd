extends Area2D

var mov = Vector2(300, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Anima.play("bola_fogo")
	
	pass

func _process(delta):
	translate(mov * delta)
	pass


func _on_Timer_timeout():
	$Anima.play("bola_fogo_sumindo")
	mov.x = 0
	$Colli_bola_fogo.disabled = true
	
	pass 


func _on_Bola_fogo_area_entered(area):
	
	$Anima.play("bola_fogo_sumindo")
	mov.x = 0
	$Colli_bola_fogo.disabled = true
	$Timer.queue_free()
	pass 
	
func _on_Bola_fogo_body_entered(body):
	$Anima.play("bola_fogo_sumindo")
	mov.x = 0
	$Colli_bola_fogo.disabled = true
	
	pass 


func _on_Anima_animation_finished(anim_name):
	if (anim_name == "bola_fogo_sumindo"):
		$".".queue_free()
	pass 
