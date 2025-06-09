class_name CapturedUnit extends Area2D

signal collected

func _on_body_entered(body: Node2D) -> void:
	if not body is Unit: return
	collected.emit()
	queue_free()
