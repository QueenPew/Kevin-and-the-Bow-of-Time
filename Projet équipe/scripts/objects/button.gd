extends Area2D

signal button_pressed
signal button_depressed

export(bool) var resteAppuyer = false
var dejaAppuyer = false

func _on_button_body_entered(body):
	if dejaAppuyer && resteAppuyer:
		return
	emit_signal("button_pressed")
	dejaAppuyer = true
	pass # Replace with function body.


func _on_button_body_exited(body):
	if dejaAppuyer && resteAppuyer:
		return
	pass # Replace with function body.

