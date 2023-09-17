extends CharacterBody3D

signal score_received(amount)

const JUMP_VELOCITY = 7.2
const weight = 2

@export var terrain: Node3D
@export var paths: Node3D
@onready var markers = paths.get_children()
var marker = 1

@onready var pause = $vision/pause
@onready var option = $vision/game/pause
@onready var view = $view

@onready var blackboard = $blackboard
@onready var movement = $movement

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	blackboard.set_value('swipe', 'swiped')
	blackboard.set_value('over', false)
	blackboard.set_value('paused', true)
	blackboard.set_value('drag', false)
	change_direction(0)
	
func switch_pause():
	var paused = blackboard.get_value('paused')
	paused = !paused
	blackboard.set_value('paused', paused)
	# print("Current pause state: %s" % paused)
	if (paused):
		pause.show()
		option.hide()
		view.interrupt("stop")
	else:
		pause.hide()
		option.show()
		view.interrupt("active")
		
	
func collide():
	blackboard.set_value('over', true)
	Global.highscore()
	terrain.switch_pause()
	switch_pause()
	pause.show()
	pause.get_node("game/play/start").hide()
	option.hide()
	pause.get_node("game/play/retry").show()
	view.interrupt("stop")

func change_direction(turn):
	marker = clamp(marker + turn, 0, 2)
	position.x = markers[marker].position.x

func _on_pause_pressed():
	terrain.switch_pause()
	switch_pause()

func _jump():
	velocity.y = JUMP_VELOCITY
	move_and_slide()
	view.act("jump")

func _input(e):
	blackboard.set_value('event', e)
	movement.tick(self, blackboard)

func _physics_process(delta):
	if (blackboard.get_value('over') or blackboard.get_value('paused')):
		return

	if is_on_floor():
		# Handle Jump.
		if (blackboard.get_value('swipe') == 'up'):
			_jump()
			blackboard.set_value('swipe', 'swiped')
	else:
		# Add the gravity.
		velocity.y -= gravity * weight * delta
		move_and_slide()
