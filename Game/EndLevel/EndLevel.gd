extends Area2D

export(String, FILE, "*.tscn") var next_scene

func _on_EndLevel_body_entered(body):
	if body is Player:
		Transition.change_scene(next_scene)
