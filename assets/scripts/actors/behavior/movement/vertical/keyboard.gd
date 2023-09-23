extends "res://addons/godot-behavior-tree-plugin/action.gd"

func swipe(data):
	data.set_value('swipe', 'up')
	return OK


func tick(tact: Tick):
	if (Input.is_action_just_pressed("up")):
		return swipe(tact.blackboard)
	
	if (Input.is_action_just_pressed("jump")):
		return swipe(tact.blackboard)
		
	return FAILED
