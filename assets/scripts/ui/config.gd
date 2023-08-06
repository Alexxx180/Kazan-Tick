extends Node

signal pause_pressed

func _process(_delta):
	if Input.is_action_just_pressed("toggle_fullscreen"):
		var fullscreen =  DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
		var mode = DisplayServer.WINDOW_MODE_MAXIMIZED if (fullscreen) else DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(mode)
		
	if Input.is_action_just_pressed("pause"):
		emit_signal("pause_pressed")
