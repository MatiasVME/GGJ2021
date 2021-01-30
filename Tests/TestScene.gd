extends Node2D

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()


func _on_Area2D_body_entered(body):
	if body == $Player:
		get_tree().reload_current_scene()

