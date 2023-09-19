@tool

extends MeshInstance3D
class_name MeshMerger

var result_mesh:ArrayMesh
var result_mesh_material:Material


@export var collision_parent_path: NodePath
@onready var collision_parent:Node

@export var btn_merge_meshes: bool: set = merge_meshes
@export var btn_clean_meshes: bool: set = clean_meshes

@export var toggle_children_visibility: bool: set = set_toggle_children_visibility
@export var delete_child_meshes_on_play: bool: set = set_delete_child_meshes_on_play

# warning-ignore:unused_argument
func merge_meshes(value):
	if !Engine.is_editor_hint():
		return

	if result_mesh:
		result_mesh.clear_surfaces()
	
	if collision_parent_path:
		collision_parent = get_node(collision_parent_path)
		clean_collisions()

	var _surface_tool := SurfaceTool.new()

	for node in get_children():
		if node is MeshInstance3D:
			_surface_tool.append_from(node.mesh, 0, node.transform)
			grab_material(node)
			generate_collisions(node)

		result_mesh = _surface_tool.commit()
	
	set_toggle_children_visibility(false)
	self.mesh = result_mesh
	self.material_override = result_mesh_material

# warning-ignore:unused_argument
func clean_meshes(value):
	if !Engine.is_editor_hint:
		return

	if collision_parent_path:
		collision_parent = get_node(collision_parent_path)

	mesh = ArrayMesh.new()
	clean_collisions()
	set_toggle_children_visibility(true)


func grab_material(node):
	if node.mesh:
		result_mesh_material = node.mesh.surface_get_material(0)
	elif node.get_surface_material(0):
		result_mesh_material = node.get_surface_material(0)

func generate_collisions(node):
	if !collision_parent or !collision_parent_path:
		return
	for child in node.get_children():
		if child is StaticBody3D and child.get_child_count() > 0:
			for grandchild in child.get_children():
				if grandchild is CollisionShape3D:
					var new_col := CollisionShape3D.new()
					new_col.global_transform = child.global_transform
					collision_parent.add_child(new_col)
					new_col.shape = grandchild.shape
					new_col.set_owner(get_tree().get_edited_scene_root())

func clean_collisions():
	if !collision_parent or !collision_parent_path:
		return
	if collision_parent.get_child_count() > 0:
		for child in collision_parent.get_children():
			child.queue_free()

func set_toggle_children_visibility(value):
	toggle_children_visibility = value
	for node in get_children():
		if node is MeshInstance3D:
			node.visible = value

func set_delete_child_meshes_on_play(value):
	delete_child_meshes_on_play = value


func _ready():
	if delete_child_meshes_on_play:
		for node in get_children():
			if node is MeshInstance3D:
				node.queue_free()
