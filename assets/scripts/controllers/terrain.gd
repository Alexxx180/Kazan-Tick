extends Node3D
class_name TerrainController
## This builds and operates the terrain "conveyor belt"
##
## A set of randomly choosen terrain blocks is rendered to the viewport.
## As the game played the terrian is moved in the posative Z direction.
## When a given block passes behind this node it is removed and a new block
## is added to the far end of the conveyor

@export var hero: CharacterBody3D
@onready var start = hero.start.get_node("option")

@export var paused = true




@export var interval: int = 100

## Holds the catalog of loaded terrain block scenes
@export var terrain: Array = []
var obstacles: Array = []
var current: Array[Node3D] = []
## The set of terrain blocks which are currently rendered to viewport

## Path to directory holding the terrain block scenes
@export_dir var files = "res://assets/scenes/actors/environment/areas"

## The number of blocks to keep rendered to the viewport
@export var num_terrain_blocks = 4

@export var terrain_velocity: float = 10.0


func _ready() -> void:
	_load_terrain_scenes(files)
	_init_blocks(num_terrain_blocks)
	
	start.continue_pressed.connect(switch_pause)

func switch_pause() -> void:
	paused = !paused
	hero.switch_pause()

func _physics_process(delta: float) -> void:
	if (not paused):
		_progress_terrain(delta)

func _get_mesh_center(block: Node3D):
	var instance = block.get_node("floor/mesh")
	return instance.mesh.size.y / 2
	

func _init_blocks(number_of_blocks: int) -> void:
	for block_index in number_of_blocks:
		var block = terrain.pick_random().instantiate()
		
		if block_index == 0:
			block.position.z = _get_mesh_center(block)
		else:
			_append_to_far_edge(current[block_index - 1], block)
		add_child(block)
		current.append(block)


func _progress_terrain(delta: float) -> void:
	for block in current:
		block.position.z += terrain_velocity * delta
		
	#_get_mesh_center(current[0]) * 2
	if current[0].position.z >= -5:
		var last_terrain = current[-1]
		var first_terrain = current.pop_front()
		var block = terrain.pick_random().instantiate()
		
		_append_to_far_edge(last_terrain, block)
		add_child(block)
		current.append(block)
		first_terrain.queue_free()


func _append_to_far_edge(target_block: Node3D, appending_block: Node3D) -> void:
	var target = _get_mesh_center(target_block)
	var append = _get_mesh_center(appending_block)
	appending_block.position.z = target_block.position.z - target - append


func _load_terrain_scenes(target: String) -> void:
	
	var blocks = DirAccess.open(target)
	for scene in blocks.get_files():
		var path = target + "/" + scene + ".tscn"
		var obstacle = load(path)
		obstacles.append(obstacle)
		print("Loaded obstacle: " + path)
		#terrain.append(obstacle)
