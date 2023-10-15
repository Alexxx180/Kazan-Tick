extends Node

var game

func drag(e, tact):
	var state = FAILED
	var data = tact.blackboard
	
	if data.get_value('drag'):
		state = game.swipe(e.relative.x, tact.actor.logic)
	if state == OK:
		data.set_value('drag', false)
		
	return state
