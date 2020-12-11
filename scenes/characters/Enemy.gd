extends KinematicBody2D


func _on_Area2D_mouse_entered():
	Mouse.play_danger()

func _on_Area2D_mouse_exited():
	Mouse.reset()
