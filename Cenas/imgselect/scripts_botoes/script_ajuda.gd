extends Button

func _on_ajuda_mouse_entered():
	$help.modulate = Color (0.67, 0.67, 0.67)
	pass # Replace with function body.


func _on_ajuda_mouse_exited():
	$help.modulate = Color (1, 1, 1)
	pass # Replace with function body.


func _on_ajuda_pressed():
	$help.modulate = Color (0.5, 0.5, 0.5)
	get_tree().change_scene("res://Cenas/imgselect/tela_ajuda.tscn")
	pass # Replace with function body.
