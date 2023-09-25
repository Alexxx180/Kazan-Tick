extends "res://assets/scripts/system/ui/elements/switcher/single.gd"

func _switch():
	super._switch()
	var hiding = to_show
	to_show = to_hide
	to_hide = hiding
