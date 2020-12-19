extends KinematicBody2D

export(int) var hitpoints = 100

func _on_Area2D_mouse_entered():
	Mouse.play_danger(self)

func _on_Area2D_mouse_exited():
	Mouse.reset()

func damage(damage_count):
	hitpoints -= damage_count
	if hitpoints <= 0:
		queue_free()
