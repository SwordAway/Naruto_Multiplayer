extends Node2D





# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	$Sprite/Anima1.play("loading")
	$Sprite/Anima2.play("bandana")




func _on_Timer_timeout():
	get_tree().change_scene("res://Cenas/imgselect/tela_selecao.tscn")
	pass
