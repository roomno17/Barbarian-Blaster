extends Area3D
var direction = Vector3.FORWARD
@export var speed = 30

func _physics_process(delta: float) -> void:
	direction.y=0
	position+=direction*speed*delta
	print(position)

func _on_timer_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area3D) -> void:
	print(area)
	if area.is_in_group("enemy_area"):
		area.get_parent().health-=25
		queue_free()
