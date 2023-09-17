extends Button

signal continue_pressed

var group
var player

func go():
	emit_signal("continue_pressed")
	player.switch_pause()

func _ready():
	group = get_parent()
	var menu = group.get_parent()
	var screen = menu.get_parent()
	var vision = screen.get_parent()
	player = vision.get_parent()
