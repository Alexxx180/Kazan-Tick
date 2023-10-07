extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tact: Tick) -> int:
	var result = tact.blackboard.get_value("result")
	result.free_markers()
	return super.tick(tact)

