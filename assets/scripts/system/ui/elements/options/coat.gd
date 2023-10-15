extends Button

var skin: Node3D
@export var path: String

@onready var score = $margin/text/score

func _ready():
	skin = get_node(path)
	
	var high = Global.get_value("score")
	var default = Global.get_value("default")
	
	var available = high >= default
	disabled = !available
	
	if available:
		score.text = str(high)
	
	if (Global.get_value("coat")):
		button_pressed = true
		skin.show()


func _toggle_coat():
	Global.set_coat(!skin.visible)
	if (skin.visible):
		skin.hide()
	else:
		skin.show()
