extends Button

func _on_Button_mouse_entered():
	$jogar_novamente.modulate = Color (0.67, 0.67, 0.67)
	pass # Replace with function body.


func _on_Button_mouse_exited():
	$jogar_novamente.modulate = Color (1, 1, 1)
	pass # Replace with function body.


func _on_Button_pressed():
	$jogar_novamente.modulate = Color (0.5, 0.5, 0.5)
	get_tree().change_scene("res://Cenas/imgselect/tela_selecao.tscn")
	pass # Replace with function body.
