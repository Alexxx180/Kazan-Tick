extends StaticBody3D

var view: get = get_view

func get_view():
	if (view == null):
		view = $view
	return view

func get_center():
	return view.mesh.size.y / 2
	
func append_to_edge(target: Node3D, interval: int) -> void:
	var z = target.position.z
	var center = target.get_center()
	var append = get_center()
	position.z = z - center - append - interval
	print("Next terrain: %s" % position.z)
