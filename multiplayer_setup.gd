extends Node

var num_player = Input.get_connected_joypads().size()
var players: Array = []
var input_maps: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_connection: int
	new_connection = Input.joy_connection_changed.connect(gamepad_connection_changed)

func gamepad_connection_changed(device: int, connected: bool):
	if connected:
		num_player = Input.get_connected_joypads().size()
		print("Connected device {d}.".format({"d":device}))
		add_player(device)
	else:
		pass
		#setup gamepad disconnected

func add_player(device: int):
	var player = load("res://player.tscn")
	var player_instance = player.instantiate()
	players.append(player_instance)
	print(players)
	
	input_maps.append({
		"ui_up{n}".format({"n": device}): Vector2.UP,
		"ui_right{n}".format({"n": device}): Vector2.RIGHT,
		"ui_down{n}".format({"n": device}): Vector2.DOWN,
		"ui_left{n}".format({"n": device}): Vector2.LEFT,
		#TODO Add more input maps here
	})
	player.ui_input = input_maps
