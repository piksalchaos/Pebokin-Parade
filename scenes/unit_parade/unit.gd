class_name Unit extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
var position_to_follow: Vector2
#var is_leader := false

#func set_lead(lead: Lead):
	#node2d_to_follow = lead
	#is_leader = true
#
#func set_follower(follower: Follower):
	#node2d_to_follow = follower
	#is_leader = false

func set_position_to_follow(new_position_to_follow: Vector2):
	position_to_follow = new_position_to_follow
	
func _process(delta: float) -> void:
	if position_to_follow:
		position = position_to_follow

func _on_area_entered(area: Area2D) -> void:
	if area is DangerArea:
		queue_free()
		return
	if area is Unit:
		var area_parent = area.get_parent()
		if get_parent() is Lead and area_parent is Follower and area_parent.get_index() > 0:
			queue_free()
