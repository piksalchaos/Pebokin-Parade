class_name HitComponent extends Area2D

signal hit
func _on_area_entered(area: Area2D) -> void:
	if area is ShooterBullet:
		hit.emit()
