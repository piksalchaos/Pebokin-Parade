extends Node2D

const PATH_POINT_DISTANCE := 75.0

@onready var units: Node2D = $Units
@onready var path: Path2D = $Path

func _process(_delta: float) -> void:
	var lead_unit_position: Vector2 = units.get_child(0).position
	var last_point_position: Vector2 = path.curve.get_point_position(path.curve.point_count-2)
	
	path.curve.set_point_position(path.curve.point_count-1, lead_unit_position)
	if lead_unit_position.distance_to(last_point_position) >= PATH_POINT_DISTANCE:
		path.curve.add_point(lead_unit_position)
