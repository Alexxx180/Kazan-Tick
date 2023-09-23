extends Node3D

## Render speed and keeping count
@export var obstacles_far = 6
@export var velocity: float = 15.0

@export var paused = true
@export var hero: CharacterBody3D

@onready var terrain = $terrain
@onready var objects = $objects

func switch_pause() -> void:
	paused = !paused

func _physics_process(delta: float) -> void:
	if (not paused):
		_progress_terrain(delta)

func _ready() -> void:
	hero.pause.get_node("game/play/start").continue_pressed.connect(switch_pause)
	hero.pause.get_node("game/play/retry").continue_pressed.connect(switch_pause)
	terrain.fill_space()
	objects.fill_space(obstacles_far)

func _progress_terrain(delta: float) -> void:
	var speed = velocity * delta
	terrain.progress_terrain(speed)
	objects.progress_terrain(speed)
	
