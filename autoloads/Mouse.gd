extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$AnimationPlayer.play("Default")
	
func play_danger():
	$AnimationPlayer.play("Danger")	

func play_safety():
	$AnimationPlayer.play("Safety")

func reset():
	$AnimationPlayer.play("Default")

func _process(delta):
	global_position = get_viewport().get_mouse_position()
