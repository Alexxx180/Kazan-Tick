extends Area3D

func _on_player_collide(body):
	print("Work")
	body.collide()
	queue_free()
