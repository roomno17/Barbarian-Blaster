extends PathFollow3D
@export var speed = 10

func _process(delta: float) -> void:
	progress+=speed*delta
