extends CanvasLayer

# reference to danger/safety body like enemies or items
var target_body = null
var can_player_move = true

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	reset()
	
func play_danger(body):
	$AnimationPlayer.play("Danger")	
	target_body = body

func play_safety(body=null):
	$AnimationPlayer.play("Safety")
	target_body = body

func reset():
	$AnimationPlayer.play("Default")
	target_body = null
	
func is_danger():
	return $AnimationPlayer.current_animation == "Danger"

func _process(delta):
	$Sprite.position = get_viewport().get_mouse_position()
