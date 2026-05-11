extends Node

var num_player = Input.get_connected_joypads().size()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_connection: int
	new_connection = Input.joy_connection_changed.connect(gamepad_connection_changed)

func gamepad_connection_changed(device: int, connected: bool):
	if connected:
		num_player = Input.get_connected_joypads().size()
		print("Connected device {d}.".format({"d":device}))
		add_player()
	else:
		pass
		#setup gamepad disconnected

func add_player():
	pass
