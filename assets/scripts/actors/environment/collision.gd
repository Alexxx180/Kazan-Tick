extends Area3D

func _on_player_collide(body):
	body.collide()
	queue_free()

func change_look():
	var mesh = get_node_or_null("mesh")
	if (mesh == null):
		return
		
	var count = mesh.get_child_count()
	var current = randi_range(0, count - 1)
	mesh.get_child(current).show()
