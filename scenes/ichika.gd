extends CharacterBody2D

const MAX_SPEED := 300.0
const ACCELERATION := 1000.0


func _process(delta: float) -> void:
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	
	velocity.x = move_toward(velocity.x, direction.x * MAX_SPEED, ACCELERATION * delta)
	velocity.y = move_toward(velocity.y, direction.y * MAX_SPEED, ACCELERATION * delta)
	
	move_and_slide()
