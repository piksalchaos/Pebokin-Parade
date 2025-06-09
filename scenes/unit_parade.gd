class_name UnitParade extends Node2D

const UNIT = preload("res://scenes/unit.tscn")
const FOLLOWER = preload("res://scenes/follower.tscn")
const PATH_POINT_DISTANCE := 75.0

@onready var path: Path2D = $Path
@onready var lead: Lead = $Lead

func _process(_delta: float) -> void:
	var distance_to_last_point = lead.position.distance_to(path.curve.get_point_position(1))
	
	if distance_to_last_point >= PATH_POINT_DISTANCE:
		path.curve.add_point(lead.position, Vector2.ZERO, Vector2.ZERO, 0)
	path.curve.set_point_position(0, lead.position)

func add_new_follower() -> void:
	var follower = FOLLOWER.instantiate()
	var unit = UNIT.instantiate()
	
	follower.add_child(unit)
	path.add_child(follower)

func _on_captured_unit_collected() -> void:
	call_deferred("add_new_follower")
