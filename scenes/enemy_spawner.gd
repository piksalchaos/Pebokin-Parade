extends Node2D

const BASIC_ENEMY = preload("res://scenes/enemies/basic_enemy.tscn")
@export var spawn_area_bounds: Vector2 = Vector2(600, 600)

func _on_timer_timeout() -> void:
	var spawn_position: Vector2
	if randf() > 0.5:
		spawn_position.x = randf_range(-0.5, 0.5) * spawn_area_bounds.x
		spawn_position.y = spawn_area_bounds.y / 2 * (1 if randf() > 0.5 else -1)
	else:
		spawn_position.y = randf_range(-0.5, 0.5) * spawn_area_bounds.y
		spawn_position.x = spawn_area_bounds.x / 2 * (1 if randf() > 0.5 else -1)
	var enemy = BASIC_ENEMY.instantiate()
	enemy.position = spawn_position
	add_child(enemy)
