extends Node

@export var control: Control
@export var path: String

func focus():
	control.grab_focus()

func _ready():
	if control != null:
		return
		
	if not path.is_empty():
		control = get_node(path)
