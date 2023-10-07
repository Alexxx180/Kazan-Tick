extends Node3D

# Render speed and keeping count
@export var obstacles_far: int = 6
@export var velocity: float = 15.0

@export var paused = true
@export var hero: CharacterBody3D

@onready var terrain = $terrain
@onready var objects = $objects

func switch_pause() -> void:
	paused = !paused

func _physics_process(delta: float) -> void:
	if (not paused):
		_progress(delta)

func _ready() -> void:
	terrain.fill_space()
	objects.fill_space(obstacles_far)

func _progress(delta: float) -> void:
	var speed = velocity * delta
	terrain.progress(speed)
	objects.progress(speed)
