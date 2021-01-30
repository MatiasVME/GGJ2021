extends Node2D


func _on_Area2D_body_entered(body):
	if body == $KinematicBody2D:
		get_tree().reload_current_scene()
