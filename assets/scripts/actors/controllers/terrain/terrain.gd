extends Node3D

## When a given block passes behind this node it is removed
## and a new block is added to the far end of the conveyor

@export var paused = true
@export var hero: CharacterBody3D
@onready var start = hero.pause.get_node("game/play/start")
@onready var retry = hero.pause.get_node("game/play/retry")

## Render speed and keeping count
@export var far = 8
@export var velocity: float = 15.0

@onready var terrain = $terrain
@onready var objects = $objects

func _ready() -> void:
	start.continue_pressed.connect(switch_pause)
	retry.continue_pressed.connect(switch_pause)
	terrain.fill_space(far)
	objects.fill_space(far)

func switch_pause() -> void:
	paused = !paused

func _physics_process(delta: float) -> void:
	if (not paused):
		_progress_terrain(delta)

func _progress_terrain(delta: float) -> void:
	terrain.progress_terrain(velocity, delta)
	objects.progress_terrain(velocity, delta)
