extends StaticBody2D

export(String) var buttonAConnecter = ""
var bubbles = 0 # Dans combien de bulles est située l'objet?
export(float, 0, 1, 0.01) var speed_modifier = 0.5
export(String) var animation = "porte"
func _ready():
	get_parent().get_node(buttonAConnecter).connect("button_pressed", self, "on_button_pressed")
	get_parent().get_node(buttonAConnecter).connect("button_depressed", self,"on_button_depressed")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_button_pressed():
	$AnimationPlayer.play(animation)
	pass

func _on_button_depressed():
	$AnimationPlayer.play_backwards(animation)
	pass

func on_slow_down(inside_bubble: int ):
	bubbles += inside_bubble
	if bubbles >= 1:
		$AnimationPlayer.playback_speed = speed_modifier
	pass
