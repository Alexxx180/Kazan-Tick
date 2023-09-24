extends VBoxContainer

@onready var switcher = $options/switcher

func _ready():
	var game = get_parent()
	var menu = game.get_parent()
	switcher.to_hide = game
	switcher.to_show = menu.get_node("options")
	

func _on_quit():
	get_tree().quit()
