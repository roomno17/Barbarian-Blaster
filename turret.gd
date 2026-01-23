extends Node3D
var pro = preload("res://projectile.tscn")
var path : Path3D
var target: Node3D
@export var turret_range = 10
func _physics_process(delta: float) -> void:
	target = find_best_target()
	if target !=null:
		look_at(target.global_position,Vector3.UP,true)
func _on_timer_timeout() -> void:
	print(target)
	if target !=null:
		var new_projectile = pro.instantiate()
		add_child(new_projectile)
		new_projectile.global_position = global_position
		new_projectile.direction = global_transform.basis.z
func find_best_target()->PathFollow3D:
	var far = 0
	var best = null
	for p in path.get_children():
		if p is Enemy:
			if p.progress > far:
				var distance = global_position.distance_to(p.global_position)
				if distance <= turret_range:
					best = p
					far = p.progress
		
	return best
