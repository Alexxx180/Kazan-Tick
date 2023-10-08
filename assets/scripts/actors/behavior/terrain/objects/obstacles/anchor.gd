extends "res://addons/godot-behavior-tree-plugin/action.gd"

const step: int = 1

func anchor_free_space(memory, size):
	var from = max(memory - step, 0)
	var till = min(memory + step, size)
	return randi_range(from, till)

func tick(tact: Tick) -> int:
	var blackboard = tact.blackboard
	var memory = blackboard.get_value("anchor")
	var size = blackboard.get_value("amount")
	
	var anchor = anchor_free_space(memory, size)
	blackboard.set_value("anchor", anchor)
	return super.tick(tact)
