extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tact: Tick):
	var actor = tact.actor
	
	if (Input.is_action_just_pressed("left")):
		actor.change_direction(-1)
		return OK
	
	if (Input.is_action_just_pressed("right")):
		actor.change_direction(1)
		return OK
		
	return FAILED
