extends CharacterBody2D

const SPEED := 60.0
var closest_unit: Unit

func _ready() -> void:
	closest_unit = get_closest_unit()

func _physics_process(_delta: float) -> void:
	if closest_unit:
		velocity = (closest_unit.global_position - global_position).normalized() * SPEED
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func get_closest_unit() -> Unit:
	var units := get_tree().get_nodes_in_group("units")
	print(units.size())
	var closest_unit_distance = INF
	var closest_unit
	for unit in units:
		var unit_distance = global_position.distance_squared_to(unit.global_position)
		print(unit_distance)
		if unit_distance < closest_unit_distance:
			closest_unit_distance = unit_distance
			closest_unit = unit
	return closest_unit

func _on_new_closest_unit_timer_timeout() -> void:
	closest_unit = get_closest_unit()
