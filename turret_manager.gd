extends Node3D
class_name TurretManager
@export var turret: PackedScene
@export var enemy_path : Path3D
func build_turret(v:Vector3):
	var new_turret = turret.instantiate()
	add_child(new_turret)
	new_turret.global_position=v
	new_turret.position.y+=.3
	new_turret.path = enemy_path
