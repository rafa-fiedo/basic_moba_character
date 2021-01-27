extends Node2D

var radius_range = 150

func _input(event):
	if event.is_action_pressed("game_move"):
		var mouse_pos = get_global_mouse_position()
		if mouse_pos.distance_to(get_parent().global_position) < radius_range:
			get_parent().use_teleport_effect()
			get_parent().global_position = get_global_mouse_position()
		queue_free()

func _draw():
	draw_arc(position, radius_range, 0, deg2rad(360), 100, Color.green)
	
