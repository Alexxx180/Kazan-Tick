extends Node3D
class_name TerrainController
## This builds and operates the terrain "conveyor belt"
##
## A set of randomly choosen terrain blocks is rendered to the viewport.
## As the game played the terrian is moved in the posative Z direction.
## When a given block passes behind this node it is removed and a new block
## is added to the far end of the conveyor

## Holds the catalog of loaded terrain block scenes
@export var TerrainBlocks: Array = []
## The set of terrain blocks which are currently rendered to viewport
var terrain_belt: Array[Node3D] = []
@export var terrain_velocity: float = 10.0
## The number of blocks to keep rendered to the viewport
@export var num_terrain_blocks = 4
## Path to directory holding the terrain block scenes
@export_dir var terrain_blocks_path = "res://assets/scenes/actors/blocks/areas"


func _ready() -> void:
	_load_terrain_scenes(terrain_blocks_path)
	_init_blocks(num_terrain_blocks)


func _physics_process(delta: float) -> void:
	_progress_terrain(delta)

func _get_mesh_center(block: Node3D):
	var instance = block.get_node("floor/mesh")
	return instance.mesh.size.y / 2
	

func _init_blocks(number_of_blocks: int) -> void:
	for block_index in number_of_blocks:
		var block = TerrainBlocks.pick_random().instantiate()
		
		if block_index == 0:
			block.position.z = _get_mesh_center(block)
		else:
			_append_to_far_edge(terrain_belt[block_index - 1], block)
		add_child(block)
		terrain_belt.append(block)


func _progress_terrain(delta: float) -> void:
	for block in terrain_belt:
		block.position.z += terrain_velocity * delta
#_get_mesh_center(terrain_belt[0]) * 2
	if terrain_belt[0].position.z >= -5:
		var last_terrain = terrain_belt[-1]
		var first_terrain = terrain_belt.pop_front()

		var block = TerrainBlocks.pick_random().instantiate()
		_append_to_far_edge(last_terrain, block)
		add_child(block)
		terrain_belt.append(block)
		first_terrain.queue_free()


func _append_to_far_edge(target_block: Node3D, appending_block: Node3D) -> void:
	var target = _get_mesh_center(target_block)
	var append = _get_mesh_center(appending_block)
	appending_block.position.z = target_block.position.z - target - append


func _load_terrain_scenes(target_path: String) -> void:
	#var dir = DirAccess.open(target_path) - dir.get_files()
	for scene_path in ["left", "middle", "right"]:
		print("Loading terrain block scene: " + target_path + "/" + scene_path)
		TerrainBlocks.append(load(target_path + "/" + scene_path + ".tscn"))
