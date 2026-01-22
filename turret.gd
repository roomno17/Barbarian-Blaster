extends Node3D
var pro = preload("res://projectile.tscn")
var path : Path3D

func _physics_process(delta: float) -> void:
	var enemy = path.get_children().back()
	look_at(enemy.global_position)
func _on_timer_timeout() -> void:
	var new_projectile = pro.instantiate()
	add_child(new_projectile)
	new_projectile.global_position = position
