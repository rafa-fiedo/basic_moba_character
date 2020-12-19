extends KinematicBody2D

enum State {Move, Attack}

var speed = Vector2(64, 64) # 64 pixels by second
var last_mouse_pos = null
var target_body_clicked = null
var state = State.Move
var attack_range = 20

var player_damage = 40

func _input(event):
	if event.is_action_pressed("game_move"):
		last_mouse_pos = get_viewport().get_mouse_position()
		target_body_clicked = Mouse.target_body
		
		if Mouse.is_danger():
			state = State.Attack
		else:
			state = State.Move
		

func _physics_process(delta):
	
	if last_mouse_pos:
		if state == State.Attack and target_body_clicked:
			if global_position.distance_to(target_body_clicked.global_position) < attack_range:
				attack()
				return
		
		
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

func hit():
	if not target_body_clicked:
		return
	
	target_body_clicked.damage(player_damage)

func attack():
	var attack_direction = global_position.direction_to(target_body_clicked.global_position)
	
	# remember to do not copy paste functions, always try to make a function from it
	# I didn't do it because it was much easier to focus on tutorial subject
	if attack_direction.x > attack_direction.y && attack_direction.x < -attack_direction.y:
		$AnimationPlayer.play("AttackTop")
	elif attack_direction.x < attack_direction.y && attack_direction.x > -attack_direction.y:
		$AnimationPlayer.play("AttackBottom")
	else:
		$AnimationPlayer.play("AttackSide")
		$Sprite.flip_h = attack_direction.x < 0
