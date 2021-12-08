extends Button


func _on_fecharjogo_mouse_entered():
	$clos.modulate = Color (0.67, 0.67, 0.67)
	pass # Replace with function body.


func _on_fecharjogo_mouse_exited():
	$clos.modulate = Color (0.67, 0.67, 0.67)
	pass # Replace with function body.


func _on_fecharjogo_pressed():
	$clos.modulate = Color (0.67, 0.67, 0.67)
	get_tree().quit()
	pass # Replace with function body.
