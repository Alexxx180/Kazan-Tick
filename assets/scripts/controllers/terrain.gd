extends Node3D

## When a given block passes behind this node it is removed
## and a new block is added to the far end of the conveyor

@export var paused = true
@export var hero: CharacterBody3D
@onready var start = hero.start.get_node("option")

## Render speed and keeping count
@export var far = 4
@export var interval: int = 5
@export var velocity: float = 1.0

@onready var terrain = $terrain
@onready var objects = $objects

func _ready() -> void:
	start.continue_pressed.connect(switch_pause)
	objects.set_interval(interval)
	terrain.fill_space(far)
	# objects.fill_space(far)

func switch_pause() -> void:
	paused = !paused
	hero.switch_pause()

func _physics_process(delta: float) -> void:
	if (paused):
		_progress_terrain(delta)

func _progress_terrain(delta: float) -> void:
	terrain.progress_terrain(velocity, delta)
	objects.progress_terrain(velocity, delta)
