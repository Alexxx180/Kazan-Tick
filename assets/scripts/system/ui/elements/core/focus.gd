extends Node

@export var control: Control
@export var path: String
@export var on_start: bool

func focus():
	control.grab_focus()

func _ready():
	if control == null:
		control = get_node(path)
		
	if on_start:
		focus()
