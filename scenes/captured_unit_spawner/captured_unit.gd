class_name CapturedUnit extends Area2D

signal collected

func _on_area_entered(area: Area2D) -> void:
	if not area is Unit: return
	collected.emit()
	queue_free()
