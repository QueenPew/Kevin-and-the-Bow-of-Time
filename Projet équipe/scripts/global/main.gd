extends Node
var Bonus = false
var TresBonus = false
func pixelate():
	pass
#	emit_signal("pixel_started")
#	while pixelisation != 100:
#		for item in get_tree().root.get_child(1).get_children():
#			if item.has_method("size_y") in Shader:
#				item.material.set_shader_param("size_y",pixelisation, "size_x", pixelisation )
#				pixelisation += 16
#				yield(get_tree().create_timer(0.2), "timeout")
#	emit_signal("pixel_finished")

var health : float
var maxHealth : int = 3
func damageTaken(var damage : float):
	if health - damage <= 0:
		return
	health =-damage

func heal(var amount : float):
	if health + amount >= maxHealth:
		return
	health += amount

func gameover():
	pass

