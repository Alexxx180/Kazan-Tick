extends "res://addons/godot-behavior-tree-plugin/action.gd"

var check: int

func stage_check(blackboard, stage):
	if (blackboard.get_value(stage) >= check):
		return FAILED
	
	blackboard.set_value(stage, check)
	return OK

func tick(tact: Tick):
	var result = tact.blackboard.get_value("placeholder")
	tact.blackboard.set_value("result", result.instantiate())
	return stage_check(tact.blackboard, "lap")
	
