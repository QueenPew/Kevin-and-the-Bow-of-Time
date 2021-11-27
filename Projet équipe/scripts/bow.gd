extends Sprite
export (float, 0, 3, 0.01) var fullBowPower = 2 # Combien de temps avant que l'arc soit chargé à 100% (en secondes)?

const projectileArray = [preload("res://Projectiles/normalArrow/normalArrow.tscn"),
preload("res://Projectiles/timeStop/timeStopArrow.tscn")] # BS pour projectiles

var time_charged = 0
var selectedArrow = 0
export(bool) var activateCrateArrow = false
  
export(int, 0, 10000, 100) var arrow_speed = 1000
export (int, 0, 100, 1) var arrow_push_factor = 10 # Multiplication de la force sur un objet.
export(int, 0,100, 1) var arrow_crate_cluster = 1
export(bool) var arrowsAreModifiable = false;

func _process(delta):
	var mousePosition = get_global_mouse_position()
	look_at(mousePosition) # regarder la position de la souris.


func _physics_process(delta):
	
	if Input.is_action_just_released("ui_fire"):
		var percentage = time_charged/fullBowPower
		$AnimationPlayer.play_backwards("string")
		shoot(percentage)

	
	if Input.is_action_just_released("ui_change_arrow_up"):
		selectedArrow += 1
		selectedArrow = clamp(selectedArrow,0 , projectileArray.size() - 1)
		changeVisibleArrow()
		
	
	if Input.is_action_just_released("ui_change_arrow_down"):
		selectedArrow -= 1
		selectedArrow = clamp(selectedArrow,0 , projectileArray.size() - 1)
		changeVisibleArrow()
	
	if Input.is_action_pressed("ui_fire"):
		if time_charged == 0:
			$AnimationPlayer.play("string")
		time_charged += delta
		var percentage = time_charged/fullBowPower

func _ready():
	set_process(true)
	changeVisibleArrow()
	if activateCrateArrow == true:
		projectileArray.append(preload("res://Projectiles/crateArrow/crateArrow.tscn"))
	
	pass # Replace with function body.

func shoot(power: float):
	time_charged = 0
	var p = projectileArray[selectedArrow].instance()
	p.launched = true
	p.charge = power
	spawn(p,owner.get_parent() , true)


func changeVisibleArrow():
	checkExistingChilds()
	var p = projectileArray[selectedArrow].instance()
	spawn(p, self, false)


func checkExistingChilds():
	for child in self.get_children():
		if child.is_in_group("projectiles"):
			child.free()

func spawn(projectile, owner, globalTransform : bool):
	owner.add_child(projectile)
	
	if globalTransform:
		projectile.global_transform = $projectileSpawn.global_transform
	else: 
		projectile.transform = $projectileSpawn.transform
	projectile.global_scale = Vector2(1,1)
	if arrowsAreModifiable:
		projectile.push_factor = arrow_push_factor
		projectile.speed = arrow_speed
		if "crate_cluster" in projectile:
			projectile.crate_cluster = arrow_crate_cluster
