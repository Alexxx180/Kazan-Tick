extends Button

signal continue_pressed

func _continue():
	emit_signal("continue_pressed")
	get_parent().hide()
