extends Node2D

func _on_Start_body_entered(body):
	if body == $Player:
		get_tree().change_scene("res://Tests/GameplayTest.tscn")


func _on_Exit_body_entered(body):
	if body == $Player:
		get_tree().quit()
