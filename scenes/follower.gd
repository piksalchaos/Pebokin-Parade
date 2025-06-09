class_name Follower extends PathFollow2D

const DISTANCE_FROM_OTHERS := 55.0
func _ready() -> void:
	progress = (get_index() + 1) * DISTANCE_FROM_OTHERS
