extends CharacterBody3D

signal score_received(amount)

const SPEED = 30.0
const JUMP_VELOCITY = 10.0
const weight = 2

@export var terrain: Node3D
@export var paths: Node3D
@onready var markers = paths.get_children()
var movement = 1
var paused = true

@onready var start = $vision/start
@onready var retry = $vision/retry

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	change_direction(0)
	
func switch_pause():
	paused = !paused
	
func collide():
	terrain.switch_pause()
	retry.show()

func change_direction(turn):
	movement = clamp(movement + turn, 0, 2)
	position.x = markers[movement].position.x

func _physics_process(delta):
	if (paused):
		return

	if is_on_floor():
		# Handle Jump.
		if (Input.is_action_just_pressed("up") or Input.is_action_just_pressed("jump")):
			velocity.y = JUMP_VELOCITY
	else:
		# Add the gravity.
		velocity.y -= gravity * weight * delta
		
	# Get the input direction and handle the movement/deceleration.
	if (Input.is_action_just_pressed("left")):
		change_direction(-1)
		
	if (Input.is_action_just_pressed("right")):
		change_direction(1)
		
