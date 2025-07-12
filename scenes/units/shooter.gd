extends Area2D

const SHOOTER_BULLET = preload("res://scenes/units/shooter_bullet.tscn")
@onready var shoot_timer: Timer = $ShootTimer

func attempt_shoot():
	var closest_enemy_distance = INF
	var closest_enemy_position: Vector2
	for body in get_overlapping_bodies():
		if not body.is_in_group("enemies"):
			continue
		var enemy_position = body.global_position
		var enemy_distance = global_position.distance_squared_to(enemy_position)
		if enemy_distance < closest_enemy_distance:
			closest_enemy_distance = enemy_distance
			closest_enemy_position = enemy_position
	if closest_enemy_position:
		var bullet = SHOOTER_BULLET.instantiate()
		bullet.direction = (closest_enemy_position - global_position).normalized()
		bullet.position = global_position
		Global.projectile_container.add_child(bullet)

func _on_shoot_timer_timeout() -> void:
	attempt_shoot()

func _on_body_entered(body: Node2D) -> void:
	if shoot_timer.is_stopped():
		attempt_shoot()
		shoot_timer.start()

func _on_body_exited(body: Node2D) -> void:
	if get_overlapping_bodies().size() == 0:
		shoot_timer.stop()
