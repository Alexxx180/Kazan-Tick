extends Node3D

var hero: CharacterBody3D

@onready var view = $view
@onready var blackboard = $blackboard
@onready var movement = $movement

func _input(e):
	blackboard.set_value('event', e)
	movement.tick(hero, blackboard)

func _ready():
	blackboard.set_value('swipe', 'swiped')
	blackboard.set_value('running', ERR_BUSY)
	blackboard.set_value('drag', false)
	blackboard.set_value('event', null)
	set_floor(true)


func set_floor(on_floor: bool):
	blackboard.set_value('is_on_floor', on_floor)

func jump():
	blackboard.set_value('swipe', 'swiped')
	view.act("jump")
	set_floor(false)

func is_jumping():
	return blackboard.get_value('swipe') == 'up'

func is_running():
	return blackboard.get_value('running') == OK

func pause():
	var running = blackboard.get_value('running')
	if (running == OK):
		blackboard.set_value('running', ERR_BUSY)
		view.interrupt('stop')
	else:
		blackboard.set_value('running', OK)
		view.interrupt('active')
