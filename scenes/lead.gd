class_name Lead extends Marker2D

const MAX_SPEED := 300.0
const ACCELERATION := 1000.0
const ROTATION_SPEED := 7.0

var velocity := Vector2.ZERO
var direction := Vector2.RIGHT
var speed := 0.0
var is_turning_sharply := false

func _process(delta: float) -> void:
	var input_direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	var target_direction = input_direction.normalized()
	if target_direction.length_squared() > 0:
		var angle_to_target = direction.angle_to(target_direction)
		direction = direction.rotated(move_toward(0, angle_to_target, ROTATION_SPEED * delta))
	speed = move_toward(speed, target_direction.length() * MAX_SPEED, ACCELERATION * delta)
	
	velocity.x = direction.x * speed
	velocity.y = direction.y * speed
	position += velocity * delta
