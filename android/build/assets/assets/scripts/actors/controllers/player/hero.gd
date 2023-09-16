extends CharacterBody3D

signal score_received(amount)

const JUMP_VELOCITY = 8.0
const weight = 2.5

var swipe_speed = Vector2(5, -10)

@export var terrain: Node3D
@export var paths: Node3D
@onready var markers = paths.get_children()
var movement = 1
var paused = true
var over = false

@onready var pause = $vision/pause
@onready var option = $vision/game/pause
@onready var view = $view

var drag = false
var swipe = 'swiped'

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	change_direction(0)
	
func switch_pause():
	paused = !paused
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
	over = true
	Global.highscore()
	terrain.switch_pause()
	switch_pause()
	pause.show()
	pause.get_node("game/play/start").hide()
	option.hide()
	pause.get_node("game/play/retry").show()
	view.interrupt("stop")

func change_direction(turn):
	movement = clamp(movement + turn, 0, 2)
	position.x = markers[movement].position.x

func _on_pause_pressed():
	terrain.switch_pause()
	switch_pause()

func _jump():
	velocity.y = JUMP_VELOCITY
	move_and_slide()
	view.act("jump")

func _drag(axis):
	if axis > swipe_speed.x:
		change_direction(1)
	elif axis < -swipe_speed.x:
		change_direction(-1)

func _input(e):
	if (over):
		return
	
	if (paused):
		return
	
	# Get the input direction and handle the movement/deceleration.
	if e is InputEventMouseButton:
		drag = e.is_pressed()
		
	if e is InputEventScreenTouch:
		if e.pressed:
			swipe = 'swiped'
	
	if drag and e is InputEventMouseMotion or e is InputEventScreenDrag:
		drag = false
		if (e.relative.y < swipe_speed.y):
			swipe = 'up'
		else:
			_drag(e.relative.x)
			
	if (Input.is_action_pressed("up") or Input.is_action_pressed("jump")):
		swipe = 'up'
		
	if (Input.is_action_just_pressed("left")):
		change_direction(-1)
		
	if (Input.is_action_just_pressed("right")):
		change_direction(1)

func _physics_process(delta):
	if (over):
		return
	
	if (paused):
		return

	if is_on_floor():
		# Handle Jump.
		if (swipe == 'up'):
			_jump()
			swipe = 'swiped'
	else:
		# Add the gravity.
		velocity.y -= gravity * weight * delta
		move_and_slide()
