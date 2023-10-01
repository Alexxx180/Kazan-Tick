extends Node

@export var remove: bool = true
@export var text: String

var detacher: Node

func _ready():
	if remove:
		detacher = $detacher
		
func _remove(control: Control):
	detacher.unbind(control, rename)
	queue_free()

func rename():
	var control = get_parent()
	control.text = text
	if remove:
		_remove(control)
