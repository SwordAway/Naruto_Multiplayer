extends Button


func _on_fechar_ajuda_mouse_entered():
	$close_help.modulate = Color (0.67, 0.67, 0.67)
	pass # Replace with function body.


func _on_fechar_ajuda_mouse_exited():
	$close_help.modulate = Color (1, 1, 1)
	pass # Replace with function body.


func _on_fechar_ajuda_pressed():
	$close_help.modulate = Color (0.5, 0.5, 0.5)
	get_tree().change_scene("res://Cenas/imgselect/tela_selecao.tscn")
	pass # Replace with function body.
