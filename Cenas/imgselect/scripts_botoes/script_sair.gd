extends Button


func _on_sair_mouse_entered():
	$close.modulate = Color (0.67, 0.67, 0.67)
	pass # Replace with function body.


func _on_sair_mouse_exited():
	$close.modulate = Color (1, 1, 1)
	pass # Replace with function body.


func _on_sair_pressed():
	$close.modulate = Color (0.5, 0.5, 0.5)
	get_tree().quit()
	pass # Replace with function body.
