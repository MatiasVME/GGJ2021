extends Node2D

func _ready():
	$Respawn.set_player($Player)
	MusicManager.play(MusicManager.Music.NIVEL_4)

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()


func _on_Area2D_body_entered(body):
	if body == $Player:
		$Anim.play("New Anim")


func _on_Anim_animation_finished(anim_name):
	Transition.change_scene("res://MainScreens/Credits.tscn")
