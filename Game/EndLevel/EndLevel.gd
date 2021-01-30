extends Area2D



func _on_EndLevel_body_entered(body):
	if body is Player:
		Transition.change_scene("res://Game/Levels/Level_1/Level_1.tscn")
