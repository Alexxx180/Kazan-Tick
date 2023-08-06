extends CharacterBody3D

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
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * weight * delta

	# Handle Jump.
	if (Input.is_action_just_pressed("up") or Input.is_action_just_pressed("jump")) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if (Input.is_action_just_pressed("left")):
		change_direction(-1)
		
	if (Input.is_action_just_pressed("right")):
		change_direction(1)
		
	"""
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	"""
