extends PathFollow3D
class_name Enemy
## The speed in m/s the enemy will move
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank: MarginContainer = get_tree().get_first_node_in_group("bank")
@export var speed :float = 10.0
@export var max_health = 50
@export var loot = 50
var health:int:
	set(new_health):
		if health>new_health:
			animation_player.play("take_damage")
		health=new_health
		if health<1:
			bank.gold+=loot
			queue_free()
@onready var base : Base = get_tree().get_first_node_in_group("base")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health=max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio == 1.0:
		base.take_damage()
		queue_free()
	
