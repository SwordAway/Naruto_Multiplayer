extends Node2D

var selec = 1
func _ready():
	pass
	
func _process(delta):
	$naruto.modulate = Color(0.2, 0.2, 0.2)
	$sasuke.modulate = Color(0.2, 0.2, 0.2)
	$sakura.modulate = Color(0.2, 0.2, 0.2)
	
	if(selec == 1):
		Global.personagem = 1
	if(selec == 2):
		Global.personagem = 2
	if(selec == 3):
		Global.personagem = 3
	
	if (Input.is_action_just_pressed("ui_left")):
		if (selec == 1):
			selec = 3
			pass
		else:
			selec -= 1 
			
	if (Input.is_action_just_pressed("ui_right")):
		if (selec == 3):
			selec = 1
			pass
		else:
			selec += 1
			
	elif(Input.is_action_just_pressed("enter")):
		get_tree().change_scene("res://Cenas/online/lobby.tscn")
		
	if (selec == 1):
		$naruto.modulate = Color(1, 1, 1)
	elif (selec == 2):
		$sakura.modulate = Color(1, 1, 1)
	elif (selec == 3):
		$sasuke.modulate = Color(1, 1, 1)
