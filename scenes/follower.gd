class_name Follower extends PathFollow2D

const DISTANCE_FROM_OTHERS := 55.0
func _ready() -> void:
	update_progress()

func update_progress() -> void:
	progress = (get_index() + 1) * DISTANCE_FROM_OTHERS
