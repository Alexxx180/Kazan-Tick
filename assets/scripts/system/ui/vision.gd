extends Camera3D

@onready var toggle = $toggle

func pause():
	toggle.switch()
	
func game_over():
	toggle.switch()
	get_node("menu/game/play").change()
