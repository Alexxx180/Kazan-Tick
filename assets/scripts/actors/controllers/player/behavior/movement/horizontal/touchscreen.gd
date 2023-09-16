extends "res://addons/godot-behavior-tree-plugin/action.gd"

@export var speed: int = 5

func tick(tact: Tick):
	var actor = tact.actor
	var data = tact.blackboard
	var drag = data.get_value('drag')
	var e = data.get_value('event')

	if drag and e is InputEventMouseMotion or e is InputEventScreenDrag:
		data.set_value('drag', false)
		var axis = e.relative.x
		
		if axis > speed:
			actor.change_direction(1)
			return OK
		elif axis < -speed:
			actor.change_direction(-1)
			return OK
		
	return FAILED
