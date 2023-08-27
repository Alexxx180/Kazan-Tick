extends Area3D

func _on_player_collide(body):
	print("Player hit!")
	body.collide()
	queue_free()
