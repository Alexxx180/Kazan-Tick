extends Node

@export var to_hide: Control
@export var hide_path: String

@export var to_show: Control
@export var show_path: String

func _ready():
	if (to_hide == null):
		to_hide = get_node(hide_path)
	
	if (to_show == null):
		to_show = get_node(show_path)

func switch():
	to_show.show()
	to_hide.hide()
