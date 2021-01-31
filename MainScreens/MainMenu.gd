extends Node2D

func _ready():
	MusicManager.play(MusicManager.Music.NIVEL_1)

func _on_Start_body_entered(body):
	if body == $Player:
#		get_tree().change_scene("res://Tests/GameplayTest.tscn")
		Transition.change_scene("res://Game/Levels/Level_1/Level_1.tscn")


func _on_Exit_body_entered(body):
	if body == $Player:
		get_tree().quit()
