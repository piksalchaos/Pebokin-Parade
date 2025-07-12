extends Node2D

const CAPTURED_UNIT = preload("res://scenes/captured_unit_spawner/captured_unit.tscn")
@onready var unit_parade: UnitParade = $UnitParade
@onready var captured_unit_spawner: CapturedUnitSpawner = $CapturedUnitSpawner
@onready var projectile_container: Node = $ProjectileContainer

func _ready() -> void:
	Global.projectile_container = projectile_container
	captured_unit_spawner.begin()

func _on_captured_unit_spawner_child_entered_tree(node: Node) -> void:
	if not node is CapturedUnit: return
	node.collected.connect(unit_parade._on_captured_unit_collected)
