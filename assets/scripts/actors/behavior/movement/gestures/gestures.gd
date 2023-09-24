extends "res://addons/godot-behavior-tree-plugin/action.gd"

@onready var mouse = $mouse
@onready var screen = $screen

func _ready():
	var game = $game
	mouse.game = game
	screen.game = game


func tick(tact: Tick):
	var e = tact.blackboard.get_value('event')
	
	if e is InputEventScreenDrag:
		return screen.touch(e, tact)
	
	if e is InputEventMouseMotion:
		return mouse.drag(e, tact)
		
	return FAILED
