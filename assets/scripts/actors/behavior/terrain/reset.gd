extends "res://addons/godot-behavior-tree-plugin/action.gd"

@export var lap: int = -1

func tick(tact: Tick):
	tact.blackboard.set_value("lap", lap)
	return OK
