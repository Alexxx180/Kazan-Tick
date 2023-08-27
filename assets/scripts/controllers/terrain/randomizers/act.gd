extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tact: Tick):
	var result = tact.blackboard.get_value("placeholder")
	tact.blackboard.set_value("result", result.instantiate())
	
	return super.tick(tact)
	
