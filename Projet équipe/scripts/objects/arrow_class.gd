extends KinematicBody2D
export var GRAVITY = 20

export(float, 0, 1, 0.01) var speed_slowdown = 0.05
var bubbles = 0
func checkCollider (collision, speed, push_factor):
	if collision.collider.is_in_group("bodies"):
		if bubbles >= 1:
			collision.collider.apply_central_impulse(-collision.normal * speed * push_factor * speed_slowdown)
			return
		collision.collider.apply_central_impulse(-collision.normal * speed * push_factor)

func disableCollisions(collisionShape: CollisionShape2D):
	var parent : PhysicsBody2D = collisionShape.get_parent()
	parent.collision_mask = 0b0000000000000000000
	set_physics_process(false)

func reparentArrow(newParent, arrow):
	var temp_transform = arrow.global_transform
	
	arrow.get_parent().remove_child(arrow)
	newParent.add_child(arrow)
	
	arrow.global_transform = temp_transform
	pass



# Connecter une fonction au signal

func on_slow_down(inside_bubble: int ):
	bubbles += inside_bubble
