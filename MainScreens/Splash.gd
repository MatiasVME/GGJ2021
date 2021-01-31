extends Node2D


func _ready():
	pass


func _on_Anim_animation_finished(anim_name):
	Transition.change_scene("res://MainScreens/MainMenu.tscn")
