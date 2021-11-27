extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var bowPos = get_parent().get_parent().get_node("bow/look_hand").global_position
	look_at(bowPos)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
