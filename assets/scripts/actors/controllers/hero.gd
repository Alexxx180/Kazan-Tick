extends CharacterBody3D

signal score_received(amount)

const JUMP_VELOCITY = 6.0
const weight = 2

@export var terrain: Node3D
@export var paths: Node3D
@onready var markers = paths.get_children()
var movement = 1
var paused = true
var over = false

@onready var pause = $vision/pause

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	change_direction(0)
	
func switch_pause():
	paused = !paused
	# print("Current pause state: %s" % paused)
	if (paused):
		pause.show()
	else:
		pause.hide()
		
	
func collide():
	over = true
	Global.highscore()
	terrain.switch_pause()
	switch_pause()
	pause.show()
	pause.get_node("game/play/start").hide()
	pause.get_node("game/play/retry").show()

func change_direction(turn):
	movement = clamp(movement + turn, 0, 2)
	position.x = markers[movement].position.x

func _physics_process(delta):
	if (over):
		return
	
	if (Input.is_action_just_pressed("cancel")):
		terrain.switch_pause()
		switch_pause()
	
	if (paused):
		return

	if is_on_floor():
		# Handle Jump.
		if (Input.is_action_pressed("up") or Input.is_action_pressed("jump")):
			velocity.y = JUMP_VELOCITY
			move_and_slide()
	else:
		# Add the gravity.
		velocity.y -= gravity * weight * delta
		move_and_slide()
		
	# Get the input direction and handle the movement/deceleration.
	if (Input.is_action_just_pressed("left")):
		change_direction(-1)
		
	if (Input.is_action_just_pressed("right")):
		change_direction(1)
		
