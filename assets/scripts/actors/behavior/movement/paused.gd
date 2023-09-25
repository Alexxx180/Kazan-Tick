extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tact: Tick) -> int:
	if tact.blackboard.get_value("running") != OK:
		return OK
	
	return FAILED
