@tool
extends Node


const Tick := preload("res://addons/godot-behavior-tree-plugin/tick.gd")


func _ready() -> void:
	
	if not get_child_count() == 1:
		push_error(str("BehaviorTree \"", name, "\" should have exactly one child."))


func tick(actor, blackboard, debug = false) -> int:
	
	var tick := Tick.new()
	tick.tree = self
	tick.actor = actor
	tick.blackboard = blackboard
	tick.debug = debug
	
	var result := FAILED
	
	for child in get_children():
		result = child._execute(tick)
	
	# Close nodes from last tick, if needed
	var last_open_nodes: Array = tick.blackboard.get_value('openNodes', self)
	var current_open_nodes := tick.open_nodes

	# If node isn't currently open, but was open during last tick, close it
	for node in last_open_nodes:
		if (not current_open_nodes.has(node) 
			and tick.blackboard.get_value('isOpen', tick.tree, node)):
				node._close(tick)

	# Populate the blackboard
	blackboard.set_value('openNodes', current_open_nodes, self)
	return result


func _notification(notification: int) -> void:
	
	if notification == NOTIFICATION_PARENTED or notification == NOTIFICATION_UNPARENTED:
		update_configuration_warnings()


func _get_configuration_warning() -> String:
	
	return ("" if get_child_count() == 1 else
	"A BehaviorTree should have exactly one child")

