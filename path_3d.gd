extends Path3D
@export var enemy_scene: PackedScene
@export var difficulty_manager : Node
@onready var timer: Timer = $Timer

func spawn_enemy():
	var enemyinst = enemy_scene.instantiate()
	add_child(enemyinst)
	timer.wait_time = difficulty_manager.get_spawn_time()
	print(timer.wait_time)
	print(difficulty_manager.get_spawn_time())

	

func _on_timer_timeout() -> void:
	spawn_enemy()
