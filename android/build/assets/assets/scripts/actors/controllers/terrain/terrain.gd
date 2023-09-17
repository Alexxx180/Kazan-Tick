extends Node3D

## When a given block passes behind this node it is removed
## and a new block is added to the far end of the conveyor

@export var paused = true
@export var hero: CharacterBody3D
@onready var start = hero.pause.get_node("game/play/start")
@onready var retry = hero.pause.get_node("game/play/retry")

## Render speed and keeping count
@export var decorations_far: Vector3 = Vector3(0, 8, 300)
@export var obstacles_far = 8
@export var velocity: float = 15.0

@onready var road = $terrain/road
@onready var lanterns = $terrain/lanterns
@onready var objects = $objects

func _ready() -> void:
	start.continue_pressed.connect(switch_pause)
	retry.continue_pressed.connect(switch_pause)
	road.fill_space(decorations_far.z)
	lanterns.fill_space(decorations_far.y)
	objects.fill_space(obstacles_far)

func switch_pause() -> void:
	paused = !paused

func _physics_process(delta: float) -> void:
	if (not paused):
		_progress_terrain(delta)

func _progress_terrain(delta: float) -> void:
	road.progress_terrain(velocity, delta)
	objects.progress_terrain(velocity, delta)
	lanterns.progress_terrain(velocity, delta)
