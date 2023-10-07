extends "res://addons/godot-behavior-tree-plugin/action.gd"

@export_range(0, 2) var offset: int = 1

func anchor_free_space(amount):
	var anchor = randi_range(0, amount.size() - 1)
	return abs(anchor - offset)

func tick(tact: Tick) -> int:
	var amount = tact.blackboard.get_value("space")
	var anchor = anchor_free_space(amount)
	tact.blackboard.set_value("anchor", anchor)
	return super.tick(tact)

