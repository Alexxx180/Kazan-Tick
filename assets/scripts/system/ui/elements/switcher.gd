extends Node

@export var to_hide: Control
@export var to_show: Control

func _switch():
	to_show.show()
	to_hide.hide()
