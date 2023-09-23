extends Node3D

@onready var tree = $AnimationPlayer/tree
@onready var animation = $AnimationPlayer

var last = "run"

func interrupt(state: String):
	var request = "parameters/character/transition_request"
	tree.set(request, state)
	
func act(action: String):
	if (action == last):
		return
	var request = "parameters/active/transition_request"
	tree.set(request, action)
	last = action
	
func pause(is_active: bool):
	if (is_active):
		animation.stop(false)
	else:
		animation.play()
