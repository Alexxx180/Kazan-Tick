extends Node

func _detach(connections: Array[Dictionary], method: Callable):
	for connection in connections:
		if (connection.callable == method):
			connection.signal.disconnect(connection.callable)

func unbind(node: Node, method: Callable):
	var signals = node.get_signal_list()
	for current in signals:
		var connections = node.get_signal_connection_list(current.name)
		_detach(connections, method)
