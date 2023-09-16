extends Area3D

func _on_player_collide(body):
	print("Player hit!")
	body.collide()
	queue_free()

func change_look():
	var mesh = get_node_or_null("mesh")
	if (mesh == null):
		return
		
	var count = mesh.get_child_count()
	var current = randi() % count
	mesh.get_child(current).show()
