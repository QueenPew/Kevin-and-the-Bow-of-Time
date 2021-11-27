extends KinematicBody2D

export (int, 0, 100000000) var push = 30

export(int,0, 1000000 ) var SPEED = 250
export(int,0,10000000) var GRAVITY = 40
export(int,0,1000000) var JUMPFORCE = -850
const speed_slowdown = 1

var velocity = Vector2(0,0)

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED * speed_slowdown
#		if velocity.x <= 0:
#			$"kev sans bras".flip_h = false
#		if velocity.x >= 0:
#			$"kev sans bras".flip_h = true
#			print("eadf")
		
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED * speed_slowdown
#		if velocity.x <= 0:
#			$"kev sans bras".flip_h = false
#		if velocity.x >= 0:
#			$"kev sans bras".flip_h = true
#			print("eadf")
	velocity.y = velocity.y + GRAVITY * speed_slowdown
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = JUMPFORCE * speed_slowdown
	
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, PI/4, false)
	velocity.x = lerp(velocity.x, 0, 0.2)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * push * speed_slowdown)

func _ready():
	pass

