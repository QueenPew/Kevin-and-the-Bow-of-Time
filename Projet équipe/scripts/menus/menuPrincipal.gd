extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Main.Bonus == true:
		$bonus.disabled = false
		$bonus.visible = true
	if Main.TresBonus == true:
		$TresBonus.disabled = false
		$TresBonus.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GitHub_Button_pressed():
	OS.shell_open("https://github.com/heavygabriel/Kevin-and-the-Bow-of-Time")
	pass # Replace with function body.
