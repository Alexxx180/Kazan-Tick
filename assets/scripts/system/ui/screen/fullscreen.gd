extends TextureButton

func is_fullscreen(mode):
	return mode == DisplayServer.WINDOW_MODE_FULLSCREEN

func window(full):
	return (DisplayServer.WINDOW_MODE_MAXIMIZED if (full)
	else DisplayServer.WINDOW_MODE_FULLSCREEN)

func _toggle_fullscreen():
	var full = is_fullscreen(DisplayServer.window_get_mode())
	var mode = window(full)
	DisplayServer.window_set_mode(mode)
