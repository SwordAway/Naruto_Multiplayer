extends KinematicBody2D
class_name PersonagemGenerico

#---- VARIAVEIS ----#
var Movimento = Vector2(0,-1)
export var Velocidade_de_movimento = 480
export var Forca_do_pulo = -1000
export var Controle_do_giro = true

puppet var puppet_pos = Vector2()
puppet var puppet_motion = Vector2()

func _ready():
	puppet_pos = position

#---- FUNÇÕES ----#
func _movimento_do_personagem(delta):
	
	if is_network_master():
		#Aplicando gravidade
		if(not is_on_floor()):
			Movimento.y += Global.Gravidade * delta
		else:
			Movimento.y = Global.Gravidade * delta
		
			
	#	 Movimentação esquerda e direita do personagem.
	#	 A variavel "mover_direcoes" retorna o valor
	#	-1 = para a esquerda 
	#	 0 = para quando não estiver movendo
	#	 1 = para a direita
		var mover_direcoes = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		if(mover_direcoes == 1):
			if(Controle_do_giro == false):
				scale.x = scale.x * -1
			Controle_do_giro = true
		elif(mover_direcoes == -1):
			if(Controle_do_giro == true):
				scale.x = scale.x * -1
			Controle_do_giro = false
	
		#Realizar Pulo
		if(is_on_floor() && Input.is_action_just_pressed("ui_up")):
			Movimento.y = Forca_do_pulo/2
		Movimento.x = Velocidade_de_movimento * mover_direcoes
		
		puppet_pos = position 
		rset("puppet_motion", Movimento)
		rset("puppet_pos", position)
	else:
		position = puppet_pos
		Movimento = puppet_motion
		
	move_and_slide(Movimento, Vector2(0,-1))
	if not is_network_master():
		puppet_pos = position
	
func _physics_process(delta):
	_movimento_do_personagem(delta)
	
