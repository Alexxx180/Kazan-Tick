extends Node

var game
	
func drag(e, tact):
	var data = tact.blackboard
	var state = FAILED
	
	if data.get_value('drag'):
		state = game.swipe(e.relative.y, data)
	if state == OK:
		data.set_value('drag', false)
		
	return state
	
