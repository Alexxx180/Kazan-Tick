extends Button

@export var path: String

var skin: Node3D

func _ready():
	skin = self.get_node(path)

func _toggle_coat():
	if (skin.visible):
		skin.hide()
	else:
		skin.show()
