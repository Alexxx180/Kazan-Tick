extends Button

signal continue_pressed

var screen
var group

func go():
	emit_signal("continue_pressed")
	screen.hide()

func _ready():
	group = get_parent()
	var menu = group.get_parent()
	screen = menu.get_parent()
