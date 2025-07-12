class_name UnitParade extends Node2D

const UNIT = preload("res://scenes/unit_parade/unit.tscn")
const FOLLOWER = preload("res://scenes/unit_parade/follower.tscn")
const PATH_POINT_DISTANCE := 30.0

@onready var path: Path2D = $Path
@onready var lead: Lead = $Lead
@onready var unit_container: Node = $UnitContainer

func _ready() -> void:
	add_new_lead_unit()

func _process(_delta: float) -> void:
	var distance_to_last_point = lead.position.distance_to(path.curve.get_point_position(1))
	
	if distance_to_last_point >= PATH_POINT_DISTANCE:
		path.curve.add_point(lead.position, Vector2.ZERO, Vector2.ZERO, 0)
	path.curve.set_point_position(0, lead.position)

func add_new_lead_unit() -> void:
	var unit := UNIT.instantiate()
	unit.tree_exiting.connect(_on_lead_unit_tree_exiting)
	lead.unit = unit
	unit_container.add_child(unit)

func _on_lead_unit_tree_exiting() -> void:
	if path.get_child_count() >= 1:
		call_deferred("set_next_unit_as_lead")
	
func set_next_unit_as_lead() -> void:
	var next_follower = path.get_child(0)
	lead.position = next_follower.position
	lead.direction = (next_follower.position - path.curve.get_point_position(2)).normalized()
	path.curve.remove_point(0)
	
	var next_unit: Unit = next_follower.unit
	lead.unit = next_unit
	next_unit.tree_exited.connect(_on_lead_unit_tree_exiting)
	next_follower.free()

func add_new_follower() -> void:
	var follower = FOLLOWER.instantiate()
	var unit = UNIT.instantiate()
	follower.unit = unit
	
	unit_container.add_child(unit)
	path.add_child(follower)
	
func _on_captured_unit_collected() -> void:
	call_deferred("add_new_follower")

func _on_path_child_order_changed() -> void:
	for follower: Follower in path.get_children():
		follower.update_progress()

func get_unit_following_node2d(node2d: Node2D) -> Node2D:
	for unit: Unit in unit_container.get_children():
		if unit.node2d_to_follow == node2d:
			return unit
	return null
