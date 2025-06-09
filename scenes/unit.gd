class_name Unit extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
var last_global_position := global_position

func _process(delta: float) -> void:
	var velocity = (global_position - last_global_position) / delta
	
	if velocity.x > 0:
		sprite_2d.flip_h = false
	elif velocity.x < 0:
		sprite_2d.flip_h = true
	
	last_global_position = global_position
