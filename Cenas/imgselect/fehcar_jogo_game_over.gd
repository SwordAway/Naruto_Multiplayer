extends Button


func _on_fehcar_jogo_game_over_mouse_entered():
	$fechar_jogo.modulate = Color (0.67, 0.67, 0.67)
	pass # Replace with function body.


func _on_fehcar_jogo_game_over_mouse_exited():
	$fechar_jogo.modulate = Color (1, 1, 1)
	pass # Replace with function body.


func _on_fehcar_jogo_game_over_pressed():
	$fechar_jogo.modulate = Color (0.5, 0.5, 0.5)
	get_tree().quit()
	pass # Replace with function body.
