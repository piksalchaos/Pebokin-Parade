class_name Follower extends PathFollow2D

const DISTANCE_FROM_OTHERS := 35.0
func _ready() -> void:
	update_progress()

func update_progress() -> void:
	progress = (get_index() + 1) * DISTANCE_FROM_OTHERS
