class_name Follower extends PathFollow2D

const DISTANCE_FROM_OTHERS := 35.0

@export var unit: Unit: set = set_unit

func set_unit(value: Unit):
	unit = value
	unit.tree_exiting.connect(_on_unit_tree_exiting)

func _ready() -> void:
	update_progress()

func update_progress() -> void:
	progress = (get_index() + 1) * DISTANCE_FROM_OTHERS

func _process(_delta: float) -> void:
	if unit:
		unit.position_to_follow = global_position

func _on_unit_tree_exiting() -> void:
	queue_free()
