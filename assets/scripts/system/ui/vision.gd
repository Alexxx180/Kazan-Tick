extends Camera3D

@onready var score = $score
@onready var toggle = $toggle

func pause():
	toggle.switch()
	
func game_over():
	get_node("menu/game/play").change()
