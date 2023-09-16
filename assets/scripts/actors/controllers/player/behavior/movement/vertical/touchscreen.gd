extends "res://addons/godot-behavior-tree-plugin/action.gd"

@export var speed: int = -10

func tick(tact: Tick):
	var data = tact.blackboard
	var drag = data.get_value("drag")
	var e = data.get_value('event')
	
	if drag and e is InputEventMouseMotion or e is InputEventScreenDrag:
		if (e.relative.y < speed):
			data.set_value('swipe', 'up')
			data.set_value('draf', false)
			return OK
	
	return FAILED
