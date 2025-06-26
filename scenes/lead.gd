class_name Lead extends Marker2D

const MAX_SPEED := 180.0
const ACCELERATION := 1000.0
const ROTATION_SPEED := 9.0

@export var follower_path: Path2D
var velocity := Vector2.ZERO
var direction := Vector2.RIGHT
var speed := 0.0

func _process(delta: float) -> void:
	var input_direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	var target_direction = input_direction.normalized()
	if target_direction.length_squared() > 0:
		var angle_to_target = direction.angle_to(target_direction)
		direction = direction.rotated(move_toward(0, angle_to_target, ROTATION_SPEED * delta))
	speed = move_toward(speed, target_direction.length() * MAX_SPEED, ACCELERATION * delta)
	
	if is_alone():
		velocity = target_direction * speed
	else:
		velocity = direction * speed
	position += velocity * delta

func is_alone():
	if not follower_path:
		return true
	return follower_path.get_child_count() == 0
