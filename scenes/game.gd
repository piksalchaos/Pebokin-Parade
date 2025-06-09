extends Node2D

const CAPTURED_UNIT = preload("res://scenes/captured_unit.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_captured_unit()

func spawn_captured_unit():
	var captured_unit = CAPTURED_UNIT.instantiate()
	# rewrite line below to set dog position based on dog's currect width/height and the width/height of the stage
	captured_unit.position = Vector2(randf_range(-640, 640), randf_range(-640, 640))
	captured_unit.collected.connect(_on_captured_unit_collected)
	add_child(captured_unit)

func _on_captured_unit_collected():
	call_deferred("spawn_captured_unit")
