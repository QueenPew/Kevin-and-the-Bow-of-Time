extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Main.TresBonus = true
	pass # Replace with function body.

func _on_HSlider_value_changed(value):
	
	pass # Replace with function body.


func _on_speed_modifier_value_changed(value):
	get_node("player/bow").arrow_speed = value
	pass # Replace with function body.


func _on_crate_modifier_value_changed(value):
	get_node("player/bow").arrow_crate_cluster = value


func _on_force_arrow_value_changed(value):
	get_node("player/bow").arrow_push_factor = value
	pass # Replace with function body.
