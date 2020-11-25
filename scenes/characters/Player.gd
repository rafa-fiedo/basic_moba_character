extends KinematicBody2D

var speed = Vector2(64, 64) # 64 pixels by second
var last_mouse_pos = null

func _input(event):
	if event.is_action_pressed("game_move"):
		last_mouse_pos = get_viewport().get_mouse_position()

func _physics_process(delta):
	
	if last_mouse_pos:
		var direction_vector = (last_mouse_pos - global_position)
		
		if direction_vector.length() < 3:
			return
		
		var velocity = move_and_slide(direction_vector.normalized() * speed)
		
		if velocity.x > velocity.y && velocity.x < -velocity.y:
			$AnimationPlayer.play("MoveTop")
		elif velocity.x < velocity.y && velocity.x > -velocity.y:
			$AnimationPlayer.play("MoveBottom")
		else:
			$AnimationPlayer.play("MoveSide")
			$Sprite.flip_h = velocity.x < 0
