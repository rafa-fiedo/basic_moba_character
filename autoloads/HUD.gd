extends CanvasLayer

var player_node = null

func _on_Item_pressed():
	if player_node:
		player_node.use_blink_dagger()

func _on_Item_mouse_entered():
	Mouse.play_safety()
	_on_Items_mouse_entered()

func _on_Item_mouse_exited():
	Mouse.reset()
	_on_Items_mouse_exited()

func _on_Items_mouse_entered():
	Mouse.can_player_move = false

func _on_Items_mouse_exited():
	Mouse.can_player_move = true
