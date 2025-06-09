class_name Follower extends PathFollow2D

const DISTANCE_FROM_OTHERS := 75.0
func _ready() -> void:
	progress = get_index() * DISTANCE_FROM_OTHERS
