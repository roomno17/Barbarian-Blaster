extends Camera3D
@export var gridmap : GridMap
@export var turret_manager : TurretManager
@onready var ray_cast_3d: RayCast3D = $RayCast3D
@export_enum("easy","medium","hard") var difficulty : String = "medium"
@onready var bank: MarginContainer = get_tree().get_first_node_in_group("bank")
var tower_dict = {"easy":50,"medium":100,"hard":150}
var tower_cost :int
func _ready() -> void:
	print(difficulty)
	tower_cost = tower_dict[difficulty]
func _process(delta: float) -> void:
	var mouse_position : Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position)*100
	ray_cast_3d.force_raycast_update()
	
	if ray_cast_3d.is_colliding():
		var collider = ray_cast_3d.get_collider()
		if collider is GridMap:
				var collision_point = ray_cast_3d.get_collision_point()
				var cell = gridmap.local_to_map(collision_point)
				if gridmap.get_cell_item(cell) ==0:
					Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
					if Input.is_action_just_pressed("click"):
						if bank.gold >= tower_cost:
							bank.gold-=tower_cost
							gridmap.set_cell_item(cell,1)
							var tile_position = gridmap.map_to_local(cell)
							turret_manager.build_turret(tile_position)
				else:
					Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	else:
					Input.set_default_cursor_shape(Input.CURSOR_ARROW)
