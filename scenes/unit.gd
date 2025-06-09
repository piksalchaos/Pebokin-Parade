class_name Unit extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D

const MAX_SPEED := 300.0
const ACCELERATION := 1000.0

var pellet_parent: Node = self

func _process(delta: float) -> void:
	var direction = Vector2.ZERO
	if get_index() == 0:
		direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	
	velocity.x = move_toward(velocity.x, direction.x * MAX_SPEED, ACCELERATION * delta)
	velocity.y = move_toward(velocity.y, direction.y * MAX_SPEED, ACCELERATION * delta)
	
	move_and_slide()
	
	if direction.x > 0:
		sprite_2d.flip_h = false
	elif direction.x < 0:
		sprite_2d.flip_h = true
