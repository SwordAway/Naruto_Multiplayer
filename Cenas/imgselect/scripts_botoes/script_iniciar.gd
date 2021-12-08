extends Button

func _on_iniciar_mouse_entered():
#	$play.modulate = Color (255, 255, 255)
	$play.modulate = Color (0.67, 0.67, 0.67)
	pass # Replace with function body.


func _on_iniciar_mouse_exited():
	$play.modulate = Color (1, 1, 1)
	pass # Replace with function body.


func _on_iniciar_pressed():
	$play.modulate = Color (0.5, 0.5, 0.5)
	get_tree().change_scene("res://Cenas/online/lobby.tscn")
	pass # Replace with function body.
