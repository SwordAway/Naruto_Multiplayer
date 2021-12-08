extends Area2D

var mov = Vector2(300, 0)

func _ready():
	$Anima.play("shuriken")
	

func _process(delta):
	translate(mov * delta)
	
	pass

# configurar para atingir o player 
func _on_Area2D_body_entered(body):
	queue_free()
	pass # Replace with function body.

# Se atingir outro item
func _on_Shuriken_area_entered(area):
	queue_free()
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
