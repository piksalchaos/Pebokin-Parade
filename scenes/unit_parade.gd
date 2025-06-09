extends Node2D

const PATH_POINT_DISTANCE := 75.0

@onready var path: Path2D = $Path
@onready var lead: Marker2D = $Lead

func _process(_delta: float) -> void:
	var last_point_position: Vector2 = path.curve.get_point_position(1)
	
	path.curve.set_point_position(0, lead.position)
	if lead.position.distance_to(last_point_position) >= PATH_POINT_DISTANCE:
		path.curve.add_point(lead.position, Vector2.ZERO, Vector2.ZERO, 0)
