extends PersonagemGenerico

var run = false
var ataque = false
var shuriken = preload("res://Cenas/Ataques_e_habilidades/Shuriken.tscn")
var ataque_clone = preload("res://Cenas/Personagens/Naruto/Ataque_clone.tscn")
var jutsu_Bfogo = preload("res://Cenas/Ataques_e_habilidades/Bola_de_fogo.tscn")
var jutsu_shuriken = preload("res://Cenas/Ataques_e_habilidades/Jutsu_shuriken.tscn")
var dano = false
var cair = false
var morte = false
var combo = false
var combo2 = false


#teste mover personagem
export var veldaMorte = 100
var mortepersonagem = Vector2(veldaMorte,0) 




#Jutsu
sync func bola_de_fogo():
	var bola_fogo = jutsu_Bfogo.instance()
	bola_fogo.global_position = $Shuriken_eClone.global_position
	bola_fogo.z_index = -1
	if(self.Controle_do_giro == false):
		bola_fogo.scale.x = -1
	get_tree().root.add_child(bola_fogo)

func set_player_name(new_name):
	get_node("label").set_text(new_name)

func _ready():
#	____--- EM RELAÇÃO A QUAL PERSONAGEM FOI ESCOLHIDO ---____
	if (Global.personagem != 2):
		$".".queue_free()
	self.Velocidade_de_movimento = 200 
	self.Forca_do_pulo = -1000
	run = false
	ataque = false
	dano = false
	cair = false
	morte = false
	combo = false
	pass 


#_______________Reviver temporario para testes___________
#func _reviver():
#
#	if($".".global_position.y > 266):
#		get_tree().change_scene("res://Cenas/Cenario/Cenario.tscn")
#
#	pass
#________________________________________________________

func _damage():
	$Anima.play("sofrer_dano")
	self.Velocidade_de_movimento = 0
	dano = true
	pass
	
func _caindo():
	$Anima.play("levantar")
	self.Velocidade_de_movimento = 0
	cair = true
	pass

func _animacoes_basicas(delta):
#	Animações de morte e dano
	if( $Anima.current_animation == "levantar" || $Anima.current_animation == "morte" ):
		if(self.Controle_do_giro == false):
			translate(mortepersonagem * delta * -1)
		else:
			translate(mortepersonagem * delta )
		 
		
		
#	print(self.Movimento.y)
#	print(self.Velocidade_de_movimento)
	
	
	if (not ataque):
	#	-----Controle de correr, andar e parar-----
		if(Input.is_action_pressed("correr")):
			run = true
		else: 
			run = false
		
			
			
		if is_on_floor() && self.Movimento.x:
			if(run):
#				self.Velocidade_de_movimento = 300 
				$Anima.play("correndo")
			else:
#				self.Velocidade_de_movimento = 200 
				$Anima.play("andando")
				
		elif(Input.is_action_pressed("defesa")):
			$Anima.play("defender")
			self.Velocidade_de_movimento = 0
			
		elif(Input.is_action_just_released("defesa")):
			self.Velocidade_de_movimento = 200
			
		elif not $Anima.current_animation == "pulando" && is_on_floor() or $Anima.current_animation == "sofrer_dano" or $Anima.current_animation == "levantar" or $Anima.current_animation == "defender" or $Anima.current_animation == "vitoria" :
			$Anima.play("parado")
		
	#	-----Controle de cair e pular-----
		if is_on_floor() && Input.is_action_just_pressed("ui_up"):
			$Anima.play("pulando")
			
		elif not is_on_floor() && Input.is_action_just_pressed("ui_down"):
			$Anima.play("atk_alto_baixo")
			self.Movimento.y += 15000 * delta
			self.Velocidade_de_movimento = 0
			ataque = true
		
		elif not is_on_floor() && not $Anima.current_animation == "pulando" and not $Anima.current_animation == "parado" and not $Anima.current_animation == "atk_alto_baixo":
			self.Velocidade_de_movimento = 200
			$Anima.play("caindo")
			
#			-----Jutsu clone-----
		if Input.is_action_just_pressed("jutsu_1") && Global.Chakra_player >= 10: # J
			$Anima.play("jutsu_clone")
			$fumaca.play("fumaca")
			self.Velocidade_de_movimento = 0
			ataque = true
			Global.Chakra_player -=9
			var clone = ataque_clone.instance()
			clone.global_position = $Shuriken_eClone.global_position
			clone.z_index = -1
			if(self.Controle_do_giro == false):
				clone.scale.x = -1
			get_tree().root.add_child(clone)
			
#			-----Jutsu Shuriken----- fazer o jutsu na cena
#		elif Input.is_action_just_pressed("jutsu_2") && Global.Chakra_player >= 20: # H
#			$Anima.play("atk_shuriken")
#			self.Velocidade_de_movimento = 0
#			ataque = true
#			Global.Chakra_player -= 9
#			var atk_jutsu_shuriken = jutsu_shuriken.instance()
#			atk_jutsu_shuriken.global_position = $Shuriken_eClone.global_position
#			atk_jutsu_shuriken.z_index = -1
#			if(self.Controle_do_giro == false):
#				atk_jutsu_shuriken.scale.x = -1
#			get_tree().root.add_child(atk_jutsu_shuriken)

			
#			----- Jutsu bola de fogo -----
		elif Input.is_action_just_pressed("jutsu_3") && Global.Chakra_player >= 30: # L
			$Anima.play("jutsu_bola_fogo")
			self.Velocidade_de_movimento = 0
			self.Forca_do_pulo = 0
			ataque = true
			Global.Chakra_player -=9
		
#			----- Jutsu Chidori ----- Incompleto
#		elif Input.is_action_just_pressed("jutsu_4") && Global.Chakra_player >= 40: # L
#			$Anima.play("")
#			self.Velocidade_de_movimento = 0
#			self.Forca_do_pulo = 0
#			ataque = true
#			Global.Chakra_player -=9
			
#			------ Shuriken -----
		elif Input.is_action_just_pressed("shuriken") && Global.Chakra_player >= 1: # H
			$Anima.play("atk_shuriken")
			self.Velocidade_de_movimento = 0
			ataque = true
			Global.Chakra_player -= 0.5
			var atk_shuriken = shuriken.instance()
			atk_shuriken.global_position = $Shuriken_eClone.global_position
			atk_shuriken.z_index = -1
			if(self.Controle_do_giro == false):
				atk_shuriken.scale.x = -1
			get_tree().root.add_child(atk_shuriken)
			
#			-----Quebra defesa-----
		elif Input.is_action_just_pressed("quebra_defesa") and is_on_floor():
			$Anima.play("quebra_defesa")
			self.Velocidade_de_movimento = 0
			ataque = true
			
#			-----Inicio dos combos-----
		elif Input.is_action_just_pressed("combo") and is_on_floor():
			self.Velocidade_de_movimento = 0
			$Anima.play("soco")
			ataque = true
			combo = true
			
	
	elif(ataque):
		
#		TESTE VITORIA
		if Input.is_action_just_pressed("VITORIA"):
			$Anima.play("vitoria")
		
		if(combo):
			if Input.is_action_just_pressed("combo") and is_on_floor():
				self.Velocidade_de_movimento = 0
				$Anima.play("pesada")
			
	if(dano):
		
		pass
	if(cair):
		
		pass
	if(morte):
		pass


func _physics_process(delta):

	_reviver()
	_animacoes_basicas(delta)
	pass

func _reviver():
	if($".".global_position.y > 266):
		get_tree().change_scene("res://Cenas/imgselect/tela_game_over.tscn")

	pass

func _on_Anima_animation_finished(anim_name):
	
# Controlando a animação de cair após o pulo
	if(anim_name == "pulando" && not is_on_floor()):
		$Anima.play("caindo")
		
# Controlando a animação de atacar
	if (anim_name == "jutsu_clone" or anim_name == "fumaca" or anim_name == "quebra_defesa"
	or anim_name == "soco" or anim_name == "pesada" or anim_name == "atk_shuriken" or anim_name == "jutsu_bola_fogo_CFogo"
	or anim_name == "atk_alto_baixo"):
		self.Forca_do_pulo = -1000
		self.Velocidade_de_movimento = 200
		cair = false
		dano = false
		ataque = false
		
	if (anim_name == "sofrer_dano" or anim_name == "levantar"):
		$Anima.play("parado")
		self.Velocidade_de_movimento = 200
		cair = false
		ataque = false
		dano = false
	
	if(anim_name == "morte"):
		veldaMorte = 0
		
	if(anim_name == "jutsu_bola_fogo"):
		$Anima.play("jutsu_bola_fogo_CFogo")
		bola_de_fogo()

		pass

# ADICIONAR CADA ATAQUE (NOME) DOS OUTROS PERSONAGENS
func _on_Recebe_dano_area_entered(area):
	
	if (area.name == "Shuriken"):
		Global.Vida_player -= 2
		_damage()
	if(area.name == "Socos_chutes"):
		Global.Vida_player -= 3
		_damage()
	if(area.name == "Clone"):
		Global.Vida_player -= 5
		_damage()
	if(area.name == "Bola_fogo"):
		Global.Vida_player -= 10
		_damage()
		pass
		


func _on_Quebra_defesa_body_entered(body):
	if (body):
		Global.Vida_player -= 3
		_caindo()
	
	
	pass # Replace with function body.
