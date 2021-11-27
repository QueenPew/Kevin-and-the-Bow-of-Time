extends "res://scripts/objects/arrow_class.gd"

export(int, 0, 1000000, 100) var speed = 1000
export (int, 0, 1000000, 1) var push_factor = 10 # Multiplication de la force sur un objet.
var charge = 1
var velocity= Vector2()
var collided = false
var launched = false
# Voir RigidBody2D

func _physics_process(delta):
	if !launched or collided:
		disableCollisions($CollisionShape2D)
		return
	$despawnTimer.start()
	if bubbles > 0:
		velocity +=  transform.x * speed * delta * charge * speed_slowdown
		velocity.y += delta * GRAVITY * speed_slowdown
	else:
		velocity +=  transform.x * speed * delta * charge
		velocity.y += delta * GRAVITY
	if velocity.x > 0:
		velocity.x -= 0.01
	rotation = velocity.angle()
	
	var collision = move_and_collide(velocity, false)
	if collision:
		checkCollider(collision, speed, push_factor)
		reparentArrow(collision.collider, self)
		disableCollisions($CollisionShape2D)




func launch():
	if charge > 1:
		charge = 1
	launched = true

func _on_despawnTimer_timeout():
	queue_free()
	print("ey")
	pass 
