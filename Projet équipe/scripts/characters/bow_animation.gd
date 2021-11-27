extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if self.is_playing():
		for child in get_parent().get_children():
			if child.is_in_group("projectiles"):
				child.position = get_parent().get_node("projectileSpawn").position
				child.global_scale = Vector2(1,1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
