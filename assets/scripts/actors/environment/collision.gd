extends Area3D

func _on_player_collide(body):
	print("Player hit!")
	body.collide()
	queue_free()

func change_look():
	var mesh = $mesh
	var count = mesh.get_child_count()
	if (count > 0):
		var current = randi() % count
		mesh.get_child(current).show()
