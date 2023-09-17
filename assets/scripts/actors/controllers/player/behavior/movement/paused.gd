extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tact: Tick) -> int:
	var states = tact.blackboard
	
	if states.get_value("over"):
		return OK
	
	if states.get_value("paused"):
		return OK
	
	return FAILED
