extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tact: Tick):
	var data = tact.blackboard
	var e = data.get_value('event')
	
	if e is InputEventMouseButton:
		data.set_value('drag', e.is_pressed())
	
	if e is InputEventScreenTouch and e.pressed:
		data.set_value('swipe', 'swiped')
		
	if not data.get_value("is_on_floor"):
		return OK
		
	return FAILED
