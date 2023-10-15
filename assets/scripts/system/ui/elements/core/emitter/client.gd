extends Node

signal on_submit()

@export var server_path: String
var server: Node

func _ready():
	server = get_node(server_path)

func _submit():
	server.on_receive.emit()
