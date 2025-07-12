class_name ShooterBullet extends Area2D

const SPEED = 200
@export var direction: Vector2 = Vector2.RIGHT

func _process(delta: float) -> void:
	position += direction * SPEED * delta

func _on_area_entered(area: Area2D) -> void:
	if area is HitComponent:
		queue_free()

func _on_body_entered(_body: Node2D) -> void:
	queue_free()
