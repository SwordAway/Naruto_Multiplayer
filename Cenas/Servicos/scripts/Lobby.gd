extends Control

func _ready():
	# Called every time the node is added to the scene.
	Network.connect("connection_failed", self, "_on_connection_failed")
	Network.connect("connection_succeeded", self, "_on_connection_success")
	Network.connect("player_list_changed", self, "refresh_lobby")
	Network.connect("game_ended", self, "_on_game_ended")
	Network.connect("game_error", self, "_on_game_error")
	# Set the player name according to the system username. Fallback to the path.
	if OS.has_environment("USERNAME"):
		$Connect/Name.text = OS.get_environment("USERNAME")
	else:
		var desktop_path = OS.get_system_dir(0).replace("\\", "/").split("/")
		$Connect/Name.text = desktop_path[desktop_path.size() - 2]


func _player_connected(id):
	rpc_id(id, "register_player", $Label_nickname/campo_Apelido.text)

remote func register_player(info):
	var id = get_tree().get_rpc_sender_id()
	Network.players[id] = info

func _on_Host_pressed():
	if $Connect/Name.text == "":
		$Connect/ErrorLabel.text = "Invalid name!"
		return

	$Connect.hide()
	$Players.show()
	$Connect/ErrorLabel.text = ""

	var port = 1517
	Network.host_game(port, $Connect/Name.text)
	refresh_lobby()

func _on_Join_pressed():
	if $Connect/Name.text == "":
		$Connect/ErrorLabel.text = "Invalid name!"
		return

	var ip = $Connect/IPAddress.text
	if not ip.is_valid_ip_address():
		$Connect/ErrorLabel.text = "Invalid IP address!"
		return

	$Connect/ErrorLabel.text = ""
	$Connect/Host.disabled = true
	$Connect/Join.disabled = true

	var port = 1517
	Network.join_game(ip, port, $Connect/Name.text)

func _on_connection_success():
	$Connect.hide()
	$Players.show()

func _on_connection_failed():
	$Connect/Host.disabled = false
	$Connect/Join.disabled = false
	$Connect/ErrorLabel.set_text("Connection failed.")

func _on_game_ended():
	show()
	$Connect.show()
	$Players.hide()
	$Connect/Host.disabled = false
	$Connect/Join.disabled = false

func _on_game_error(errtxt):
	$ErrorDialog.dialog_text = errtxt
	$ErrorDialog.popup_centered_minsize()
	$Connect/Host.disabled = false
	$Connect/Join.disabled = false

func refresh_lobby():
	var players = Network.get_player_list()
	players.sort()
	$Players/List.clear()
	$Players/List.add_item(Network.get_player_name() + " (Eu)")
	for p in players:
		$Players/List.add_item(p)

	$Players/Start.disabled = not get_tree().is_network_server()

func _on_start_pressed():
	Network.begin_game()
