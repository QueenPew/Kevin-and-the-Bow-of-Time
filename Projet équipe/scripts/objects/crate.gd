extends RigidBody2D

var spawned_by_arrow = false
var speed_slow_down = 0.01
var bubbles = 0

func _ready():
	if spawned_by_arrow:
		var timer := Timer.new()
		timer.connect("timeout",self,"_on_timer_timeout") 
		add_child(timer)
		timer.set_wait_time(180.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _integrate_forces(state):
	if bubbles == 0:
		state.apply_central_impulse(-state.linear_velocity * 0.001)
	


func _on_crate_body_entered(body):
	pass
func on_slow_down(inside_bubble : int):
	bubbles = inside_bubble
