extends Control


onready var barra_vida = get_node("Barra_vida_frente").get("custom_styles/fg")
onready var barra_chakra = get_node("Barra_chakra_frente").get("custom_styles/fg")

func _ready():
	pass 

func _process(delta):
	
#	_______________VIDA_____________
	if(Global.Vida_player >= 73):
		barra_vida.bg_color = Color(0.188235, 0.847059, 0.031373)
	if(Global.Vida_player <= 72):
		barra_vida.bg_color = Color (0.533333, 0.847059, 0.031373)
	if(Global.Vida_player <= 49):
		barra_vida.bg_color = Color(0.847059, 0.396078, 0.031373)
	if(Global.Vida_player <= 27):
		barra_vida.bg_color = Color(0.847059, 0.031373, 0.031373)
		
# ______________CHAKRA______________
	if(Global.Chakra_player == 40 ):
		$Anima4.play("chakra_n4")
		$Anima3.play("chakra_n3")
		$Anima2.play("chakra_n2")
		$Anima1.play("chakra_n1")
	if(Global.Chakra_player <= 39 ):
		$Anima4.stop()
		$Anima3.play("chakra_n3")
	if(Global.Chakra_player <= 29):
		$Anima4.stop()
		$Anima3.stop()
		$Anima2.play("chakra_n2")
	if(Global.Chakra_player <= 19):
		$Anima4.stop()
		$Anima3.stop()
		$Anima2.stop()
		$Anima1.play("chakra_n1")
	if(Global.Chakra_player <= 9):
		$Anima4.stop()
		$Anima3.stop()
		$Anima2.stop()
		$Anima1.stop()

#_______________Barras de Vida e Chakra__________
	get_node("Barra_vida_frente").value = Global.Vida_player
	get_node("Barra_chakra_frente").value = Global.Chakra_player

	pass
