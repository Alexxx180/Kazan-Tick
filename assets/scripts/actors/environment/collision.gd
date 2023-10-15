extends Area3D

func _on_player_collide(body):
	body.collide()
	get_parent().queue_free()

func change_look():
	var mesh = get_node_or_null("mesh")
	if (mesh == null):
		return
		
	var count = mesh.get_child_count() - 1
	var current = randi_range(0, count)
	mesh.get_child(current).show()
