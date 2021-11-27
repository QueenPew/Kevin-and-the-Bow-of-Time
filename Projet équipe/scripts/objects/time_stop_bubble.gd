extends Area2D


func _ready():
	pass # Replace with function body.




func _on_time_stop_bubble_body_entered(body):
	if body.has_method("on_slow_down"):
		body.call("on_slow_down", 1)
	pass # Replace with function body.


func _on_time_stop_bubble_body_exited(body):
	if body.has_method("on_slow_down"):
		body.call("on_slow_down", -1)
	pass # Replace with function body.
