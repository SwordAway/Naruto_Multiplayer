extends Button

func _on_voltaTelaselecao_mouse_entered():
	$select.modulate = Color (0.67, 0.67, 0.67)
	pass # Replace with function body.



func _on_voltaTelaselecao_mouse_exited():
	$select.modulate = Color (1, 1, 1)
	pass # Replace with function body.


func _on_voltaTelaselecao_pressed():
	$select.modulate = Color (0.5, 0.5, 0.5)
	get_tree().change_scene("res://Cenas/imgselect/tela_selecao.tscn")
	pass # Replace with function body.
