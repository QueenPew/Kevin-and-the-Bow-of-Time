extends Button
export(String, FILE, "*.tscn") var next_scene_path

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_change_scene_button_pressed():
	# Utiliser https://docs.godotengine.org/en/3.2/getting_started/step_by_step/singletons_autoload.html
	get_tree().change_scene(next_scene_path)
	pass # Replace with function body.
