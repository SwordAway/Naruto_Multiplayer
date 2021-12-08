extends Control
var Registerlink = "http://narutin.freevar.com/Homologacao/index.html"
var CreditsLink = "http://narutin.freevar.com/Homologacao/code-patronum.html#equipe"

# Called when the node enters the scene tree for the first time.
func _ready():
	$BackGroundMain.playing = true


func _process(delta):
	if($MainThemeMusic.playing == false):
		$MainThemeMusic.playing = true






func _on_CreditsButton_mouse_entered():
	$CreditsButton/AnimatedSprite.playing = true

func _on_CreditsButton_mouse_exited():
	$CreditsButton/AnimatedSprite.playing = false


func _on_RegisterButton_mouse_entered():
	$RegisterButton/AnimatedRegister.playing = true


func _on_RegisterButton_mouse_exited():
	$RegisterButton/AnimatedRegister.playing = false


func _on_RegisterButton_pressed():
	OS.shell_open(Registerlink)


func _on_CreditsButton_pressed():
	OS.shell_open(CreditsLink)


func _on_Join_pressed():
	var url = "http://narutin.freevar.com/consultar.php?";
	var data = "email=" + $TextEmail.text + "&password=" + $TextSenha.text;
	var headers = []
	var use_ssl = false
	$HTTPRequest.request(url + data, headers, use_ssl, HTTPClient.METHOD_GET)
	
#	OS.shell_open(JoinLink)


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print ("body = " + body.get_string_from_utf8())
	var resultado = body.get_string_from_utf8()
	
	if(resultado != ""):
		Global.player = resultado
#		$Timer.start() #ignora
		get_tree().change_scene("res://Cenas/Loading/Loading.tscn")
	else: #treco de mostrar a senhor invalida
		print("Senha ou e-mail Invalidos ")
	pass # Replace with function body.
