class_name Unit extends Area2D

const SPEED_FACTOR = 20
@onready var sprite_2d: Sprite2D = $Sprite2D
var position_to_follow: Vector2

signal entered_unit(unit)

func set_position_to_follow(new_position_to_follow: Vector2):
	position_to_follow = new_position_to_follow
	
func _process(delta: float) -> void:
	if not position_to_follow: return
	var position_difference := position_to_follow - global_position
	position += position_difference * SPEED_FACTOR * delta

func _on_area_entered(area: Area2D) -> void:
	if area is DangerArea:
		queue_free()
		return
	if area is Unit:
		entered_unit.emit(area)
