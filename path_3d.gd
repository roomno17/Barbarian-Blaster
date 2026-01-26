extends Path3D
@export var enemy_scene: PackedScene
func spawn_enemy():
	var enemyinst = enemy_scene.instantiate()
	add_child(enemyinst)

	

func _on_timer_timeout() -> void:
	spawn_enemy()
