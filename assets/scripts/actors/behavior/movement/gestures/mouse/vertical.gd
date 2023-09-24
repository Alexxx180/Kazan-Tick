extends Node

var game
	
func drag(e, data):
	var state = FAILED
	if data.get_value('drag'):
		state = game.swipe(e.relative.y, data)
	if state == OK:
		data.set_value('drag', false)
	return state
	
