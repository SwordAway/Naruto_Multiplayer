extends Button



func _on_fecharPause_mouse_entered():
	$stop.modulate = Color (0.67, 0.67, 0.67)
	pass # Replace with function body.


func _on_fecharPause_mouse_exited():
	$stop.modulate = Color (1, 1, 1)
	pass # Replace with function body.

func _on_fecharPause_pressed():
	$stop.modulate = Color (0.5, 0.5, 0.5)
	get_tree().change_scene("res://Cenas/Cenario/Cenario.tscn")
	pass # Replace with function body.
