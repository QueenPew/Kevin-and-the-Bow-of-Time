extends "res://scripts/objects/arrow_class.gd"

export(int, 0, 1000000000, 100) var speed = 1000
export (int, 0, 100000000, 1) var push_factor = 10 # Multiplication de la force sur un objet.
var charge = 1
var bubble = preload("res://Projectiles/timeStop/timeStopBubble.tscn").instance()
var velocity= Vector2()
var collided = false
var launched = false



func _physics_process(delta):
	if !launched or collided:
		disableCollisions($CollisionShape2D)
		return
	if bubbles:
		velocity +=  transform.x * speed * delta * charge * speed_slowdown
		velocity.y += delta * GRAVITY * speed_slowdown
	else:
		velocity +=  transform.x * speed * delta * charge
		velocity.y += delta * GRAVITY
	rotation = velocity.angle()
	
	var collision = move_and_collide(velocity, false)
	if collision:
		checkCollider(collision, speed, push_factor)
		
		self.get_parent().add_child(bubble)
		bubble.transform = $spawnBubble.global_transform
		reparentArrow(collision.collider, self)
		disableCollisions($CollisionShape2D)
		


