class_name CapturedUnitSpawner extends Node2D

const CAPTURED_UNIT = preload("res://scenes/captured_unit_spawner/captured_unit.tscn")
const MAX_SPAWN_ATTEMPT_COUNT = 30

@export var spawn_area_bounds: Vector2 = Vector2(500, 500)

@onready var query_area: Area2D = $QueryArea
@onready var retry_spawn_timer: Timer = $RetrySpawnTimer

func begin() -> void:
	randomize_query_area_position()
	retry_spawn_timer.start()

func attempt_spawn() -> void:
	if query_area.has_overlapping_areas():
		retry_spawn_timer.start()
	else:
		var captured_unit := CAPTURED_UNIT.instantiate()
		captured_unit.collected.connect(_on_captured_unit_collected)
		captured_unit.position = query_area.position
		call_deferred("add_child", captured_unit)
	randomize_query_area_position()


func randomize_query_area_position() -> void:
	query_area.position = Vector2(
		(randf() - 0.5) * spawn_area_bounds.x,
		(randf() - 0.5) * spawn_area_bounds.y
	)

func _on_captured_unit_collected() -> void:
	retry_spawn_timer.start()

func _on_retry_spawn_timer_timeout() -> void:
	attempt_spawn()
