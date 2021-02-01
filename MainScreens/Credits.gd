extends Node2D


func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
			Transition.change_scene("res://MainScreens/MainMenu.tscn")


func _on_Credits_pressed():
	Transition.change_scene("res://MainScreens/MainMenu.tscn")
