extends KinematicBody2D


func _on_Enemy_mouse_entered():
	Mouse.play_danger()

func _on_Enemy_mouse_exited():
	Mouse.reset()
